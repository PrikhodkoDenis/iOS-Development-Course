//
//  TabBarController.swift
//  hw30_Obj-C_Denis_Dynamic Cells
//
//  Created by Denis on 02.02.2022.
//

import UIKit

class TabBarController: UITabBarController {

    private let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .heavy),
                      NSAttributedString.Key.foregroundColor: UIColor.white]

    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UITabBarItem.appearance()
        appearance.setTitleTextAttributes(attributes, for: .normal)
    }
}
