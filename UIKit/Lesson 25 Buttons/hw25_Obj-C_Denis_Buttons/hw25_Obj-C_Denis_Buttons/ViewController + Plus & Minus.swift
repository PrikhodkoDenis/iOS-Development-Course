//
//  Plus & Minus.swift
//  Calculator using code
//
//  Created by Denis on 05.01.2022.
//

import  UIKit

extension ViewController {
    
    func configurePlusMinus(button: UIButton) {
        button.setAttributedTitle(NSAttributedString.init(string: "+/-", attributes: fontAttributes), for: .normal)
        button.backgroundColor = additionalBackgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    
    func costraintPlusMinus(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: comma.widthAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: comma.heightAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: ac.rightAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: eight.topAnchor, constant: 0).isActive = true
    }
    
    func actionPlusAndMinus(button: UIButton) {
        button.addTarget(self, action: #selector(pressPlusAndMinus), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    @objc func pressPlusAndMinus(button: UIButton) {
        button.alpha = 1
        
        switch polarity {
        case .positive: polarity = .negative
        case .negative: polarity = .positive
        case nil: polarity = .positive
        }
        
        if polarity == Polarity.negative {
            signBefore = -1
        } else if polarity == Polarity.positive {
            signBefore = 1
        }
        
        label.text = "\(polarity?.rawValue ?? "")\(firstArg)"
    }
}
