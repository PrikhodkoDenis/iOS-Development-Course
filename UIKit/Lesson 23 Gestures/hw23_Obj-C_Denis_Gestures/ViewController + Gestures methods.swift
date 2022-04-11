//
//  111.swift
//  hw23_Obj-C_Denis_Gestures
//
//  Created by Denis on 17.01.2022.
//

import UIKit

extension ViewController {
    
     @objc func handleTap(tapGesture: UITapGestureRecognizer) {
        if tapGesture.state == .recognized {
            UIView.animate(withDuration: 3) { [self] in
                testView.center = tapGesture.location(in: self.view)
                testView.backgroundColor = randomColor()
            }
        }
    }
    
     @objc func handleDoubleTapDoubleTouch(doubleTapDoubleTouch: UITapGestureRecognizer) {
        testView.layer.removeAllAnimations()
    }
    
     @objc func handleRightSwipe(rightSwipe: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 3) { [self] in
            testView.transform = testView.transform.rotated(by: 3.14)
            testView.transform = testView.transform.rotated(by: 3.14)
        }
    }
    
     @objc func handleLeftSwipe(leftSwipe: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 3) { [self] in
            testView.transform = testView.transform.rotated(by: -3.14)
            testView.transform = testView.transform.rotated(by: -3.14)
        }
    }
    
     @objc func handlePinch(pinchGesture: UIPinchGestureRecognizer) {
        if pinchGesture.state == .began {
            testViewScale = 1
        }
        
        let newScale = 1 + pinchGesture.scale - testViewScale
        testView.transform = testView.transform.scaledBy(x: newScale, y: newScale)
        testViewScale = pinchGesture.scale
    }
    
     @objc func handleRotation(rotationGesture: UIRotationGestureRecognizer) {
        if rotationGesture.state == .began {
            testViewRotation = 0
        }
        
        let newAngle = rotationGesture.rotation - testViewRotation
        let currentTransform = testView.transform
        let newTransform = currentTransform.rotated(by: newAngle)
        testView.transform = newTransform
        testViewRotation = rotationGesture.rotation
    }
}
