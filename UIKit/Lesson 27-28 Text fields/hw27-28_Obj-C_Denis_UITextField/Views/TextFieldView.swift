//
//  TexrFieldView.swift
//  hw27-28_Obj-C_Denis_UITextField
//
//  Created by Denis on 18.01.2022.
//


import UIKit

class TextFieldView: UITextField {
     
    let type: TextFieldType
    
    init(type: TextFieldType) {
        self.type = type
        super.init(frame: .zero)
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TextFieldView {

    func configureTextField() {
        clearButtonMode = .whileEditing
        font = .systemFont(ofSize: 16)
        placeholder = type.rawValue
        borderStyle = .roundedRect
        autocorrectionType = .no
        returnKeyType = .next
        
        
        switch type {
        case .firstName:
            keyboardType = .alphabet
            autocapitalizationType = .words
            tag = 1
        case .lastName:
            keyboardType = .alphabet
            autocapitalizationType = .words
            tag = 2
        case .login:
            keyboardType = .default
            tag = 3
        case .password:
            keyboardType = .default
            isSecureTextEntry = true
            tag = 4
        case .age:
            keyboardType = .numbersAndPunctuation
            tag = 5
        case .phoneNumber:
            keyboardType = .numbersAndPunctuation
            tag = 6
        case .email:
            returnKeyType = .done
            keyboardType = .emailAddress
            tag = 7
        }
    }
}
