//
//  LocalAuthController.swift
//  Trashure
//
//  Created by Andika on 11/22/20.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthController: ObservableObject {
    
    @Published var loggedInUser: User?
    @Published var isAuthenticating = false
    @Published var isOnProgress = false
    @Published var isError = false
    @Published var error: NSError?
    
    @Published var userData = [Any]()
    
    static let shared = AuthController()
    
    private let auth = Auth.auth()
    private let db = Firestore.firestore().collection("users")
    
    private var dob = ""
    private var mob = ""
    private var yob = ""
    
    func updateField(field: String, key: String, value: String) {
        let userId = self.id
        
        UserDefaults.standard.set(value, forKey: key)
        if userId != "" {
            self.db.document(userId).updateData(["\(field)": value]) { (error) in
                if error != nil {
                    self.isError = true
                    self.error = error! as NSError
                }
            }
        }
    }
    
    @Published var id: String {
        didSet {
            UserDefaults.standard.set(id, forKey: "auth_id")
        }
    }
    
    @Published var firstName: String {
        didSet {
            updateField(field: "first_name", key: "auth_firstName", value: firstName)
        }
    }
    
    @Published var lastName: String {
        didSet {
            updateField(field: "last_name", key: "auth_lastName", value: lastName)
        }
    }
    
    @Published var email: String {
        didSet {
            updateField(field: "email", key: "auth_email", value: email)
        }
    }
    
    @Published var phone: String {
        didSet {
            updateField(field: "phone", key: "auth_phone", value: phone)
        }
    }
    
    @Published var birthday: Array<String> {
        didSet {
            UserDefaults.standard.set(birthday, forKey: "auth_dob")
        }
    }
    
    init() {
        id = UserDefaults.standard.string(forKey: "auth_id") ?? ""
        firstName = UserDefaults.standard.string(forKey: "auth_firstName") ?? ""
        lastName = UserDefaults.standard.string(forKey: "auth_lastName") ?? ""
        email = UserDefaults.standard.string(forKey: "auth_email") ?? ""
        phone = UserDefaults.standard.string(forKey: "auth_phone") ?? ""
        birthday = UserDefaults.standard.array(forKey: "auth_dob") as? Array<String> ?? ["00", "00", "0000"]
    }
    
    func register(firstName: String, lastName: String, email: String, password: String, phone: String, dob: Array<String>) {
        self.isAuthenticating = true
        self.isError = false
        self.error = nil
        
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.dob = dob[0]
        self.mob = dob[1]
        self.yob = dob[2]

        auth.createUser(withEmail: email, password: password, completion: handleRegisterResultCompletion)
    }
    
    func login(email: String, password: String) {
        self.isAuthenticating = true
        self.isError = false
        self.error = nil
        
        auth.signIn(withEmail: email, password: password, completion: handleAuthResultCompletion)
    }
    
    func resetPassword(email: String) {
        self.isOnProgress = true
        self.isError = false
        self.error = nil
        
        auth.sendPasswordReset(withEmail: email, completion: handleResetResultCompletion(error:))
    }
    
    private func handleResetResultCompletion(error: Error?) {
        DispatchQueue.main.async {
            self.isOnProgress = false
            
            if let error = error {
                self.isError = true
                self.error = error as NSError
            }
        }
    }
    
    private func handleAuthResultCompletion(auth: AuthDataResult?, error: Error?) {
        DispatchQueue.main.async {
            self.isAuthenticating = false
                if let user = auth?.user {
                    self.loggedInUser = user
                    
                    self.db.document(user.uid).addSnapshotListener { (documentSnapsot, error) in
                        let data = documentSnapsot?.data()
                        
                        self.id = data?["id"] as? String ?? ""
                        self.firstName = data?["first_name"] as? String ?? ""
                        self.lastName = data?["last_name"] as? String ?? ""
                        self.email = data?["email"] as? String ?? ""
                        self.phone = data?["phone"] as? String ?? ""
                        self.birthday = data?["dob"] as? Array<String> ?? ["00", "00", "0000"]
                    }
                    
                    UserDefaults.standard.set(true, forKey: "signed_in")
                } else if let error = error {
                    self.isError = true
                    self.error = error as NSError
                }
        }
    }
    
    private func handleRegisterResultCompletion(auth: AuthDataResult?, error: Error?) {
        DispatchQueue.main.async {
            self.isAuthenticating = false
                if let user = auth?.user {
                    
                    let date = Date()
                    let format = DateFormatter()
                    format.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    let now = format.string(from: date)
                    
                    let credential = [
                        "id": user.uid,
                        "first_name": self.firstName,
                        "last_name": self.lastName,
                        "email": user.email!,
                        "phone": self.phone,
                        "dob": [
                            self.dob,
                            self.mob,
                            self.yob
                        ],
                        "createdTime": now
                    ] as [String : Any]
                    
                    self.db.document(user.uid).setData(credential as [String : Any]) { (error) in
                        if error != nil {
                            self.isError = true
                            self.error = error! as NSError
                        }
                    }
                    
                } else if let error = error {
                    self.isError = true
                    self.error = error as NSError
                }
        }
    }
    
    func signout() {
        self.isOnProgress = true
        
        DispatchQueue.main.async {
            do {
                sleep(2)
            }
            
            UserDefaults.standard.set(false, forKey: "signed_in")
            UserDefaults.standard.set("", forKey: "auth_id")

            self.isOnProgress = false
            
            try? self.auth.signOut()
            self.loggedInUser = nil
        }
    }
    
    func checkAuth() -> Bool {
        if  UserDefaults.standard.bool(forKey: "signed_in") != false {
            return true
        } else {
            return false
        }
    }
}
