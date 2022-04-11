//
//  ViewController.swift
//  Calculator_MVC
//
//  Created by Denis on 11.01.2022.
//

import UIKit

class ButtonController: UIViewController, ButtonDelegate {
    
    private var firstArg = String()
    private var secondArg = String()
    private var tempArg = String()
    private var signBefore = 1.0
    private var result = Double()
    
    private var infixOperator: Operator?
    private var polarity: Polarity?
    
    private let label = LabelView()
    
    private let commonStack = UIStackView()
    private let fifthRowStack = UIStackView()
    private let forthRowStack = UIStackView()
    private let thirdRowStack = UIStackView()
    private let secondRowStack = UIStackView()
    private let firstRowStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(commonStack)
        createButtonAndStacks()
        configureStacks()
        arrangeStacks()
        makeConstraints()
    }
    
    private func createButtonAndStacks() {
        let zero = ButtonView(type: TypeOfButton.number(digit: 0), delegate: self)
        let one = ButtonView(type: TypeOfButton.number(digit: 1), delegate: self)
        let two = ButtonView(type: TypeOfButton.number(digit: 2), delegate: self)
        let three = ButtonView(type: TypeOfButton.number(digit: 3), delegate: self)
        let four = ButtonView(type: TypeOfButton.number(digit: 4), delegate: self)
        let five = ButtonView(type: TypeOfButton.number(digit: 5), delegate: self)
        let six = ButtonView(type: TypeOfButton.number(digit: 6), delegate: self)
        let seven = ButtonView(type: TypeOfButton.number(digit: 7), delegate: self)
        let eight = ButtonView(type: TypeOfButton.number(digit: 8), delegate: self)
        let nine = ButtonView(type: TypeOfButton.number(digit: 9), delegate: self)
        
        let plus = ButtonView(type: TypeOfButton.plus, delegate: self)
        let minus = ButtonView(type: TypeOfButton.minus, delegate: self)
        let multiply = ButtonView(type: TypeOfButton.multiply, delegate: self)
        let divide = ButtonView(type: TypeOfButton.divide, delegate: self)
        let equal = ButtonView(type: TypeOfButton.equal, delegate: self)

        let ac = ButtonView(type: TypeOfButton.ac, delegate: self)
        let plusAndMinus = ButtonView(type: TypeOfButton.plusAndMinus, delegate: self)
        let percentage = ButtonView(type: TypeOfButton.percentage, delegate: self)
        let comma = ButtonView(type: TypeOfButton.comma, delegate: self)
        
        fifthRowStack.addArrangedSubview(ac)
        fifthRowStack.addArrangedSubview(plusAndMinus)
        fifthRowStack.addArrangedSubview(percentage)
        fifthRowStack.addArrangedSubview(divide)

        forthRowStack.addArrangedSubview(seven)
        forthRowStack.addArrangedSubview(eight)
        forthRowStack.addArrangedSubview(nine)
        forthRowStack.addArrangedSubview(multiply)

        thirdRowStack.addArrangedSubview(four)
        thirdRowStack.addArrangedSubview(five)
        thirdRowStack.addArrangedSubview(six)
        thirdRowStack.addArrangedSubview(minus)

        secondRowStack.addArrangedSubview(one)
        secondRowStack.addArrangedSubview(two)
        secondRowStack.addArrangedSubview(three)
        secondRowStack.addArrangedSubview(plus)
    
        firstRowStack.addArrangedSubview(zero)
        firstRowStack.addArrangedSubview(comma)
        firstRowStack.addArrangedSubview(equal)
    }
    
    private func arrangeStacks() {
        commonStack.addArrangedSubview(label)
        commonStack.addArrangedSubview(fifthRowStack)
        commonStack.addArrangedSubview(forthRowStack)
        commonStack.addArrangedSubview(thirdRowStack)
        commonStack.addArrangedSubview(secondRowStack)
        commonStack.addArrangedSubview(firstRowStack)
    }
    
    private func makeConstraints() {
        commonStack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        commonStack.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        commonStack.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        commonStack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func configureStacks() {
        [commonStack, fifthRowStack, forthRowStack, thirdRowStack, secondRowStack, firstRowStack]
            .forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                $0.distribution = .fillEqually
                $0.axis = .horizontal
                $0.alignment = .fill
                $0.spacing = 2
            }
        commonStack.axis = .vertical
    }
    
     func pressButton(type: TypeOfButton) {
        switch type {
        case let .number(digit):
            if infixOperator == nil {
                firstArg.append("\(digit)")
                label.text = firstArg
            } else {
                secondArg.append("\(digit)")
                label.text = secondArg
            }
        case .plus:
            infixOperator = .plus
            label.text = "+"
        case .minus:
            infixOperator = .minus
            label.text = "-"
        case .multiply:
            infixOperator = .multiply
            label.text = "x"
        case .divide:
            infixOperator = .divide
            label.text = "/"
        case .ac:
            firstArg.removeAll()
            secondArg.removeAll()
            tempArg.removeAll()
            signBefore = 1
            polarity = .positive
            label.text = "0"
            result = 0
            infixOperator = nil
        case .percentage:
            guard let first = Double(firstArg) else { return }
            let result = first / 100
            label.text = String(result)
            firstArg = String(result)
        case .plusAndMinus:
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
        case .comma:
            if !firstArg.contains(".") && infixOperator == nil {
                firstArg.append(".")
                label.text = firstArg
            } else if !secondArg.contains(".") {
                secondArg.append(".")
                label.text = secondArg
            }
        case .equal:
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
}

private extension ButtonController {
    
    enum Operator: String {
        case plus = "+"
        case minus = "-"
        case multiply = "x"
        case divide = "/"
    }

    enum Polarity: String {
        case positive = "+"
        case negative = "-"
    }
}
