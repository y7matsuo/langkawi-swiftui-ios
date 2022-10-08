//
//  AccountContract.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import SwiftUI

protocol AccountUseCase: BaseUseCase {
    func fetchUser(userId: Int)
    func fetchAvator(userId: Int)
}

protocol AccountInteractorOutput: BaseInteractorOutput {
    func onFetchUser(user: User)
    func onFetchAvator(image: UIImage)
}

protocol AccountPresentation: BasePresentation {
    func fetchAccount()
    func showNameEdit()
    func showDescriptionEdit()
}
