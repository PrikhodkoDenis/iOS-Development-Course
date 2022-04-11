//
//  ButtonView.swift
//  hw27-28_Obj-C_Denis_UITextField
//
//  Created by Denis on 18.01.2022.
//

import UIKit

class ButtonView: UIButton {
    
    private let type: ButtonModel
    
    init(type: ButtonModel) {
        self.type = type
        super.init(frame: .zero)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ButtonView {
    
    func configureButton() {
        setTitle(type.rawValue, for: .normal)
        showsTouchWhenHighlighted = true
        layer.cornerRadius = 15
        
        switch type {
        case .register: backgroundColor = .blue
        case .clearAll: backgroundColor = .red
        }
    }
}
