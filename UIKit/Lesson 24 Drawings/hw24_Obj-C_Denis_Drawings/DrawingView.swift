//
//  WhatmanPaper.swift
//  hw24_Obj-C_Denis_Drawings
//
//  Created by Denis on 31.12.2021.
//

/*
 Вот такой вот базовый урок получился. Эта тема – поле непаханое. Вы можете, если захотите, поискать кучу гайдов и примеров по этому материалу. Можно делать классные вещи. Но я не хочу на этом на долго останавливаться, нам нужно идти дальше.
 
 Ученик.
 1. Нарисуйте пятиконечную звезду.
 2. Добавьте окружности на концах звезды.
 3. Соедините окружности линиями.
 
 Студент.
 4. Закрасьте звезду любым цветом цветом.
 5. При каждой перерисовке рисуйте пять таких звезд (только мелких) в рандомных точках экрана.
 
 Мастер.
 6. После того как вы попрактиковались со звездами нарисуйте что-то свое, проявите творчество.
 
 Супермен.
 7. Сделайте простую рисовалку – веду пальцем по экрану и рисую.
 */

import UIKit

class DrawingView: UIView {

    var points = [CGPoint]()
    
    private var randomCGFloat: CGFloat {
        CGFloat.random(in: 0.01...1)
    } 
    
    private var randomColor: UIColor {
        UIColor(
            red: randomCGFloat,
            green: randomCGFloat,
            blue: randomCGFloat,
            alpha: 1
        )
    }

    override func draw(_ rect: CGRect) {
        
        let side = min(rect.height, rect.width) / 4
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.green.cgColor)
        let p1 = CGPoint(x: rect.minX, y: rect.maxY)
        let p2 = CGPoint(x: rect.midX, y: rect.minY + side)
        let p3 = CGPoint(x: rect.maxX, y: rect.maxY)
        context?.addLines(between: [p2, p3, p1, p2])
        let top = context?.currentPointOfPath ?? .zero
        context?.fillPath()
        context?.beginPath()
        
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineWidth(3)
        let s1 = CGPoint(x: rect.minX, y: rect.maxY)
        let s2 = CGPoint(x: rect.midX, y: rect.minY + side)
        let s3 = CGPoint(x: rect.maxX, y: rect.maxY)
        context?.addLines(between: [ s2, s3, s1, s2])
        context?.strokePath()
        context?.beginPath()

        let top1 = CGPoint(x: top.x, y: top.y - side / 2)
        var tops = [0: top1]
        let radiansBetweenTops = 72
        
        for i in 1...4 {
            context?.move(to: top)
            context?.setLineWidth(0)
            context?.setStrokeColor(UIColor.white.cgColor)
            context?.addArc(
                center: top,
                radius: side / 2,
                startAngle: deg2Rad(degree: 270),
                endAngle: deg2Rad(degree: 270 + radiansBetweenTops * i),
                clockwise: false
            )
            tops[i] = (context?.currentPointOfPath) ?? .zero
            context?.strokePath()
        }

        let top2 = tops[1] ?? .zero
        let top3 = tops[2] ?? .zero
        let top4 = tops[3] ?? .zero
        let top5 = tops[4] ?? .zero

        context?.setFillColor(UIColor.red.cgColor)
        context?.addLines(between: [top1, top3, top5, top2, top4, top1])
        context?.fillPath()
        context?.beginPath()
        
        for i in 1...5 {
            context?.setLineWidth(7)
            context?.setStrokeColor(UIColor.white.cgColor)
            context?.addArc(
                center: top,
                radius: CGFloat(150 * i),
                startAngle: 0,
                endAngle: 360,
                clockwise: false
            )
            context?.strokePath()
            context?.beginPath()
        }
        
        for i in 1...16 {
            let toyRect = CGRect(
                x: top.x - side / 7.16,
                y: top.y + CGFloat(Int(side) / 2 * i),
                width: side / 3,
                height: side / 3
            )
            let toy = UIBezierPath(roundedRect: toyRect, cornerRadius: 25)
            context?.setFillColor(randomColor.cgColor)
            context?.addPath(toy.cgPath)
            context?.fillPath()
            context?.beginPath()
        }
        
        context?.setStrokeColor(randomColor.cgColor)
        context?.setLineWidth(5)
        context?.setLineCap(.round)
        context?.addLines(between: points)
        context?.strokePath()
    }
}

private extension DrawingView {
    private func deg2Rad(degree: Int) -> CGFloat {
        CGFloat(degree) * .pi / 180
    }
}


