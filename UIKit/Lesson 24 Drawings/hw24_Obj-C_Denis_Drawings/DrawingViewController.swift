//
//  ViewController.swift
//  hw24_Obj-C_Denis_Drawings
//
//  Created by Denis on 31.12.2021.
//

import UIKit

class DrawingViewController: UIViewController {
    
   private let drawingView = DrawingView()
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        makeConstraints()
    }
    
    internal override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        guard let position = touch?.location(in: drawingView) else { return }
        drawingView.setNeedsDisplay()
        drawingView.points.append(position)
    }
    
    internal override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        guard let position = touch?.location(in: drawingView) else { return }
        drawingView.setNeedsDisplay() 
        drawingView.points.append(position)
    }
    
    internal override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        drawingView.points.removeAll()
        drawingView.setNeedsDisplay()
    }
    
    internal func configure() {
        drawingView.backgroundColor = .white
        self.view.addSubview(drawingView)
    }
    
    internal func makeConstraints() {
        drawingView.translatesAutoresizingMaskIntoConstraints = false
        drawingView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        drawingView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        drawingView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        drawingView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
    }
}

