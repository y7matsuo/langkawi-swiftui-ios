//
//  EditNameViewModel.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/08.
//

import Combine
import SwiftUI

class EditNameViewModel: PresentedViewModel {
    @Published var userId: Int = 0
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var age: Int? = nil
    @Published var gender: GenderType = .male
    
    @Published var close: Bool = false
}
