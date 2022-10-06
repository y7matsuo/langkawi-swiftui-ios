//
//  AccountView.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/06.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            ContentViewWithNavigation(title: LabelDef.account) {
                Text("account")
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
