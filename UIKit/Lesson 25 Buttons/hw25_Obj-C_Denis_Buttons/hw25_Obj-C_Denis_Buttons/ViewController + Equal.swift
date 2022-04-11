//
//  Equal.swift
//  Calculator using code
//
//  Created by Denis on 04.01.2022.
//

import  UIKit

extension ViewController {
    
    func configureEqual(button: UIButton) {
        button.setAttributedTitle(NSAttributedString.init(string: "=", attributes: fontAttributes), for: .normal)
        button.backgroundColor = operatorsBackgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    
    func costraintEqual(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: comma.widthAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: comma.heightAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: comma.trailingAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func actionEqual(button: UIButton) {
        button.addTarget(self, action: #selector(pressEqual), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    @objc func pressEqual(button: UIButton) {
        button.alpha = 1
        
        switch infixOperator {
        case .plus:
            let first = Double(firstArg) ?? 0
            let second = Double(secondArg) ?? 0
            let temp = Double(tempArg) ?? 0
            result = (signBefore * first + temp) + second
        case .minus:
            let first = Double(firstArg) ?? 0
            let second = Double(secondArg) ?? 0
            let temp = Double(tempArg) ?? 0
            result = (signBefore * first + temp) - second
        case .multiply:
            let first = Double(firstArg) ?? 0
            let second = Double(secondArg) ?? 0
            let temp = Double(tempArg) ?? 0
            result = (signBefore * first + temp) * second
        case .divide:
            let first = Double(firstArg) ?? 0
            let second = Double(secondArg) ?? 0
            let temp = Double(tempArg) ?? 0
            guard second != 0 else { return label.text = "error"  }
            result = (signBefore * first + temp) / second
        case nil:
            result = 0
        }

        label.text = String(result)
        tempArg = String(result)
        firstArg.removeAll()
        secondArg.removeAll()
        infixOperator = nil
        result = 0
    }
}
