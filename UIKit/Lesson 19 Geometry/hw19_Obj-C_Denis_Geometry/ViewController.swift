//
//  ViewController.swift
//  Chessboard
//
//  Created by Denis on 12.12.2021.
//

import UIKit

class ViewController: UIViewController {

    private let background = UIView()
    private let board = UIView()
    private lazy var backgroundSide = min(view.frame.height, view.frame.width)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        makeConstraints()
        configureSubviews()
        createCells()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        let newColor = UIColor(
            red: CGFloat.random(in: 0.01...1),
            green: CGFloat.random(in: 0.01...1),
            blue: CGFloat.random(in: 0.01...1),
            alpha: 1)
        board.subviews.forEach { $0.backgroundColor = newColor }
    }
}

private extension ViewController {

    func addSubviews() {
        view.addSubview(background)
        background.addSubview(board)
    }

    func makeConstraints() {
        background.translatesAutoresizingMaskIntoConstraints = false
        board.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            background.widthAnchor.constraint(equalToConstant: backgroundSide),
            background.heightAnchor.constraint(equalToConstant: backgroundSide),
            background.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            background.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            board.topAnchor.constraint(equalTo: background.topAnchor, constant: 10),
            board.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -10),
            board.leftAnchor.constraint(equalTo: background.leftAnchor, constant: 10),
            board.rightAnchor.constraint(equalTo: background.rightAnchor, constant: -10)
        ])
    }

    func configureSubviews() {
        background.backgroundColor = .brown
        board.backgroundColor = .white
    }

    func createCells() {
        view.layoutIfNeeded()
        let cellSide = board.frame.height / 8

        (0...31)
            .forEach { i in
                let coordX = calcCoordX(i: i, side: cellSide)
                let coordY = calcCoordY(i: i, side: cellSide)
                let origin = CGPoint(x: coordX, y: coordY)
                let size = CGSize(width: cellSide, height: cellSide)
                let cell = UIView(frame: CGRect(origin: origin, size: size))
                cell.backgroundColor = .black
                board.addSubview(cell)
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


