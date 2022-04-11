//
//  Button.swift
//  Calculator_MVC
//
//  Created by Denis on 11.01.2022.
//

import UIKit

class ButtonView: UIButton {

    private let type: TypeOfButton
    private let delegate: ButtonDelegate
    
    init (type: TypeOfButton, delegate: ButtonDelegate) {
        self.type = type
        self.delegate = delegate
        super.init(frame: .zero)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ButtonView {
    
    func configureButton() {
        addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        
        let fontAttributes = [NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 30),
                              NSAttributedString.Key.foregroundColor: UIColor.white]
        
        switch type {
        case let .number(digit):
            backgroundColor = .gray
            setAttributedTitle(NSAttributedString.init(string: "\(digit)", attributes: fontAttributes), for: .normal)
        case .plus:
            backgroundColor = .orange
            setAttributedTitle(NSAttributedString.init(string: "+", attributes: fontAttributes), for: .normal)
        case .minus:
            backgroundColor = .orange
            setAttributedTitle(NSAttributedString.init(string: "-", attributes: fontAttributes), for: .normal)
        case .multiply:
            backgroundColor = .orange
            setAttributedTitle(NSAttributedString.init(string: "x", attributes: fontAttributes), for: .normal)
        case .divide:
            backgroundColor = .orange
            setAttributedTitle(NSAttributedString.init(string: "/", attributes: fontAttributes), for: .normal)
        case .equal:
            backgroundColor = .orange
            setAttributedTitle(NSAttributedString.init(string: "=", attributes: fontAttributes), for: .normal)
        case .ac:
            backgroundColor = .darkGray
            setAttributedTitle(NSAttributedString.init(string: "ac", attributes: fontAttributes), for: .normal)
        case .percentage:
            backgroundColor = .darkGray
            setAttributedTitle(NSAttributedString.init(string: "%", attributes: fontAttributes), for: .normal)
        case .plusAndMinus:
            backgroundColor = .darkGray
            setAttributedTitle(NSAttributedString.init(string: "+/-", attributes: fontAttributes), for: .normal)
        case .comma:
            backgroundColor = .gray
            setAttributedTitle(NSAttributedString.init(string: ",", attributes: fontAttributes), for: .normal)
        }
    }
}

private extension ButtonView {

    @objc func pressButton() {
        delegate.pressButton(type: type)
    }
}
