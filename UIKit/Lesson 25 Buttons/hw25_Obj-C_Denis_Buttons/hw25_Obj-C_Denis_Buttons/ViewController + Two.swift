//
//  Two.swift
//  Calculator using code
//
//  Created by Denis on 04.01.2022.
//

import  UIKit

extension ViewController {
    
    func configureTwo(button: UIButton) {
        button.setAttributedTitle(NSAttributedString.init(string: "2", attributes: fontAttributes), for: .normal)
        button.backgroundColor = numbersBackgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    
    func costraintTwo(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: comma.widthAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: comma.heightAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: one.trailingAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: zero.topAnchor, constant: 0).isActive = true
    }
    
    func actionTwo(button: UIButton) {
        button.addTarget(self, action: #selector(pressTwo), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    @objc func pressTwo(button: UIButton) {
        button.alpha = 1
        
        if infixOperator == nil {
            firstArg.append("2")
            label.text = firstArg
        } else {
            secondArg.append("2")
            label.text = secondArg
        }
    }
}
