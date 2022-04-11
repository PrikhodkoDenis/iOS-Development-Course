/*
 Урок 12 Энумы
 
 1. Создать энум с шахматными фигурами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат.
 2. Поместите эти фигуры в массив фигур. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.
 3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)
 4. Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.
 5. Следите чтобы ваш код был красивым!
 */

//1. Создать энум с шахматными фигурами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции.

enum Figure {
    
    enum Name: String {
        case king = "King"
        case queen = "Queen"
        case bishop = "Bishop"
        case knight = "Knight"
        case castle = "Castle"
        case pawn = "Pawn"
    }
    
    enum Color {
        case white
        case black
    }
    
    typealias Position = (x: Int, y: Int)
    
    case king(color: Color, position: Position)
    case queen(color: Color, position: Position)
    case bishop(color: Color, position: Position)
    case knight(color: Color, position: Position)
    case castle(color: Color, position: Position)
    case pawn(color: Color, position: Position)
    
}

//Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат.

let blackKing: Figure = .king(color: .black, position: (x: 8, y: 8))
let whiteQueen: Figure = .queen(color: .white, position: (x: 7, y: 7))
let whiteKing: Figure = .king(color: .white, position: (x: 6, y: 6))

//2. Поместите эти фигуры в массив фигур. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.

let figures = [blackKing, whiteKing, whiteQueen]

func figureInfo(figure: Figure) -> Void {
    switch figure {
    case .king(let color, let position):
        print("\(Figure.Name.king.rawValue) \(color) \(position)")
    case .queen(let color, let position):
        print("\(Figure.Name.queen.rawValue) \(color) \(position)")
    case .bishop(let color, let position):
        print("\(Figure.Name.bishop.rawValue) \(color) \(position)")
    case .knight(let color, let position):
        print("\(Figure.Name.knight.rawValue) \(color) \(position)")
    case .castle(let color, let position):
        print("\(Figure.Name.castle.rawValue) \(color) \(position)")
    case .pawn(let color, let position):
        print("\(Figure.Name.pawn.rawValue) \(color) \(position)")
    }
}

func figuresInfo(fig: [Figure], fun: (Figure) -> Void) {
    for fig in figures {
        figureInfo(figure: fig)
    }
}

figuresInfo(fig: figures, fun: figureInfo(figure:))

//3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает).

let blackKingUnicode  = "\u{265a}"
let whiteKingUnicode  = "\u{2654}"
let blackQueenUnicode = "\u{265b}"

for coordY in 1...8 {
    var line = "\(9 - coordY)"
    for coordX in 1...8 {
        let cell = (coordY + coordX) % 2 == 0 ? "⬛️" : "⬜️"
        line = "\(line)\(cell)"
    }
    print("\(line)")
}

print("  A B C D E F G H")


