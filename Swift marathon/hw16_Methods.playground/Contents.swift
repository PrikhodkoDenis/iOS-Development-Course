import UIKit

/*
 Сделаем с вами небольшую игру
 1. Создайте тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У него есть координата в комнате X и Y. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате.
 2. Персонажу добавьте метод идти, который принимает энумчик лево, право, верх, вниз.
 Этот метод должен передвигать персонажа. Реализуйте правило что персонаж не должен покинуть пределы комнаты. Подвигайте персонажа и покажите это графически.
 3. Создать тип Ящик. У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.
 4. Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигайте ящик.
 5. Добавьте точку в комнате, куда надо ящик передвинуть и двигайте.
 Для суперменов: можете добавить массив ящиков и можете сделать консольное приложение.
 */

enum Direction {
    case up
    case down
    case left
    case right
}

struct Point {
    
    static var image = "🔲"
    
    var coordX: Int {
        didSet {
            if coordX > Room.width || coordX < 1 {
                coordX = oldValue
            }
        }
    }
    
    var coordY: Int {
        didSet {
            if coordY > Room.height || coordY < 1 {
                coordY = oldValue
            }
        }
    }
}

struct Room {
    
    static var height = 4
    static var width = 4
    static var emptyField = "⬜️"
}

struct Ghost {
    
    static var image = "👻"
    
    var coordX: Int {
        didSet {
            if coordX > Room.width || coordX < 1 {
                coordX = oldValue
            }
        }
    }
    
    var coordY: Int {
        didSet {
            if coordY > Room.height || coordY < 1 {
                coordY = oldValue
            }
        }
    }
    
    mutating func move(to: Direction) {
        switch to {
        case .right:
            coordX += 1
        case .left:
            coordX -= 1
        case .down:
            coordY += 1
        case .up:
            coordY -= 1
        }
    }
}

struct Box {
    
    static var image = "📦"
    
    var coordX: Int {
        didSet {
            if coordX > Room.width || coordX < 1 {
                coordX = oldValue
            }
        }
    }
    
    var coordY: Int {
        didSet {
            if coordY > Room.height || coordY < 1 {
                coordY = oldValue
            }
        }
    }
    
    mutating func move(to: Direction) {
        switch to {
        case .right:
            coordX += 1
        case .left:
            coordX -= 1
        case .down:
            coordY += 1
        case .up:
            coordY -= 1
        }
    }
}

var ghost = Ghost(coordX: 1, coordY: 1)
var box = Box(coordX: 2, coordY: 1)
var point = Point(coordX: Room.width, coordY: Room.height)

func printGame() {
    if ghost.coordX == box.coordX && ghost.coordY == box.coordY {
        
        if box.coordX == 1 {
            box.move(to: .right)
        } else if box.coordX == Room.width {
            box.move(to: .left)
        } else if box.coordY == 1 {
            box.move(to: .down)
        } else if box.coordY == Room.height {
            box.move(to: .right)
        } else {
            box.move(to: .down)
        }
    }

    for y in 1...Room.height {
        var line = ""
        for x in 1...Room.width {
            if x == ghost.coordX && y == ghost.coordY {
                line = "\(line)\(Ghost.image)"
            } else if x == box.coordX && y == box.coordY {
                line = "\(line)\(Box.image)"
            } else if x == point.coordX && y == point.coordY {
                line = "\(line)\(Point.image)"
            } else {
                line = "\(line)\(Room.emptyField)"
            }
        }
        
        print("\(line)")
    }
    
    if box.coordX == point.coordX && box.coordY == point.coordY {
        print("")
        print("Win!")
    }
}

print("Start")
printGame()
print("")

print("Go right")
ghost.move(to: .right)
printGame()
print("")

print("Go down")
ghost.move(to: .down)
printGame()
print("")

print("Go down")
ghost.move(to: .down)
printGame()
print("")

print("Go down")
ghost.move(to: .down)
printGame()
print("")

print("Go right")
ghost.move(to: .right)
printGame()
print("")

