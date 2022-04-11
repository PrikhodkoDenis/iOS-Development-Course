//
//  LabelView.swift
//  hw27-28_Obj-C_Denis_UITextField
//
//  Created by Denis on 18.01.2022.
//

import UIKit

class LabelView: UILabel {
    
    private let type: LabelType
    
    init(type: LabelType) {
        self.type = type
        super.init(frame: .zero)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension LabelView {
    
    func configureLabel() {
        font = .systemFont(ofSize: 16)
        text = type.rawValue
        
        if type == .copy {
            textAlignment = .center
            font = .systemFont(ofSize: 16)
            textColor = .red
        }

        if type == .greeting {
            font = .systemFont(ofSize: 22, weight: .heavy)
            textAlignment = .center
        }
    }
}
