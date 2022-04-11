//
//  111.swift
//  hw23_Obj-C_Denis_Gestures
//
//  Created by Denis on 17.01.2022.
//

import UIKit

extension ViewController {
    
      func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
