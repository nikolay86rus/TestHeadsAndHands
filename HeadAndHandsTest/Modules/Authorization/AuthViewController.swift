//
//  AuthViewController.swift
//  HeadAndHandsTest
//
//  Created by Nikolay Sabadash on 07/02/2019.
//  Copyright © 2019 NikiSaaab. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    //MARK: -  Outlets
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var forgetPasswordButton: UIButton! {
        didSet {
            forgetPasswordButton.layer.borderWidth = 0.5
            forgetPasswordButton.layer.borderColor = UIColor.veryLightPink.cgColor
            forgetPasswordButton.layer.cornerRadius = 4
        }
    }
    
    @IBOutlet weak var authorizedButton: AppButton! {
        didSet {
            authorizedButton.isEnabled = false
        }
    }
    
    @IBOutlet weak var noAccountButton: UIButton!
    
    //MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        registerNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        unregisterNotifications()
        dismissKeyboard()
    }
    
    //MARK: - Keyboard
    private func dismissKeyboard() {
        self.view.endEditing(false)
    }

    private func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func unregisterNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        guard let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let coverHeight = noAccountButton.frame.maxY - keyboardFrame.cgRectValue.minY
        UIView.animate(withDuration: 0.1) {
            if coverHeight > 0 {
                self.view.frame.origin.y = -(coverHeight + 16)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        UIView.animate(withDuration: 0.1) {
            self.view.frame.origin.y = 0
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        dismissKeyboard()
    }
    
    //MARK: - Segue
    private enum Segue: String {
        case registration, passwordRecovery, authorized
        
        var title: String {
            switch self {
            case .authorized: return "Вы вошли!"
            case .passwordRecovery: return "Сброс пароля"
            case .registration: return "Зарегистрируйтесь"
            }
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
            let segueType = Segue(rawValue: identifier) else { return }
        segue.destination.title = segueType.title
    }
}

    //MARK: - UITextFieldDelegate
extension AuthViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let email = emailTextField.text,
            let password = passwordTextField.text else { return }
        authorizedButton.isEnabled = email.isValidEmail() && password != ""
    }
    
}
