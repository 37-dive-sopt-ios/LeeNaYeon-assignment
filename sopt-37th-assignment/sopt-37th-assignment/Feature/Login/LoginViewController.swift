//
//  LoginViewController.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 10/23/25.
//

import UIKit

final class LoginViewController: BaseViewController {
    
    private let rootView = LoginView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        setAddTarget()
        setDelegate()
    }
    
    override func setAddTarget() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension LoginViewController {
    @objc
    private func loginButtonDidTap() {
        
    }
}
