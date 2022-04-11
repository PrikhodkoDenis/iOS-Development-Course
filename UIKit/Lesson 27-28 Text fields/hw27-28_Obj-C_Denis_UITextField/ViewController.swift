//
//  ViewController.swift
//  hw27-28_Obj-C_Denis_UITextField
//
//  Created by Denis on 18.01.2022.
//

/*
 Итак начинаем текстовые поля. Напоминаю, этот элемент очень распространен и не очень простой, поэтому уделите ему должное внимание. Начнем с простого, а после урока номер 28 я добавлю задания уровней повыше.
 Создаем форму для регистрации студента.
 Ученик.
 1. Создайте поля (и лейблы напротив как в уроке): имя, фамилия, логин, пароль, возраст, телефон, имеил адрес.
 2. Установите правильные виды клавиатур для каждого текстового поля.
 3. У всех текстовых полей кроме последнего кнопка ретерн должна быть NEXT, а у последнего DONE.
 4. Осуществите переход по кнопкам NEXT и уберите клаву с экрана кнопкой DONE.
 5. Каждое поле при нажатии должно иметь кнопку очистки
 Студент
 6. Совет, чтобы осуществить переход по NEXT без проверки тонны пропертей, попробуйте использовать UIOutletCollection
 7. Создайте соответствующие каждому текстовому полю UILabel чтобы выводить туда информацию из текстовых полей. Сделайте их мелкими и другого цвета.
 8. По изменению текста (даже буквы) обновляйте эти лейблы (не забудте про CLEAR button)
 Мастер
 9. Для поля ввода телефона используйте мой код из видео, можете поместить его в какой-то оотдельный метод если надо
 10. Этот код должен работать только для поля телефона и не для какого другого
 Супермен
 11. Для поля ввода имеила ограничте ввод символов недопустимых в адресе
 12. Более того, сибвол "@" может быть введен только 1 раз
 13. установите разумное ограничение для этого поля
 */

import UIKit

class ViewController: UIViewController {
    
    private let greetingLabel = LabelView(type: .greeting)
    private let firstNameLabel = LabelView(type: .firstName)
    private let lastNameLabel = LabelView(type: .lastName)
    private let loginLabel = LabelView(type: .login)
    private let passwordLabel = LabelView(type: .password)
    private let ageLabel = LabelView(type: .age)
    private let phoneNumberLabel = LabelView(type: .phoneNumber)
    private let emailLabel = LabelView(type: .email)
    
    private let copyFirst = LabelView(type: .copy)
    private let copyLast = LabelView(type: .copy)
    private let copyLogin = LabelView(type: .copy)
    private let copyPassword = LabelView(type: .copy)
    private let copyAge = LabelView(type: .copy)
    private let copyPhone = LabelView(type: .copy)
    private let copyEmail = LabelView(type: .copy)
    
    private let firstNameField = TextFieldView(type: .firstName)
    private let lastNameField = TextFieldView(type: .lastName)
    private let loginField = TextFieldView(type: .login)
    private let passwordField = TextFieldView(type: .password)
    private let ageField = TextFieldView(type: .age)
    private let phoneNumberField = TextFieldView(type: .phoneNumber)
    private let emailField = TextFieldView(type: .email)
    
    private let registerButton = ButtonView(type: .register)
    private let clearAllButton = ButtonView(type: .clearAll)
    
    private var commonStack = UIStackView()
    private var stack1 = UIStackView()
    private var stack2 = UIStackView()
    private var stack3 = UIStackView()
    private var stack4 = UIStackView()
    private var stack5 = UIStackView()
    private var stack6 = UIStackView()
    private var stack7 = UIStackView()
    private var stack8 = UIStackView()
    private var stack9 = UIStackView()
    private var stack10 = UIStackView()
    private var stack11 = UIStackView()
    private var stack12 = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(commonStack)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pressRegisterButton))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func configureSubviews() {
        firstNameField.becomeFirstResponder()
        
        stack1.addArrangedSubview(firstNameLabel)
        stack1.addArrangedSubview(firstNameField)
        stack2.addArrangedSubview(lastNameLabel)
        stack2.addArrangedSubview(lastNameField)
        stack3.addArrangedSubview(loginLabel)
        stack3.addArrangedSubview(loginField)
        stack4.addArrangedSubview(passwordLabel)
        stack4.addArrangedSubview(passwordField)
        stack5.addArrangedSubview(ageLabel)
        stack5.addArrangedSubview(ageField)
        stack6.addArrangedSubview(phoneNumberLabel)
        stack6.addArrangedSubview(phoneNumberField)
        stack7.addArrangedSubview(emailLabel)
        stack7.addArrangedSubview(emailField)
        stack8.addArrangedSubview(registerButton)
        stack8.addArrangedSubview(clearAllButton)
        
        stack9.addArrangedSubview(copyFirst)
        stack9.addArrangedSubview(copyLast)
        stack10.addArrangedSubview(copyLogin)
        stack10.addArrangedSubview(copyPassword)
        stack11.addArrangedSubview(copyAge)
        stack11.addArrangedSubview(copyPhone)
        stack12.addArrangedSubview(copyEmail)
        
        commonStack.addArrangedSubview(greetingLabel)
        commonStack.addArrangedSubview(stack1)
        commonStack.addArrangedSubview(stack2)
        commonStack.addArrangedSubview(stack3)
        commonStack.addArrangedSubview(stack4)
        commonStack.addArrangedSubview(stack5)
        commonStack.addArrangedSubview(stack6)
        commonStack.addArrangedSubview(stack7)
        commonStack.addArrangedSubview(stack8)
        commonStack.addArrangedSubview(stack9)
        commonStack.addArrangedSubview(stack10)
        commonStack.addArrangedSubview(stack11)
        commonStack.addArrangedSubview(stack12)
        
        [commonStack, stack1, stack2, stack3, stack4, stack5, stack6, stack7, stack8, stack9, stack10, stack11, stack12]
            .forEach {
                $0.distribution = .fillEqually
                $0.axis = .horizontal
                $0.alignment = .fill
                $0.spacing = 4
            }
        
        [firstNameField, lastNameField, loginField, passwordField, ageField, phoneNumberField, emailField ]
            .forEach {
                $0.delegate = self
                $0.addTarget(self, action: #selector(copyInfo), for: .editingChanged)
            }
        
        commonStack.axis = .vertical
        clearAllButton.addTarget(self, action: #selector(pressClearAllButton), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(pressRegisterButton), for: .touchUpInside)
    }
    
    private func makeConstraints() {
        commonStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            commonStack.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            commonStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            commonStack.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
            commonStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}

private extension ViewController {
    
    @objc func copyInfo(sender: UITextField) {
        switch sender {
        case firstNameField: copyFirst.text = firstNameField.text
        case lastNameField: copyLast.text = lastNameField.text
        case loginField: copyLogin.text = loginField.text
        case passwordField: copyPassword.text = passwordField.text
        case ageField: copyAge.text = ageField.text
        case phoneNumberField: copyPhone.text = phoneNumberField.text
        case emailField: copyEmail.text = emailField.text
        default: break
        }
    }
    
    @objc func pressClearAllButton() {
        [firstNameField, lastNameField, loginField, passwordField, ageField, phoneNumberField, emailField]
            .forEach { $0.text = "" }
        
        [copyFirst, copyLast, copyLogin, copyPassword, copyAge, copyPhone, copyEmail]
            .forEach { $0.text = "" }
    }
    
    @objc func pressRegisterButton() {
        [firstNameField, lastNameField, loginField, passwordField, ageField, phoneNumberField, emailField]
            .forEach { $0.resignFirstResponder() }
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1: lastNameField.becomeFirstResponder()
        case 2: loginField.becomeFirstResponder()
        case 3: passwordField.becomeFirstResponder()
        case 4: ageField.becomeFirstResponder()
        case 5: phoneNumberField.becomeFirstResponder()
        case 6: emailField.becomeFirstResponder()
        case 7: textField.resignFirstResponder()
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
        guard let inputView = textField as? TextFieldView else { return false }
        switch inputView.type {
        case .firstName:
            let restrictedSymbols = "\(Constants.symbols.rawValue)\(Constants.numbers.rawValue)"
            guard restrictedSymbols.contains(string) else { return true }
        case .lastName:
            let restrictedSymbols = "\(Constants.symbols.rawValue)\(Constants.numbers.rawValue)"
            guard restrictedSymbols.contains(string) else { return true }
        case .login:
            let restrictedSymbols = "\(Constants.symbols.rawValue)\(Constants.russianLetters.rawValue)"
            guard restrictedSymbols.contains(string) else { return true }
        case .password:
            let restrictedSymbols = "\(Constants.symbols.rawValue)\(Constants.russianLetters.rawValue)"
            guard restrictedSymbols.contains(string) else { return true }
        case .age:
            let restrictedSymbols = "\(Constants.englishLetters.rawValue)\(Constants.russianLetters.rawValue)\(Constants.symbols.rawValue)"
            guard !restrictedSymbols.contains(string) else { return false }
            guard let text = textField.text else { return false }
            guard text.count < 2 else { return false }
            return true
        case .phoneNumber:
            guard let text = textField.text else { return false }
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            textField.text = format(with: "+X (XXX) XXX-XXXX", phone: newString)
        case .email:
            let restrictedSymbols = "\(Constants.symbolsEmail.rawValue)\(Constants.russianLetters.rawValue)"
            guard !restrictedSymbols.contains(string) else { return false }
            guard let text = textField.text else { return false }
            
            if (string == "@" && text.contains("@")) ||
                (string == "." && text.contains(".")) ||
                text.count > 30 {
                return false
            }
            return true
        }
        return false
    }
}
