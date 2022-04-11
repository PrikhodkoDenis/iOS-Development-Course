//
//  Six.swift
//  Calculator using code
//
//  Created by Denis on 05.01.2022.
//

import  UIKit

extension ViewController {
    
    func configureSix(button: UIButton) {
        button.setAttributedTitle(NSAttributedString.init(string: "6", attributes: fontAttributes), for: .normal)
        button.backgroundColor = numbersBackgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    
    func costraintSix(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: comma.widthAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: comma.heightAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: five.trailingAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: three.topAnchor, constant: 0).isActive = true
    }
    
    func actionSix(button: UIButton) {
        button.addTarget(self, action: #selector(pressSix), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    @objc func pressSix(button: UIButton) {
        button.alpha = 1
        
        if infixOperator == nil {
            firstArg.append("6")
            label.text = firstArg
        } else {
            secondArg.append("6")
            label.text = secondArg
        }
    }
}
