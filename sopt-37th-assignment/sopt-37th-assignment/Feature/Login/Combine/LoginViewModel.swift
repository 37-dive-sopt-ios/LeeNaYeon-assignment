//
//  LoginViewModel.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 12/3/25.
//

import Combine
import Foundation

final class LoginViewModel: ViewModelType {
    private var cancellables = Set<AnyCancellable>()
    
    private(set) var output: Output
    
    private let isLoginSuccessResultSubject: PassthroughSubject<Bool, Never> = .init()
    private let notValidTypeResultSubject: PassthroughSubject<String, Never> = .init()
    
    init() {
        output = Output(
            isSuccessLoginResultPublisher: isLoginSuccessResultSubject.eraseToAnyPublisher(),
            notValidTypeResultPublisher: notValidTypeResultSubject.eraseToAnyPublisher()
        )
    }
    
    func action(_ trigger: Input) {
        switch trigger {
        case .loginButtonDidTap(let id, let password):
            isValidIDandPassword(id: id, password: password)
        }
    }
}

extension LoginViewModel {
    enum Input {
        case loginButtonDidTap(id: String, password: String)
    }
    
    struct Output {
        let isSuccessLoginResultPublisher: AnyPublisher<Bool, Never>
        let notValidTypeResultPublisher: AnyPublisher<String, Never>
    }
}

extension LoginViewModel {
    private func isValidIDandPassword(id: String, password: String) {
        if id.isValidEmail && password.isValidPassword {
            isLoginSuccessResultSubject.send(true)
        } else {
            if !id.isValidPassword && !password.isValidPassword {
                notValidTypeResultSubject.send("이메일, 비밀번호")
            } else if !password.isValidPassword {
                notValidTypeResultSubject.send("비밀번호")
            }
            else {
                notValidTypeResultSubject.send("아이디")
            }
        }
    }
}
