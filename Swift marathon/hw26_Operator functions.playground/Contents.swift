/*
 1. Для нашей структуры Point перегрузить операторы: -, -=, prefix —, postfix —, /, /=, *=
 2. Создать структуру Rect, аналог CGRect, содержащую структуру Size и Point. Перегрузить операторы +, +=, -, -= для этой структуры.
 3. Перегрузить оператор + и +=(добавлять число к строке) для String, но второй аргумент должен быть Int
 4. Создать свой оператор, который будет принимать 2 String и в первом аргументе, при совпадении буквы с вторым аргументом, менять совпадения на заглавные буквы
 */

struct Point {
    var x: Int
    var y: Int
}

var p1 = Point(x: 15, y: 15)
var p2 = Point(x: 5, y: 5)

func - (a: Point, b: Point) -> Point {
    Point(x: a.x - b.x, y: a.y - b.y)
}

p1 - p2

func -= (a: inout Point, b: Point) {
    a = a - b
}

p1 -= p2

prefix func - (a: inout Point) -> Point {
    Point(x: -a.x, y: -a.y)
}

-p1

func / (a: Point, b: Point) -> Point {
    Point(x: a.x / b.x, y: a.y / b.y)
}

p1 / p2

func /= (a: inout Point, b: Point) {
    a = a / b
}

p1 /= p2

func * (a: Point, b: Point) -> Point {
    Point(x: a.x * b.x, y: a.y * b.y)
}

p1 * p2

func *= (a: inout Point, b: Point) {
    a = a * b
}

p1 *= p2

//2. Создать структуру Rect, аналог CGRect, содержащую структуру Size и Point. Перегрузить операторы +, +=, -, -= для этой структуры.

struct NewPoint {
    var x = 0, y = 0
}

struct Size {
    var width = 0, height = 0
}

struct Rect {
    var origin = NewPoint()
    var size = Size()
}

var rect1 = Rect(origin: NewPoint(x: 0, y: 0 ), size: Size(width: 30, height: 15))
var rect2 = Rect(origin: NewPoint(x: 10, y: 0 ), size: Size(width: 20, height: 10))

func + (rect1: Rect, rect2: Rect) -> Rect {
    let rectSquare1 = rect1.size.width * rect1.size.height
    let rectSquare2 = rect2.size.width * rect2.size.height
    let squareOfSum = rectSquare1 + rectSquare2
    return Rect(origin: NewPoint(x: 0, y: 0), size: Size(width: squareOfSum / 10 , height: 10))
}

rect1 + rect2

func - (rect1: Rect, rect2: Rect) -> Rect {
    let rectSquare1 = rect1.size.width * rect1.size.height
    let rectSquare2 = rect2.size.width * rect2.size.height
    let squareOfSum = rectSquare1 - rectSquare2
    return Rect(origin: NewPoint(x: 0, y: 0), size: Size(width: squareOfSum / 10 , height: 10))
}

rect1 - rect2

func += (rect1: inout Rect, rect2: Rect) {
    let rectSquare1 = rect1.size.width * rect1.size.height
    let rectSquare2 = rect2.size.width * rect2.size.height
    let squareOfSum = rectSquare1 + rectSquare2
    rect1 = Rect(origin: NewPoint(x: 0, y: 0), size: Size(width: squareOfSum / 10, height: 10))
}

rect1 += rect2

func -= (rect1: inout Rect, rect2: Rect) {
    let rectSquare1 = rect1.size.width * rect1.size.height
    let rectSquare2 = rect2.size.width * rect2.size.height
    let squareOfDif = rectSquare1 - rectSquare2
    rect1 = Rect(origin: NewPoint(x: 0, y: 0), size: Size(width: squareOfDif / 10, height: 10))
}

rect1 -= rect2

//3. Перегрузить оператор + и += (добавлять число к строке) для String, но второй аргумент должен быть Int.

func + (str1: String, str2: Int) -> String {
    
    var letters = [Character]()
    str1
        .forEach { letters += [$0] }
    
    String(str2)
        .forEach { letters += [$0] }
    
    let result = letters
        .reduce(into: "") { $0 += String($1) }
    
    return result
}

let word = "Hello "
let number = 12345
let sum = word + number

func += (str1: inout String, str2: Int) {
    str1 = str1 + str2
}

var word2 = "Goodbye "
let number2 = 777
word2 += number2

//4. Создать свой оператор, который будет принимать 2 String и в первом аргументе, при совпадении буквы с вторым аргументом, менять совпадения на заглавные буквы.

infix operator +++

func +++ (str1: inout String, str2: String) {
    
    var result = ""
    for letter in str1 {
        if str2.contains(letter) {
            result += letter.uppercased()
        } else {
            result += String(letter)
        }
        str1 = result
    }
}

var word3 = "hello my friend"
var word4 = "world"
word3 +++ word4
