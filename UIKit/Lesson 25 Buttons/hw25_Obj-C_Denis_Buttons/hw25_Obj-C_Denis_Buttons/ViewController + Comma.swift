//
//  Comma.swift
//  Calculator using code
//
//  Created by Denis on 04.01.2022.
//

import  UIKit

extension ViewController {
    
    func configureComma(button: UIButton) {
        button.setAttributedTitle(NSAttributedString.init(string: ".", attributes: fontAttributes), for: .normal)
        button.backgroundColor = numbersBackgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    
    func costraintComma(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 4).isActive = true
        button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 7).isActive = true
        button.leadingAnchor.constraint(equalTo: zero.trailingAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func actionComma(button: UIButton) {
        button.addTarget(self, action: #selector(pressComma), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    @objc func pressComma(button: UIButton) {
        button.alpha = 1
        
        if !firstArg.contains(".") && infixOperator == nil {
            firstArg.append(".")
            label.text = firstArg
        } else if !secondArg.contains(".") {
            secondArg.append(".")
            label.text = secondArg
        }
    }
}
