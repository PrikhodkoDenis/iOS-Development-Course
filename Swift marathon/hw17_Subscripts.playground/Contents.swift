import UIKit

/*
 Шахматная доска (Легкий уровень)
 1. Создайте тип шахматная доска.
 2. Добавьте сабскрипт, который выдает цвет клетки по координате клетки (буква и цифра).
 3. Если юзер ошибся координатами – выдавайте нил.
 
 Крестики нолики (Средний уровень)
 1. Создать тип, представляющий собой поле для игры в крестики нолики. На каждой клетке может быть только одно из значений: Пусто, Крестик, Нолик. Добавьте возможность красиво распечатывать поле.
 2. Добавьте сабскрипт, который устанавливает значение клетки по ряду и столбцу. Причем вы должны следить за тем, чтобы программа не падала если будет введен не существующий ряд или столбец.
 3. Также следите за тем, чтобы нельзя было устанавливать крестик либо нолик туда, где они уже что-то есть. Добавьте метод очистки поля.
 4. Если хотите, добавте алгоритм, который вычислит победителя.
 
 Морской бой (Тяжелый уровень)
 1. Создайте тип корабль, который будет представлять собой прямоугольник. В нем может быть внутренняя одномерная система координат (попахивает сабскриптом). Корабль должен принимать выстрелы по локальным координатам и вычислять когда он убит.
 2. Создайте двумерное поле, на котором будут располагаться корабли врага. Стреляйте по полю и подбейте вражеский четырех трубник.
 3. Сделайте для приличия пару выстрелов мимо, красивенько все выводите на экран.
 */

//Шахматная доска (Легкий уровень)

enum Color {
    case white
    case black
}

struct ChessDesk {
    
    subscript(column: String, row: Int) -> Color? {
        var number = 0
        
        switch column {
        case "a": number = 1
        case "b": number = 2
        case "c": number = 3
        case "d": number = 4
        case "e": number = 5
        case "f": number = 6
        case "g": number = 7
        case "h": number = 8
        default:  number = 0
        }
        
        if row < 1 || row > 8 || number == 0 {
            return nil
        } else if (number + row) % 2 == 0 {
            return .black
        } else {
            return .white
        }
    }
}

var gameField = ChessDesk()

gameField["a", 1]
gameField["a", 2]
gameField["z", 2]
gameField["b", 10]
gameField["z", 10]

// Крестики нолики (Средний уровень)

enum Sign: String {
    case cross = "✖️"
    case zero = "🔘"
    case empty = "◻️"
}

struct CrossAndZero {
    
    var field = Array(repeating: Sign.empty.rawValue, count: 9)
    
    func show() {
        print("\(field[0])\(field[1])\(field[2])")
        print("\(field[3])\(field[4])\(field[5])")
        print("\(field[6])\(field[7])\(field[8])")
        
        if field[0] == Sign.cross.rawValue && field[1] == Sign.cross.rawValue && field[2] == Sign.cross.rawValue {
            print("")
            print("Cross win!")
        }
        
        if field[3] == Sign.cross.rawValue && field[4] == Sign.cross.rawValue && field[5] == Sign.cross.rawValue {
            print("")
            print("Cross win!")
        }
        
        if field[6] == Sign.cross.rawValue && field[7] == Sign.cross.rawValue && field[8] == Sign.cross.rawValue {
            print("")
            print("Cross win!")
        }
        
        if field[0] == Sign.cross.rawValue && field[3] == Sign.cross.rawValue && field[6] == Sign.cross.rawValue {
            print("")
            print("Cross win!")
        }
        
        if field[1] == Sign.cross.rawValue && field[4] == Sign.cross.rawValue && field[7] == Sign.cross.rawValue {
            print("")
            print("Cross win!")
        }
        
        if field[2] == Sign.cross.rawValue && field[5] == Sign.cross.rawValue && field[8] == Sign.cross.rawValue {
            print("")
            print("Cross win!")
        }
        
        if field[0] == Sign.cross.rawValue && field[4] == Sign.cross.rawValue && field[8] == Sign.cross.rawValue {
            print("")
            print("Cross win!")
        }
        
        if field[2] == Sign.cross.rawValue && field[4] == Sign.cross.rawValue && field[6] == Sign.cross.rawValue {
            print("")
            print("Cross win!")
        }
        
        if field[0] == Sign.zero.rawValue && field[1] == Sign.zero.rawValue && field[2] == Sign.zero.rawValue {
            print("")
            print("Zero win!")
        }
        
        if field[3] == Sign.zero.rawValue && field[4] == Sign.zero.rawValue && field[5] == Sign.zero.rawValue {
            print("")
            print("Zero win!")
        }
        
        if field[6] == Sign.zero.rawValue && field[7] == Sign.zero.rawValue && field[8] == Sign.zero.rawValue {
            print("")
            print("Zero win!")
        }
        
        if field[0] == Sign.zero.rawValue && field[3] == Sign.zero.rawValue && field[6] == Sign.zero.rawValue {
            print("")
            print("Zero win!")
        }
        
        if field[1] == Sign.zero.rawValue && field[4] == Sign.zero.rawValue && field[7] == Sign.zero.rawValue {
            print("")
            print("Zero win!")
        }
        
        if field[2] == Sign.zero.rawValue && field[5] == Sign.zero.rawValue && field[8] == Sign.zero.rawValue {
            print("")
            print("Zero win!")
        }
        
        if field[0] == Sign.zero.rawValue && field[4] == Sign.zero.rawValue && field[8] == Sign.zero.rawValue {
            print("")
            print("Zero win!")
        }
        
        if field[2] == Sign.zero.rawValue && field[4] == Sign.zero.rawValue && field[6] == Sign.zero.rawValue {
            print("")
            print("Zero win!")
        }
    }
    
    mutating func clean() {
        print("")
        print("New game")
        print("")
        
        field = Array(repeating: Sign.empty.rawValue, count: 9)
    }
    
    subscript(number: Int) -> Sign.RawValue? {
        get {
            switch number {
            case 1...9: return field[number - 1]
            default: break
            }
            return nil
        }
        
        set {
            switch number {
            case 1...9 where field[number - 1] == Sign.empty.rawValue : return field[number - 1] = newValue ?? ""
            default: break
            }
        }
    }
}

var field = CrossAndZero()

field[1] = Sign.cross.rawValue
field[2] = Sign.cross.rawValue
field[3] = Sign.zero.rawValue
field[3] = Sign.cross.rawValue // невозможно установить крестик вместо нолика
field[5] = Sign.zero.rawValue
field[7] = Sign.cross.rawValue
field[999] = Sign.zero.rawValue  //неверные данные не приводят к ошибке
field[777]                       //неверные данные не приводят к ошибке
field.show()

field.clean() //очистка игрового поля

field[1] = Sign.cross.rawValue
field[4] = Sign.zero.rawValue
field[7] = Sign.cross.rawValue
field[9] = Sign.zero.rawValue
field[3] = Sign.cross.rawValue
field[2] = Sign.zero.rawValue
field[5] = Sign.cross.rawValue
field.show()

print("")

//Морской бой (Тяжелый уровень)
//1. Создайте тип корабль, который будет представлять собой прямоугольник. В нем может быть внутренняя одномерная система координат (попахивает сабскриптом). Корабль должен принимать выстрелы по локальным координатам и вычислять когда он убит.
//2. Создайте двумерное поле, на котором будут располагаться корабли врага. Стреляйте по полю и подбейте вражеский четырех трубник.
//3. Сделайте для приличия пару выстрелов мимо, красивенько все выводите на экран.

let (empty, ship, shoot, out)  = ("◻️", "⬛️", "💥", "🧿")

struct Game {
    
    var field = Array(repeating: empty, count: 100)
    
    func show() {
        print("   A B C D E F G H I J")
        var (i, j) = (0, 0)
        
        while i < 100 {
            let line = field
                .enumerated()
                .filter { $0.offset >= i && $0.offset < i + 10 }
                .reduce(into: "\(j) ") { $0 += $1.element }
            print(line)
            j += 1
            i += 10
        }
    }
    
    mutating func addShip(column: String, row: Int) {
        guard row < 10 else { return }
        let i = row * 10
        
        switch column.lowercased() {
        case "a": field[0 + i] = ship
        case "b": field[1 + i] = ship
        case "c": field[2 + i] = ship
        case "d": field[3 + i] = ship
        case "e": field[4 + i] = ship
        case "f": field[5 + i] = ship
        case "g": field[6 + i] = ship
        case "h": field[7 + i] = ship
        case "i": field[8 + i] = ship
        case "j": field[9 + i] = ship
        default: break
        }
    }
    
    subscript(column: String, row: Int) -> String? {
        get {
            return nil
        }
        
        set {
            guard row < 10 else { return }
            let i = row * 10
            
            switch column.lowercased() {
            case "a":
                if field[0 + i] == ship {
                    field[0 + i] = shoot
                } else if field[0 + i] == shoot {
                    print("Target is already fired 🔥\n")
                } else {
                    field[0 + i] = out
                }
            case "b":
                if field[1 + i] == ship {
                    field[1 + i] = shoot
                } else if field[1 + i] == shoot {
                    print("Target is already fired 🔥\n")
                } else {
                    field[1 + i] = out
                }
            case "c":
                if field[2 + i] == ship {
                    field[2 + i] = shoot
                } else if field[2 + i] == shoot {
                    print("Target is already fired 🔥\n")
                } else {
                    field[2 + i] = out
                }
            case "d":
                if field[3 + i] == ship {
                    field[3 + i] = shoot
                } else if field[3 + i] == shoot {
                    print("Target is already fired 🔥\n")
                } else {
                    field[3 + i] = out
                }
            case "e":
                if field[4 + i] == ship {
                    field[4 + i] = shoot
                } else if field[4 + i] == shoot {
                    print("Target is already fired 🔥\n")
                } else {
                    field[4 + i] = out
                }
            case "f":
                if field[5 + i] == ship {
                    field[5 + i] = shoot
                } else if field[5 + i] == shoot {
                    print("Target is already fired 🔥\n")
                } else {
                    field[5 + i] = out
                }
            case "g":
                if field[6 + i] == ship {
                    field[6 + i] = shoot
                } else if field[6 + i] == shoot {
                    print("Target is already fired 🔥\n")
                } else {
                    field[6 + i] = out
                }
            case "h":
                if field[7 + i] == ship {
                    field[7 + i] = shoot
                } else if field[7 + i] == shoot {
                    print("Target is already fired 🔥\n")
                } else {
                    field[7 + i] = out
                }
            case "i":
                if field[8 + i] == ship {
                    field[8 + i] = shoot
                } else if field[8 + i] == shoot {
                    print("Target is already fired 🔥\n")
                } else {
                    field[8 + i] = out
                }
            case "j":
                if field[9 + i] == ship {
                    field[9 + i] = shoot
                } else if field[9 + i] == shoot {
                    print("Target is already fired 🔥\n")
                } else {
                    field[9 + i] = out
                }
            default:
                break
            }
        }
    }
}

var player = Game()
player.addShip(column: "a", row: 0)
player.addShip(column: "b", row: 0)
player.addShip(column: "c", row: 0)
player.addShip(column: "d", row: 0)
player.addShip(column: "i", row: 7)
player.addShip(column: "i", row: 8)
player.addShip(column: "i", row: 9)
player.addShip(column: "c", row: 3)
player.addShip(column: "c", row: 4)
player.addShip(column: "c", row: 5)
player.addShip(column: "a", row: 9)
player.addShip(column: "b", row: 9)
player.addShip(column: "h", row: 2)
player.addShip(column: "i", row: 2)
player.addShip(column: "e", row: 7)
player.addShip(column: "f", row: 7)
player.addShip(column: "j", row: 0)
player.addShip(column: "a", row: 7)
player.addShip(column: "f", row: 9)
player.addShip(column: "f", row: 4)
player.addShip(column: "f", row: 77) // no error

player["a", 0] = shoot
player["b", 0] = shoot
player["c", 0] = shoot
player["d", 0] = shoot
player["j", 4] = shoot
player["g", 0] = shoot
player["f", 9] = shoot
player["d", 33] = shoot // no error
player["z", 77]         // no error
player["a", 0] = shoot
player["b", 7] = shoot
player["a", 9] = shoot
player["a", 8] = shoot

player.show()
