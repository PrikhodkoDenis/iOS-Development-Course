//
//  Percentage.swift
//  Calculator using code
//
//  Created by Denis on 05.01.2022.
//

import  UIKit

extension ViewController {
    
    func configurePercentage(button: UIButton) {
        button.setAttributedTitle(NSAttributedString.init(string: "1%", attributes: fontAttributes), for: .normal)
        button.backgroundColor = additionalBackgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    
    func costraintPercentage(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: comma.widthAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: comma.heightAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: plusMinus.rightAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: nine.topAnchor, constant: 0).isActive = true
    }
    
    func actionPercentage(button: UIButton) {
        button.addTarget(self, action: #selector(pressPercentage), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    @objc func pressPercentage(button: UIButton) {
        button.alpha = 1
        guard let first = Double(firstArg) else { return }
        let result = first / 100
        label.text = String(result)
        firstArg = String(result)
    }
}

