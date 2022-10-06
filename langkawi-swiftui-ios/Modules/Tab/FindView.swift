//
//  FindView.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/06.
//

import SwiftUI

struct FindView: View {
    var body: some View {
        NavigationView {
            ContentViewWithNavigation(title: LabelDef.find) {
                Text("find")
            }
        }
    }
}

struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView()
    }
}
