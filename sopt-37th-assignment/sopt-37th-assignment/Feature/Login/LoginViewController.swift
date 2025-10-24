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
        rootView.idTextField.textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        rootView.passwordTextField.textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension LoginViewController {
    @objc
    private func loginButtonDidTap() {
        
    }
    
    @objc
    private func textFieldDidChange() {
        if let idText = rootView.idTextField.textField.text,
            let passwordText = rootView.passwordTextField.textField.text {
            rootView.loginButton.isEnabled = idText.isValidEmail && passwordText.isValidPassword
            rootView.loginButton.updateBaeminButtonStyle(style: rootView.loginButton.isEnabled ? .smallSelected : .smallNormal)
        }
    }
}


