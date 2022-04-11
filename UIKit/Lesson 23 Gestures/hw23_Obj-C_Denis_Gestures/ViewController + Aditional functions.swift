//
//  222.swift
//  hw23_Obj-C_Denis_Gestures
//
//  Created by Denis on 17.01.2022.
//

import UIKit

 extension ViewController {
    
     func randomColor() -> UIColor {
        let random = UIColor(
            red: CGFloat.random(in: 0.01...1),
            green: CGFloat.random(in: 0.01...1),
            blue: CGFloat.random(in: 0.01...1),
            alpha: 1)
        return random
    }
}


