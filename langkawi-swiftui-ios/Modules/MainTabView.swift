//
//  MainTabView.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/06.
//

import SwiftUI

struct MainTabView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(ColorDef.appBar)
    }
    
    var body: some View {
        TabView {
            HomeView().tabItem {
                tabItemImage(name: "house")
                Text(LabelDef.home)
            }
            FindView().tabItem {
                tabItemImage(name: "magnifying-glass")
                Text(LabelDef.find)
            }
            TalkRoomView().tabItem {
                tabItemImage(name: "comments")
                Text(LabelDef.talkRoom)
            }
            AccountView().tabItem {
                tabItemImage(name: "user")
                Text(LabelDef.account)
            }
        }
    }
    
    private func tabItemImage(name: String) -> Image {
        let label = UILabel.fontAwesome(type: .solid, name: name, color: .black, size: 20)
        return Image(uiImage: label.toImage() ?? UIImage())
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
