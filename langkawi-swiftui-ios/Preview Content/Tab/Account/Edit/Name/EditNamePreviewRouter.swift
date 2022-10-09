//
//  EditNamePreviewRouter.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/08.
//

import SwiftUI

class EditNamePreviewRouter {
    
    class EditNamePresenter: EditNamePresentation {
        private var onUpdateComplete: () -> Void = {}
        
        func fetchUser() {}
        
        func updateUser(firstName: String?, lastName: String?, age: Int?, gender: GenderType?, onComplete: @escaping () -> Void) {
            onUpdateComplete = onComplete
        }
    }
    
    static func assemble() -> some View {
        let vm = EditNameViewModel(isPresented: PreviewSupport.isPresented)
        vm.firstName = "勇気"
        vm.lastName = "松尾"
        vm.age = 39
        vm.gender = .male
        return EditNameView(vm: vm, presenter: EditNamePresenter())
    }
}
