//
//  ViewController.swift
//  hw23_Obj-C_Denis_Gestures
//
//  Created by Denis on 28.12.2021.
//

/*
 Собственно урок был долгим, но я показал все что вам нужно для создания классных интерфейсов.
 
 Ученик
 1. Добавьте квадратную картинку на вьюху вашего контроллера.
 2. Если хотите, можете сделать ее анимированной.
 
 Студент
 3. По тачу анимационно передвигайте картинку со ее позиции в позицию тача.
 4. Если я вдруг делаю тач во время анимации, то картинка должна двигаться в новую точку без рывка (как будто она едет себе и все).
 
 Мастер
 5. Если я делаю свайп вправо, то давайте картинке анимацию поворота по часовой стрелке на 360 градусов.
 6. То же самое для свайпа влево, только анимация должна быть против часовой (не забудьте остановить предыдущее кручение).
 7. По двойному тапу двух пальцев останавливайте анимацию.
 
 Супермен
 8. Добавьте возможность зумить и отдалять картинку используя пинч.
 9. Добавьте возможность поворачивать картинку используя ротейшн.
 */

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    let testView = UIView()
    var testViewScale = CGFloat()
    var testViewRotation = CGFloat()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurateView()
        addGestures()
    }
    
     func configurateView() {
        testView.frame = CGRect(x: self.view.bounds.midX - 75, y: self.view.bounds.midY - 75, width: 150, height: 150)
        testView.backgroundColor = .green
        view.addSubview(testView)
    }
}



