//
//  ProviderPrefixRepo.swift
//  Trashure
//
//  Created by Andika on 11/29/20.
//

import Foundation

let tselPrefix = ["0811", "0812", "0813", "0821", "0822", "0823", "0851", "0852", "0853"]
let xlPrefix = ["0859", "0877", "0878", "0817", "0818", "0819"]
let threePrefix = ["0898", "0899", "0895", "0895", "0897"]
let indosatPrefix = ["0814", "0815", "0816", "0855", "0856", "0857", "0858"]
let smartfrenPrefix = ["0889", "0881", "0882", "0883", "0886", "0887", "0888", "0884", "0885"]
let axisPrefix = ["0832", "0833", "0838", "0831"]

func checkPrefix(prefix: String) -> String {
    var status: String = "Undefined"
    let number = prefix.prefix(4)
    
    let tsel = tselPrefix.filter { number.hasPrefix($0) }
    if !tsel.isEmpty {
        status = "TSEL"
    }
    
    let xl = xlPrefix.filter { number.hasPrefix($0) }
    if !xl.isEmpty {
        status = "XL"
    }
    
    let three = threePrefix.filter { number.hasPrefix($0) }
    if !three.isEmpty {
        status = "THREE"
    }
    
    let indosat = indosatPrefix.filter { number.hasPrefix($0) }
    if !indosat.isEmpty {
        status = "INDOSAT"
    }
    
    let smartfren = smartfrenPrefix.filter { number.hasPrefix($0) }
    if !smartfren.isEmpty {
        status = "SMARTFREN"
    }
    
    let axis = axisPrefix.filter { number.hasPrefix($0) }
    if !axis.isEmpty {
        status = "AXIS"
    }
    
    return status
}
