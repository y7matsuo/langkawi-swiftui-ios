//
//  EditNameView.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/08.
//

import SwiftUI
import Combine

struct EditNameView: View {
    @ObservedObject var vm: EditNameViewModel
    let presenter: EditNamePresentation
    
    @Environment(\.presentationMode) var presentedMode
    
    var body: some View {
        ContentViewWithNavigation(title: LabelDef.editName) {
            VStack(alignment: .leading) {
                textFieldRow(title: LabelDef.lastName, text: $vm.lastName)
                    .padding(.top)
                textFieldRow(title: LabelDef.firstName, text: $vm.firstName)
                    .padding(.bottom)
                buttonRow(
                    title: LabelDef.gender,
                    value: vm.gender.toLabel(),
                    color: vm.gender.toColor()
                )
                .padding(.bottom)
                buttonRow(
                    title: LabelDef.age,
                    value: vm.age.toAgeLabelText(),
                    color: .black
                )
                Spacer()
                HStack {
                    Spacer()
                    ButtonStyles.Primary(LabelDef.submit) {
                        presenter.updateUser(
                            firstName: vm.firstName,
                            lastName: vm.lastName,
                            age: vm.age,
                            gender: vm.gender
                        ) {
                            self.presentedMode.wrappedValue.dismiss()
                        }
                    }
                    Spacer()
                }
                .padding(.bottom)
            }
            .textFieldStyle(.roundedBorder)
            .paddingHorizontal()
        }
        .onAppear {
            presenter.fetchUser()
        }
        .configureCommonDialog(vm: vm)
    }
    
    private func textFieldRow(title: String, text: Binding<String>) -> some View {
        HStack {
            Text(title)
                .font(Font.system(size: 20, weight: .bold))
            TextField(title, text: text)
        }
    }
    
    private func buttonRow(title: String, value: String, color: Color) -> some View {
        HStack {
            Text(title)
                .font(Font.system(size: 20, weight: .bold))
            Button(action: {}) {
                Text(value)
                    .font(Font.system(size: 18))
                    .foregroundColor(color)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .background(ColorDef.surface)
                    .cornerRadius(10)
            }
        }
    }
}

struct EditNameView_Preview: PreviewProvider {
    static var previews: some View {
        EditNamePreviewRouter.assemble()
    }
}
