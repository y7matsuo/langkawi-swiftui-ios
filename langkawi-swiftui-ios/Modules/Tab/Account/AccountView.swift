//
//  AccountView.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/06.
//

import SwiftUI

struct AccountView: View {
    @ObservedObject var vm: AccountViewModel
    let presenter: AccountPresentation
    
    var body: some View {
        NavigationView {
            ContentViewWithNavigation(title: LabelDef.account) {
                VStack {
                    HStack {
                        Spacer()
                        Image(uiImage: vm.avator)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        Spacer()
                        SelectButton(image: "image") {}
                    }
                    .frame(height: 190)
                    .background(ColorDef.surface)
                    .cornerRadius(15)
                    .padding(.top)
                    .paddingHorizontal()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            HStack(alignment: .bottom) {
                                Text(vm.name)
                                    .font(Font.system(size: 20, weight: .bold))
                                    .padding(.trailing)
                                Text(vm.gender)
                                    .font(Font.system(size: 18))
                                    .foregroundColor(vm.genderColor)
                            }
                            .padding(.bottom)
                            Text(vm.age)
                                .font(Font.system(size: 20))
                        }.padding()
                        Spacer()
                        SelectButton(image: "pen-to-square") {}
                    }
                    .background(ColorDef.surface)
                    .cornerRadius(15)
                    .paddingHorizontal()
                    
                    HStack {
                        Text(vm.description)
                            .font(Font.system(size: 14))
                            .padding()
                        Spacer()
                        SelectButton(image: "pencil") {}
                    }
                    .background(ColorDef.surface)
                    .cornerRadius(15)
                    .paddingHorizontal()
                }
            }
        }.onAppear {
            presenter.fetchAccount()
        }
    }
    
    private func SelectButton(image: String, action: () -> Void) -> some View {
        Button(action: {}) {
            let label = UILabel.fontAwesome(type: .solid, name: image, color: .black, size: 25)
            Image(uiImage: label.toImage() ?? UIImage())
        }
        .frame(width: 40, height: 40)
        .background(ColorDef.primary)
        .cornerRadius(20)
        .padding()
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountPreviewRouter.assemble()
    }
}
