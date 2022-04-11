//
//  Zero.swift
//  Calculator using code
//
//  Created by Denis on 04.01.2022.
//

import  UIKit

extension ViewController {
    
    func configureZero(button: UIButton) {
        button.setAttributedTitle(NSAttributedString.init(string: "0", attributes: fontAttributes), for: .normal)
        button.backgroundColor = numbersBackgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    
    func costraintZero(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(greaterThanOrEqualTo: view.widthAnchor, multiplier: 1 / 2).isActive = true
        button.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor, multiplier: 1 / 7).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func actionZero(button: UIButton) {
        button.addTarget(self, action: #selector(pressZero), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    @objc func pressZero(button: UIButton) {
        button.alpha = 1

        if infixOperator == nil {
            firstArg.append("0")
            label.text = firstArg
        } else {
            secondArg.append("0")
            label.text = secondArg
        }
    }
}


