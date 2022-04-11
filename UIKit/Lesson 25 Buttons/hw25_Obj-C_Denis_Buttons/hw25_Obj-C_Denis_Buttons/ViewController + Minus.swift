//
//  Minus.swift
//  Calculator using code
//
//  Created by Denis on 05.01.2022.
//

import  UIKit

extension ViewController {
    
    func configureMinus(button: UIButton) {
        button.setAttributedTitle(NSAttributedString.init(string: "-", attributes: fontAttributes), for: .normal)
        button.backgroundColor = operatorsBackgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    
    func costraintMinus(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: comma.widthAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: comma.heightAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: six.trailingAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: plus.topAnchor, constant: 0).isActive = true
    }
    
    func actionMinus(button: UIButton) {
        button.addTarget(self, action: #selector(pressMinus), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    @objc func pressMinus(button: UIButton) {
        button.alpha = 1
        infixOperator = .minus
        label.text = "-"
    }
}
