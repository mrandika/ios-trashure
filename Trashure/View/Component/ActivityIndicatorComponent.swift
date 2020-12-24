//
//  ActivityIndicatorComponent.swift
//  Trashure
//
//  Created by Andika on 11/22/20.
//

import SwiftUI

struct ActivityIndicatorComponent: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorComponent>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicatorComponent>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
