//
//  Five.swift
//  Calculator using code
//
//  Created by Denis on 05.01.2022.
//

import  UIKit

extension ViewController {
    
    func configureFive(button: UIButton) {
        button.setAttributedTitle(NSAttributedString.init(string: "5", attributes: fontAttributes), for: .normal)
        button.backgroundColor = numbersBackgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    
    func costraintFive(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: comma.widthAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: comma.heightAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: four.trailingAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: two.topAnchor, constant: 0).isActive = true
    }
    
    func actionFive(button: UIButton) {
        button.addTarget(self, action: #selector(pressFive), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    @objc func pressFive(button: UIButton) {
        button.alpha = 1
        
        if infixOperator == nil {
            firstArg.append("5")
            label.text = firstArg
        } else {
            secondArg.append("5")
            label.text = secondArg
        }
    }
}
