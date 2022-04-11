//
//  Label.swift
//  Calculator using code
//
//  Created by Denis on 04.01.2022.
//

import UIKit

extension ViewController {
    
    func configureLabel(label: UILabel) {
        label.backgroundColor = .black
        label.textColor = .white
        label.text = "0"
        label.textAlignment = .right
        label.font = UIFont.italicSystemFont(ofSize: 35)
    }
    
    func constraintLabel(label: UILabel) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: ac.topAnchor, constant: 0).isActive = true
    }
}
