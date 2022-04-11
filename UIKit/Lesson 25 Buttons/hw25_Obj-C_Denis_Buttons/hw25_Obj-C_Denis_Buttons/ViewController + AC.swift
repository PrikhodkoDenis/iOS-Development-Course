//
//  AC.swift
//  Calculator using code
//
//  Created by Denis on 05.01.2022.
//

import  UIKit

extension ViewController {
    
    func configureAc(button: UIButton) {
        button.setAttributedTitle(NSAttributedString.init(string: "AC", attributes: fontAttributes), for: .normal)
        button.backgroundColor = additionalBackgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    
    func costraintAc(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 4).isActive = true
        button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 7).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: seven.topAnchor, constant: 0).isActive = true
    }
    
    func actionAc(button: UIButton) {
        button.addTarget(self, action: #selector(pressAc), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    @objc func pressAc(button: UIButton) {
        button.alpha = 1
        firstArg.removeAll()
        secondArg.removeAll()
        tempArg.removeAll()
        signBefore = 1
        polarity = .positive
        label.text = "0"
        result = 0
        infixOperator = nil
    }
}

