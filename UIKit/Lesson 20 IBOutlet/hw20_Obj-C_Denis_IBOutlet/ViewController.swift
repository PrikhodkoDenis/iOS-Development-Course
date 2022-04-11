//
//  ViewController.swift
//  Lesson 20
//
//  Created by Denis on 12.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var substrate: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCells()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        let newColor = UIColor(
            red: CGFloat.random(in: 0.01...1),
            green: CGFloat.random(in: 0.01...1),
            blue: CGFloat.random(in: 0.01...1),
            alpha: 1)
        substrate.subviews.forEach { $0.backgroundColor = newColor }
    }
}

private extension ViewController {
    
    func createCells() {
        view.layoutIfNeeded()
        let cellSide = substrate.frame.height / 8
        
        (0...31)
            .forEach { i in
                let coordX = calcCoordX(i: i, side: cellSide)
                let coordY = calcCoordY(i: i, side: cellSide)
                let origin = CGPoint(x: coordX, y: coordY)
                let size = CGSize(width: cellSide, height: cellSide)
                let cell = UIView(frame: CGRect(origin: origin, size: size))
                cell.backgroundColor = .black
                substrate.addSubview(cell)
            }
    }
    
    func calcCoordX(i: Int, side: CGFloat) -> CGFloat {
        var multiplierX: CGFloat = 0
        switch i % 8 {
        case 0:  multiplierX = 1
        case 1:  multiplierX = 3
        case 2:  multiplierX = 5
        case 3:  multiplierX = 7
        case 4:  multiplierX = 0
        case 5:  multiplierX = 2
        case 6:  multiplierX = 4
        case 7:  multiplierX = 6
        default: break
        }
        return multiplierX * side
    }
    
    func calcCoordY(i: Int, side: CGFloat) -> CGFloat {
        return CGFloat(i / 4) * side
    }
}
