//
//  BaseViewModel.swift
//  langkawi-swiftui-ios
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2022/10/07.
//

import Combine
import Alamofire

struct AlertContent {
    let title: String?
    let message: String?
}

class BaseViewModel: ObservableObject {
    @Published var showLogin: Bool = false
    @Published var showAlert: Bool = false
    @Published var alertContent: AlertContent? = nil
    
    var cancellables = Set<AnyCancellable>()
    
    func onError(error: Error) {
        switch error {
        case let err as APIStatusError:
            switch err.status {
            case 401:
                showLogin = true
                return
            default:
                break
            }
            alertContent = AlertContent(
                title: err.response.error,
                message: err.response.exception
            )
        case let err as AFError:
            alertContent = AlertContent(
                title: nil,
                message: err.localizedDescription
            )
        default:
            alertContent = AlertContent(
                title: nil,
                message: error.localizedDescription
            )
        }
        showAlert = true
    }
    
    func sinkLogin(action: @escaping () -> Void) {
        $showLogin.dropFirst().sink {
            guard $0 == false else {
                return
            }
            action()
        }.store(in: &cancellables)
    }
}
