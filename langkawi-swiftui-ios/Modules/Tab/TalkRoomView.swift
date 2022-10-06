//
//  TalkRoomView.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/06.
//

import SwiftUI

struct TalkRoomView: View {
    var body: some View {
        NavigationView {
            ContentViewWithNavigation(title: LabelDef.talkRoom) {
                Text("talk room")
            }
        }
    }
}

struct TalkRoomView_Previews: PreviewProvider {
    static var previews: some View {
        TalkRoomView()
    }
}
