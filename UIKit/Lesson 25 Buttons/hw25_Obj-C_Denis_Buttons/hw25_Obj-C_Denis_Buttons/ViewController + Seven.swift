//
//  Seven.swift
//  Calculator using code
//
//  Created by Denis on 05.01.2022.
//

import  UIKit

extension ViewController {
    
    func configureSeven(button: UIButton) {
        button.setAttributedTitle(NSAttributedString.init(string: "7", attributes: fontAttributes), for: .normal)
        button.backgroundColor = numbersBackgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    
    func costraintSeven(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: comma.widthAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: comma.heightAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: four.topAnchor, constant: 0).isActive = true
    }
    
    func actionSeven(button: UIButton) {
        button.addTarget(self, action: #selector(pressSeven), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    @objc func pressSeven(button: UIButton) {
        button.alpha = 1
        
        if infixOperator == nil {
            firstArg.append("7")
            label.text = firstArg
        } else {
            secondArg.append("7")
            label.text = secondArg
        }
    }
}
