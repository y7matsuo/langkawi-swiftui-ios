//
//  AccountViewModel.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import UIKit
import SwiftUI
import Combine

class AccountViewModel: PresenterViewModel {
    @Published var userId: Int = 0
    
    @Published var avator: UIImage = UIImage()
    @Published var name: String = ""
    @Published var age: String = ""
    @Published var gender: String = ""
    @Published var genderColor: Color = .black
    @Published var description: String = ""
    
    @Published var showNameEdit: Bool = false
    @Published var showDescriptionEdit: Bool = false
}
