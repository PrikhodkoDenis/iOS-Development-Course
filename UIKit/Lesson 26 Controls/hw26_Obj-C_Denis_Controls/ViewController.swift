//
//  ViewController.swift
//  hw26_Obj-C_Denis_Controls
//
//  Created by Denis on 09.01.2022.
//

/*
 Такой вот на мой взгляд получился простенький урок, но все равно нужно практиковаться.
 Будем делать небольшое приложение:
 Мы будем применять анимации к тестируемой вьюхе.
 
 Ученик.
 1. Расположите тестируюмую вьюху на верхней половине экрана.
 2. На нижней половине создайте 3 свича: Rotation, Scale, Translation. По умолчанию все 3 выключены.
 3. Также создайте сладер скорость, со значениями от 0.5 до 2, стартовое значение 1.
 4. Создайте соответствующие проперти для свитчей и слайдера, а также методы для события valueChanged.
 
 Студент.
 5. Добавьте сегментед контрол с тремя разными сегментами.
 6. Они должны соответствовать трем разным картинкам, которые вы должны добавить.
 7. Когда переключаю сегменты, то картинка должна меняться на соответствующую.
 
 Мастер.
 8. Как только мы включаем один из свичей, наша вьюха должна начать соответствующую анимацию.
 (либо поворот, либо скеил, либо перенос). Используйте свойство transform из урока об анимациях.
 9. Так же следует помнить, что если вы переключили свич, но какойто другой включен одновременно с ним, то вы должны делать уже двойную анимацию. Например и увеличение и поворот одновременно (из урока про анимации).
 10. Анимации должны быть бесконечно повторяющимися, единственное что их может остановить, так это когда все три свича выключены.
 
 Супермен.
 11. Добавляем использование слайдера. Слайдер регулирует скорость. То есть когда значение на 0.5, то скорость анимаций должна быть в два раза медленнее, а если на 2, то в два раза быстрее обычной.
 12. Попробуйте сделать так, чтобы когда двигался слайдер, то анимация обновлялась без прерывания, а скорость изменялась в соответствующую сторону.
 Такое вот задание.
 */

import UIKit

class ViewController: UIViewController {
    
    private var speed: CGFloat = 1
    private var rotateIsOn = false
    private var scaleIsOn = false
    private var translateIsOn = false
    
    @IBOutlet weak var shapeView: UIImageView!
    
    @IBAction func animationSpeed(_ sender: UISlider) {
        speed = CGFloat(sender.value)
    }
    
    @IBAction func shapeSelector(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        let name = index == 0
            ? "s"
            : index == 1 ? "r" : "t"
        shapeView.image = UIImage(named: name)
    }
    
    @IBAction func rotationSwitch(_ sender: UISwitch) {
        if sender.isOn {
            shapeView.transform = .identity
            rotate()
            rotateIsOn = true
        } else {
            rotateIsOn = false
            guard !scaleIsOn && !translateIsOn else { return }
            shapeView.layer.removeAllAnimations()
            shapeView.transform = .identity
        }
    }
    
    @IBAction func scaleSwitch(_ sender: UISwitch) {
        if sender.isOn {
            shapeView.transform = .identity
            scale()
            scaleIsOn = true
        } else {
            scaleIsOn = false
            guard !rotateIsOn && !translateIsOn else { return }
            shapeView.layer.removeAllAnimations()
            shapeView.transform = .identity
        }
    }
    
    @IBAction func translationSwitch(_ sender: UISwitch) {
        if sender.isOn {
            shapeView.transform = .identity
            translate()
            translateIsOn = true
        } else {
            translateIsOn = false
            guard !scaleIsOn && !rotateIsOn else { return }
            shapeView.layer.removeAllAnimations()
            shapeView.transform = .identity
        }
    }
}

private extension ViewController {
    
    private func rotate() {
        UIView.animate(withDuration: TimeInterval(speed),
                       delay: 0,
                       options: [.curveLinear]) { [self] in
            shapeView.transform = view.transform.rotated(by: .pi)
            shapeView.transform = view.transform.rotated(by: .pi)
        } completion: { [self] rotationIsFinished in
            if rotationIsFinished {
                shapeView.transform = .identity
                rotate()
            }
        }
    }
    
    private func scale() {
        UIView.animate(withDuration: TimeInterval(speed),
                       delay: 0,
                       options: [.curveLinear]) { [self] in
            shapeView.transform = view.transform.scaledBy(x: 1.5, y: 1.5)
        } completion: { [self] scaleIsFinished in
            if scaleIsFinished {
                shapeView.transform = .identity
                scale()
            }
        }
    }
    
    private func translate() {
        UIView.animate(withDuration: TimeInterval(speed),
                       delay: 0,
                       options: [.curveLinear]) { [self] in
            shapeView.transform = view.transform.translatedBy(x: 100, y: 100)
        } completion: { [self] translateIsFinished in
            if translateIsFinished {
                shapeView.transform = .identity
                translate()
            }
        }
    }
}
