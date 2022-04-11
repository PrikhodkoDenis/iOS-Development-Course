//
//  ViewController.swift
//  hw21_Obj-C_Denis_UIView_Animations
//
//  Created by Denis on 09.12.2021.
//

/*
 Вот и добрались до интересного! Надо немного поиграться чтобы усвоить материал
 Ученик.
 1. Создайте 4 вьюхи у левого края ипада.
 2. Ваша задача всех передвинуть горизонтально по прямой за одно и тоже время
 3. Для каждой вьюхи используйте свою интерполяцию (EasyInOut, EasyIn и т.д.). Это для того, чтобы вы увидели разницу своими собственными глазами
 4. Добавьте реверсивную анимацию и бесконечные повторения
 5. добавьте смену цвета на рандомный
 Студент
 5. Добавьте еще четыре квадратные вьюхи по углам – красную, желтую, зеленую и синюю
 6. За одинаковое время и при одинаковой интерполяции двигайте их всех случайно, либо по, либо против часовой стрелки в другой угол.
 7. Когда анимация закончиться повторите все опять: выберите направление и передвиньте всех
 8. Вьюха должна принимать в новом углу цвет той вьюхи, что была здесь до него ;)
 Мастер
 8. Нарисуйте несколько анимационных картинок человечка, который ходит.
 9. Добавьте несколько человечков на эту композицию и заставьте их ходить
 Супермена на этот раз нет, ничего сверхъестественного не смог придумать
 */

import UIKit

class ViewController: UIViewController {
    
    private let firstView = UIView()
    private let secondView = UIView()
    private let thirdView = UIView()
    private let forthView = UIView()
    
    private var leftUpCornerView = UIView()
    private let rightUpCornerView = UIView()
    private let leftDownCornerView = UIView()
    private let rightDownCornerView = UIView()
    
    private let human = UIImageView()
    
    private lazy var viewSide = min(view.frame.height, view.frame.width) / 5
    private lazy var centre = view.frame.height / 2
    private lazy var height = self.view.frame.height
    private lazy var width = self.view.frame.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureFirstView(view: firstView)
        configureSecondView(view: secondView)
        configureThirdView(view: thirdView)
        configureForthView(view: forthView)
        
        configureLeftUpCornerView(view: leftUpCornerView)
        configureRightUpCornerView(view: rightUpCornerView)
        configureRightDownCornerView(view: rightDownCornerView)
        configureLeftDownCornerView(view: leftDownCornerView)
        configureAllViews(views: allViews())
        
        animateFirstView(view: firstView)
        animateSecondView(view: secondView)
        animateThirdView(view: thirdView)
        animateForthView(view: forthView)
        
        animateLeftUpCornerView(view: leftUpCornerView)
        animateRightUpCornerView(view: rightUpCornerView)
        animateRightDownCornerView(view: rightDownCornerView)
        animateLeftDownCornerView(view: leftDownCornerView)
        
        configureHuman(view: human)
        animateHuman(view: human)
    }
}

private extension ViewController {
    
    func allViews() -> [UIView] {
        [firstView,
         secondView,
         thirdView,
         forthView,
         leftUpCornerView,
         rightUpCornerView,
         leftDownCornerView,
         rightDownCornerView
        ]
    }
    
    func configureHuman(view: UIImageView) {
        let image1 = UIImage(named: "1")!
        let image2 = UIImage(named: "2")!
        let image3 = UIImage(named: "3")!
        let image4 = UIImage(named: "4")!
        view.frame = CGRect(x: 0, y: centre - viewSide * 3, width: viewSide, height: viewSide)
        view.animationImages = [image1, image2, image3, image4]
        view.animationDuration = 1
        view.layer.cornerRadius = 15
        view.startAnimating()
        self.view.addSubview(view)
    }
    
    func configureFirstView(view: UIView) {
        view.frame = CGRect(x: 0, y: centre - viewSide * 2, width: viewSide, height: viewSide)
        view.backgroundColor = .red
    }
    
    func configureSecondView(view: UIView) {
        view.frame = CGRect(x: 0, y: centre - viewSide, width: viewSide, height: viewSide)
        view.backgroundColor = .yellow
    }
    
    func configureThirdView(view: UIView) {
        view.frame = CGRect(x: 0, y: centre, width: viewSide, height: viewSide)
        view.backgroundColor = .green
    }
    
    func configureForthView(view: UIView) {
        view.frame = CGRect(x: 0, y: centre + viewSide, width: viewSide, height: viewSide)
        view.backgroundColor = .blue
    }
    
    func configureLeftUpCornerView(view: UIView) {
        view.frame = CGRect(x: 0, y: 0, width: viewSide, height: viewSide)
        view.backgroundColor = .red
    }
    
    func configureRightUpCornerView(view: UIView) {
        view.frame = CGRect(x: width - viewSide, y: 0, width: viewSide, height: viewSide)
        view.backgroundColor = .yellow
    }
    
    func configureLeftDownCornerView(view: UIView) {
        view.frame = CGRect(x: 0, y: height - viewSide, width: viewSide, height: viewSide)
        view.backgroundColor = .green
    }
    
    func configureRightDownCornerView(view: UIView) {
        view.frame = CGRect(x: width - viewSide, y: height - viewSide, width: viewSide, height: viewSide)
        view.backgroundColor = .blue
    }
    
    func animateHuman(view: UIImageView) {
        UIView.animate(withDuration: 4,
                       delay: 0,
                       options: [UIView.AnimationOptions.curveEaseIn, UIView.AnimationOptions.autoreverse]) { [self] in
            view.frame = CGRect(x: width - viewSide, y: centre - viewSide * 3, width: viewSide, height: viewSide)
        } completion: { [self] finish in
            print("Animation is finihed - \(finish)")
            view.frame = CGRect(x: 0, y: centre - viewSide * 3, width: viewSide, height: viewSide)
            animateHuman(view: view)
        }
    }
    
    func randomColor() -> UIColor {
        let random = UIColor(
            red: CGFloat.random(in: 0.01...1),
            green: CGFloat.random(in: 0.01...1),
            blue: CGFloat.random(in: 0.01...1),
            alpha: 1)
        return random
    }
    
    func configureAllViews(views: [UIView]) {
        views
            .forEach {
                view.addSubview($0)
                $0.layer.cornerRadius = viewSide / 2
                $0.backgroundColor = randomColor()
            }
    }
    
    func animateFirstView(view: UIView) {
        UIView.animate(withDuration: 4,
                       delay: 0,
                       options: [UIView.AnimationOptions.curveEaseIn, UIView.AnimationOptions.autoreverse]) { [self] in
            view.frame = CGRect(x: width - viewSide, y: centre - viewSide * 2, width: viewSide, height: viewSide)
            view.backgroundColor = randomColor()
        } completion: { [self] finish in
            print("Animation is finihed - \(finish)")
            view.frame = CGRect(x: 0, y: centre - viewSide * 2, width: viewSide, height: viewSide)
            animateFirstView(view: view)
        }
    }
    
    func animateSecondView(view: UIView) {
        UIView.animate(withDuration: 4,
                       delay: 0,
                       options: [UIView.AnimationOptions.curveEaseInOut, UIView.AnimationOptions.autoreverse]) { [self] in
            view.frame = CGRect(x: width - viewSide, y: centre - viewSide, width: viewSide, height: viewSide)
            view.backgroundColor = randomColor()
        } completion: { [self] finish in
            print("Animation is finihed - \(finish)")
            view.frame = CGRect(x: 0, y: centre - viewSide, width: viewSide, height: viewSide)
            animateSecondView(view: view)
        }
    }
    
    func animateThirdView(view: UIView) {
        UIView.animate(withDuration: 4,
                       delay: 0,
                       options: [UIView.AnimationOptions.curveEaseOut, UIView.AnimationOptions.autoreverse]) { [self] in
            view.frame = CGRect(x: width - viewSide, y: centre, width: viewSide, height: viewSide)
            view.backgroundColor = randomColor()
        } completion: { [self] finish in
            print("Animation is finihed - \(finish)")
            view.frame = CGRect(x: 0, y: centre, width: viewSide, height: viewSide)
            animateThirdView(view: view)
        }
    }
    
    func animateForthView(view: UIView) {
        UIView.animate(withDuration: 4,
                       delay: 0,
                       options: [UIView.AnimationOptions.curveLinear, UIView.AnimationOptions.autoreverse]) { [self] in
            view.frame = CGRect(x: width - viewSide, y: centre + viewSide, width: viewSide, height: viewSide)
            view.backgroundColor = randomColor()
        } completion: { [self] finish in
            print("Animation is finihed - \(finish)")
            view.frame = CGRect(x: 0, y: centre + viewSide, width: viewSide, height: viewSide)
            animateForthView(view: view)
        }
    }
    
    func animateLeftUpCornerView(view: UIView) {
        UIView.animate(withDuration: 4,
                       delay: 0,
                       options: UIView.AnimationOptions.curveLinear) { [self] in
            view.frame = CGRect(x: width - viewSide, y: 0, width: viewSide, height: viewSide)
            view.backgroundColor = .yellow
        } completion: { [self] finish in
            print("Animation is finihed - \(finish)")
            view.frame = CGRect(x: 0, y: 0, width: viewSide, height: viewSide)
            view.backgroundColor = .red
            animateLeftUpCornerView(view: view)
        }
    }
    
    func animateRightUpCornerView(view: UIView) {
        UIView.animate(withDuration: 4,
                       delay: 0,
                       options: UIView.AnimationOptions.curveLinear) { [self] in
            view.frame = CGRect(x: width - viewSide, y: height - viewSide, width: viewSide, height: viewSide)
            view.backgroundColor = .green
        } completion: { [self] finish in
            print("Animation is finihed - \(finish)")
            view.frame = CGRect(x: width - viewSide, y: 0, width: viewSide, height: viewSide)
            view.backgroundColor = .yellow
            animateRightUpCornerView(view: view)
        }
    }
    
    func animateRightDownCornerView(view: UIView) {
        UIView.animate(withDuration: 4,
                       delay: 0,
                       options: UIView.AnimationOptions.curveLinear) { [self] in
            view.frame = CGRect(x: 0, y: height - viewSide, width: viewSide, height: viewSide)
            view.backgroundColor = .blue
        } completion: { [self] finish in
            print("Animation is finihed - \(finish)")
            view.frame = CGRect(x: width - viewSide, y: height - viewSide, width: viewSide, height: viewSide)
            view.backgroundColor = .green
            animateRightDownCornerView(view: view)
        }
    }
    
    func animateLeftDownCornerView(view: UIView) {
        UIView.animate(withDuration: 4,
                       delay: 0,
                       options: UIView.AnimationOptions.curveLinear) { [self] in
            view.frame = CGRect(x: 0, y: 0, width: viewSide, height: viewSide)
            view.backgroundColor = .red
        } completion: { [self] finish in
            print("Animation is finihed - \(finish)")
            view.frame = CGRect(x: 0, y: height - viewSide, width: viewSide, height: viewSide)
            view.backgroundColor = .blue
            animateLeftDownCornerView(view: view)
        }
    }
}

