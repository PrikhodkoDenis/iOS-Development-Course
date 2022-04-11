//
//  One.swift
//  Calculator using code
//
//  Created by Denis on 04.01.2022.
//

import  UIKit

extension ViewController {
    
    func configureOne(button: UIButton) {
        button.setAttributedTitle(NSAttributedString.init(string: "1", attributes: fontAttributes), for: .normal)
        button.backgroundColor = numbersBackgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    
    func costraintOne(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: comma.widthAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: comma.heightAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: zero.topAnchor, constant: 0).isActive = true
    }
    
    func actionOne(button: UIButton) {
        button.addTarget(self, action: #selector(pressOne), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    @objc func pressOne(button: UIButton) {
        button.alpha = 1
        
        if infixOperator == nil {
            firstArg.append("1")
            label.text = firstArg
        } else {
            secondArg.append("1")
            label.text = secondArg
        }
    }
}
