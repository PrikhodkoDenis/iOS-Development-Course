//
//  ViewController.swift
//  Calculator using code
//
//  Created by Denis on 04.01.2022.
//

import UIKit

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

class ViewController: UIViewController {
    
    var firstArg = String()
    var secondArg = String()
    var tempArg = String()
    var infixOperator: Operator?
    var polarity: Polarity?
    var signBefore = 1.0
    var result = Double()
    
    let label = UILabel()
    
    let zero = UIButton()
    let one = UIButton()
    let two = UIButton()
    let three = UIButton()
    let four = UIButton()
    let five = UIButton()
    let six = UIButton()
    let seven = UIButton()
    let eight = UIButton()
    let nine = UIButton()
    let comma = UIButton()
    
    let plus = UIButton()
    let minus = UIButton()
    let multiply = UIButton()
    let divide = UIButton()
    let equal = UIButton()
    
    let ac = UIButton()
    let plusMinus = UIButton()
    let percentage = UIButton()
   
    let borderWidth: CGFloat = 1
    let borderColor = UIColor.black.cgColor
    let numbersBackgroundColor = UIColor.gray
    let operatorsBackgroundColor = UIColor.orange
    let additionalBackgroundColor = UIColor.darkGray
    let fontAttributes = [NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 25),
                          NSAttributedString.Key.foregroundColor: UIColor.white]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(zero)
        view.addSubview(one)
        view.addSubview(two)
        view.addSubview(three)
        view.addSubview(four)
        view.addSubview(five)
        view.addSubview(six)
        view.addSubview(seven)
        view.addSubview(eight)
        view.addSubview(nine)
        view.addSubview(plus)
        view.addSubview(minus)
        view.addSubview(multiply)
        view.addSubview(divide)
        view.addSubview(ac)
        view.addSubview(plusMinus)
        view.addSubview(percentage)
        view.addSubview(comma)
        view.addSubview(equal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureLabel(label: label)
        constraintLabel(label: label)
        
        configureZero(button: zero)
        costraintZero(button: zero)
        actionZero(button: zero)
        
        configureOne(button: one)
        costraintOne(button: one)
        actionOne(button: one)
        
        configureTwo(button: two)
        costraintTwo(button: two)
        actionTwo(button: two)
        
        configureThree(button: three)
        costraintThree(button: three)
        actionThree(button: three)
        
        configureFour(button: four)
        costraintFour(button: four)
        actionFour(button: four)
        
        configureFive(button: five)
        costraintFive(button: five)
        actionFive(button: five)
        
        configureSix(button: six)
        costraintSix(button: six)
        actionSix(button: six)
        
        configureSeven(button: seven)
        costraintSeven(button: seven)
        actionSeven(button: seven)
        
        configureEight(button: eight)
        costraintEight(button: eight)
        actionEight(button: eight)
        
        configureNine(button: nine)
        costraintNine(button: nine)
        actionNine(button: nine)
        
        configurePlus(button: plus)
        costraintPlus(button: plus)
        actionPlus(button: plus)
        
        configureMinus(button: minus)
        costraintMinus(button: minus)
        actionMinus(button: minus)
        
        configureMultiplicator(button: multiply)
        costraintMultiplicator(button: multiply)
        actionMultiply(button: multiply)
        
        configureDivide(button: divide)
        costraintDivide(button: divide)
        actionDivide(button: divide)
        
        configureAc(button: ac)
        costraintAc(button: ac)
        actionAc(button: ac)
        
        configurePlusMinus(button: plusMinus)
        costraintPlusMinus(button: plusMinus)
        actionPlusAndMinus(button: plusMinus)
        
        configurePercentage(button: percentage)
        costraintPercentage(button: percentage)
        actionPercentage(button: percentage)
        
        configureComma(button: comma)
        costraintComma(button: comma)
        actionComma(button: comma)
        
        configureEqual(button: equal)
        costraintEqual(button: equal)
        actionEqual(button: equal)
    }
    
    @objc func touchDown(button: UIButton) {
        button.alpha = 0.7
    }
}


