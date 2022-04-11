//
//  LabelView.swift
//  Calculator_MVC
//
//  Created by Denis on 17.01.2022.
//

import UIKit

class LabelView: UILabel {

    init() {
        super.init(frame: .zero)
        font = UIFont.italicSystemFont(ofSize: 40)
        backgroundColor = .black
        textAlignment = .right
        textColor = .white
        text = "0"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
