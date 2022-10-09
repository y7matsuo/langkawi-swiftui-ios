//
//  AccountPreviewRouter.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/08.
//

import SwiftUI

class AccountPreviewRouter {
    class AccountPresenter: AccountPresentation {
        func fetchAccount() {}
        func showNameEdit() {}
        func showDescriptionEdit() {}
    }
    
    static func assemble() -> some View {
        let vm = AccountViewModel()
        vm.avator = UIImage(named: "AvatorMan") ?? UIImage()
        vm.name = "松尾 勇気"
        vm.gender = "男性"
        vm.genderColor = .blue
        vm.age = "39歳"
        vm.description = "巡回かおつきこくふくする。かいころく川底そんけい。せいぞう盛り上がるやすい。いっかいずいぶんばい。せっとく野獣あい。冬休みしょうじょういち。碁じどうし靖国神社。"
        return AccountView(vm: vm, presenter: AccountPresenter())
    }
}
