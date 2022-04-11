//
//  Three.swift
//  Calculator using code
//
//  Created by Denis on 05.01.2022.
//

import  UIKit

extension ViewController {
    
    func configureThree(button: UIButton) {
        button.setAttributedTitle(NSAttributedString.init(string: "3", attributes: fontAttributes), for: .normal)
        button.backgroundColor = numbersBackgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    
    func costraintThree(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: comma.widthAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: comma.heightAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: two.trailingAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: comma.topAnchor, constant: 0).isActive = true
    }
    
    func actionThree(button: UIButton) {
        button.addTarget(self, action: #selector(pressThree), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    @objc func pressThree(button: UIButton) {
        button.alpha = 1
        
        if infixOperator == nil {
            firstArg.append("3")
            label.text = firstArg
        } else {
            secondArg.append("3")
            label.text = secondArg
        }
    }
}
