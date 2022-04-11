//
//  Eight.swift
//  Calculator using code
//
//  Created by Denis on 05.01.2022.
//

import  UIKit

extension ViewController {
    
    func configureEight(button: UIButton) {
        button.setAttributedTitle(NSAttributedString.init(string: "8", attributes: fontAttributes), for: .normal)
        button.backgroundColor = numbersBackgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    
    func costraintEight(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: comma.widthAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: comma.heightAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: seven.trailingAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: five.topAnchor, constant: 0).isActive = true
    }
    
    func actionEight(button: UIButton) {
        button.addTarget(self, action: #selector(pressEight), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    @objc func pressEight(button: UIButton) {
        button.alpha = 1
        
        if infixOperator == nil {
            firstArg.append("8")
            label.text = firstArg
        } else {
            secondArg.append("8")
            label.text = secondArg
        }
    }
}
