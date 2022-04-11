//
//  Divide.swift
//  Calculator using code
//
//  Created by Denis on 05.01.2022.
//

import  UIKit

extension ViewController {
    
    func configureDivide(button: UIButton) {
        button.setAttributedTitle(NSAttributedString.init(string: "/", attributes: fontAttributes), for: .normal)
        button.backgroundColor = operatorsBackgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    
    func costraintDivide(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: comma.widthAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: comma.heightAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: percentage.trailingAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: multiply.topAnchor, constant: 0).isActive = true
    }
    
    func actionDivide(button: UIButton) {
        button.addTarget(self, action: #selector(pressDivide), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    @objc func pressDivide(button: UIButton) {
        button.alpha = 1
        infixOperator = .divide
        label.text = "/"
    }
}
