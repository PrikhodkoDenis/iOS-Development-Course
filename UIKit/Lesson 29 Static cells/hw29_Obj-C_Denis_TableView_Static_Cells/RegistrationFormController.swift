//
//  RegistrationFormTableViewController.swift
//  hw29_Obj-C_Denis_TableView_Static_Cells
//
//  Created by Denis on 25.01.2022.
//

import UIKit

class RegistrationFormController: UITableViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var clearAllButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSettings()
        hideKeyboard()
        configureSubviews()
    }
    
    private func configureSubviews() {
        registerButton.layer.cornerRadius = 10
        clearAllButton.layer.cornerRadius = 10
    }
    
    @IBAction func textChangeAction(_ sender: UITextField) {
        saveSettings()
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        saveSettings()
    }
    
    @IBAction func clearAllAction(_ sender: UIButton) {
        [firstNameField, lastNameField, loginField, passwordField, ageField, phoneField, emailField]
            .forEach { $0?.text = "" }
        saveSettings()
    }
}


private extension RegistrationFormController {
    
    @objc func hideKeyBoard() {
        [firstNameField, lastNameField, loginField, passwordField, ageField, phoneField, emailField]
            .forEach { $0.resignFirstResponder() }
    }
    
    private func hideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        view.addGestureRecognizer(tapGesture)
    }
}

private extension RegistrationFormController {
    
    func saveSettings() {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(firstNameField.text, forKey: Key.firstName.rawValue)
        userDefaults.setValue(lastNameField.text, forKey: Key.lastName.rawValue)
        userDefaults.setValue(loginField.text, forKey: Key.login.rawValue)
        userDefaults.setValue(passwordField.text, forKey: Key.password.rawValue)
        userDefaults.setValue(ageField.text, forKey: Key.age.rawValue)
        userDefaults.setValue(phoneField.text, forKey: Key.phone.rawValue)
        userDefaults.setValue(emailField.text, forKey: Key.email.rawValue)
    }
    
    func loadSettings() {
        let userDefaults = UserDefaults.standard
        firstNameField.text = userDefaults.string(forKey: Key.firstName.rawValue)
        lastNameField.text = userDefaults.string(forKey: Key.lastName.rawValue)
        loginField.text = userDefaults.string(forKey: Key.login.rawValue)
        passwordField.text = userDefaults.string(forKey: Key.password.rawValue)
        ageField.text = userDefaults.string(forKey: Key.age.rawValue)
        phoneField.text = userDefaults.string(forKey: Key.phone.rawValue)
        emailField.text = userDefaults.string(forKey: Key.email.rawValue)
    }
}

extension RegistrationFormController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0: lastNameField.becomeFirstResponder()
        case 1: loginField.becomeFirstResponder()
        case 2: passwordField.becomeFirstResponder()
        case 3: ageField.becomeFirstResponder()
        case 4: phoneField.becomeFirstResponder()
        case 5: emailField.becomeFirstResponder()
        case 6: textField.resignFirstResponder()
        default: break
        }
        
        return true
    }
    
    private func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField.tag {
        case 0:
            let restrictedSymbols = "\(Constant.symbols.rawValue)\(Constant.numbers.rawValue)"
            guard restrictedSymbols.contains(string) else { return true }
        case 1:
            let restrictedSymbols = "\(Constant.symbols.rawValue)\(Constant.numbers.rawValue)"
            guard restrictedSymbols.contains(string) else { return true }
        case 2:
            let restrictedSymbols = "\(Constant.symbols.rawValue)\(Constant.russianLetters.rawValue)"
            guard restrictedSymbols.contains(string) else { return true }
        case 3:
            let restrictedSymbols = "\(Constant.symbols.rawValue)\(Constant.russianLetters.rawValue)"
            guard restrictedSymbols.contains(string) else { return true }
        case 4:
            let restrictedSymbols = "\(Constant.englishLetters.rawValue)\(Constant.russianLetters.rawValue)\(Constant.symbols.rawValue)"
            guard !restrictedSymbols.contains(string) else { return false }
            guard let text = textField.text else { return false }
            guard text.count < 2 else { return false }
            return true
        case 5:
            guard let text = textField.text else { return false }
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            textField.text = format(with: "+X (XXX) XXX-XXXX", phone: newString)
        case 6:
            let restrictedSymbols = "\(Constant.symbolsEmail.rawValue)\(Constant.russianLetters.rawValue)"
            guard !restrictedSymbols.contains(string) else { return false }
            guard let text = textField.text else { return false }
            
            if (string == "@" && text.contains("@")) ||
                (string == "." && text.contains(".")) ||
                text.count > 30 {
                return false
            }
            return true
            
        default:
            break
        }
        return false
    }
}
