//
//  HomeView.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/06.
//

import SwiftUI

struct HomeView: View {
    @State var loginPresented: Bool = true
    
    var body: some View {
        NavigationView {
            ContentViewWithNavigation(title: LabelDef.home) {
                Text("home")
            }
        }
        .showLogin(isPresented: $loginPresented)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
