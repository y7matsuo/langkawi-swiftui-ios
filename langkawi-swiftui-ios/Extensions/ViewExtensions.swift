//
//  ViewExtensions.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import SwiftUI

extension View {
    
    func showAlert(isPresented: Binding<Bool>, content: AlertContent?) -> some View {
        alert(isPresented: isPresented) {
            Alert(title: Text(content?.title ?? ""), message: Text(content?.message ?? ""))
        }
    }
    
    func showLogin(isPresented: Binding<Bool>) -> some View {
        fullScreenCover(isPresented: isPresented) {
            LoginRouter.assemble(isPresented: isPresented)
        }
    }
    
    func paddingHorizontal(_ length: CGFloat? = nil) -> some View {
        padding(.leading, length).padding(.trailing, length)
    }
}
