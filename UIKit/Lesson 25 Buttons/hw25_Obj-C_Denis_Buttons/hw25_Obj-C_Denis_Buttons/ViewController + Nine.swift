//
//  Nine.swift
//  Calculator using code
//
//  Created by Denis on 05.01.2022.
//

import  UIKit

extension ViewController {
    
    func configureNine(button: UIButton) {
        button.setAttributedTitle(NSAttributedString.init(string: "9", attributes: fontAttributes), for: .normal)
        button.backgroundColor = numbersBackgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    
    func costraintNine(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: comma.widthAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: comma.heightAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: eight.trailingAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: six.topAnchor, constant: 0).isActive = true
    }
    
    func actionNine(button: UIButton) {
        button.addTarget(self, action: #selector(pressNine), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    @objc func pressNine(button: UIButton) {
        button.alpha = 1
        
        if infixOperator == nil {
            firstArg.append("9")
            label.text = firstArg
        } else {
            secondArg.append("9")
            label.text = secondArg
        }
    }
}
