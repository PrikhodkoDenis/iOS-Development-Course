//
//  File.swift
//  hw23_Obj-C_Denis_Gestures
//
//  Created by Denis on 17.01.2022.
//

import UIKit

extension ViewController {
    
     func addGestures() {
        let doubleTapDoubleTouch = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTapDoubleTouch))
        doubleTapDoubleTouch.numberOfTapsRequired = 2
        doubleTapDoubleTouch.numberOfTouchesRequired = 2
        self.view.addGestureRecognizer(doubleTapDoubleTouch)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture.require(toFail: doubleTapDoubleTouch)
        self.view.addGestureRecognizer(tapGesture)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleRightSwipe))
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleLeftSwipe))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        pinchGesture.delegate = self
        self.view.addGestureRecognizer(pinchGesture)
        
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation))
        rotationGesture.delegate = self
        self.view.addGestureRecognizer(rotationGesture)
    }
}


