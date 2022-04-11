//
//  Multiplicator.swift
//  Calculator using code
//
//  Created by Denis on 05.01.2022.
//

import  UIKit

extension ViewController {
    
    func configureMultiplicator(button: UIButton) {
        button.setAttributedTitle(NSAttributedString.init(string: "x", attributes: fontAttributes), for: .normal)
        button.backgroundColor = operatorsBackgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    
    func costraintMultiplicator(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: comma.widthAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: comma.heightAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: nine.trailingAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: minus.topAnchor, constant: 0).isActive = true
    }
    
    func actionMultiply(button: UIButton) {
        button.addTarget(self, action: #selector(pressMultiply), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    @objc func pressMultiply(button: UIButton) {
        button.alpha = 1
        infixOperator = .multiply
        label.text = "x"
    }
}
