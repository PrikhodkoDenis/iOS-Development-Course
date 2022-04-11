/*
 Урок 14 Свойства
 
 1. Самостоятельно повторить проделанное в уроке.
 2. Добавить студенту property «Дата рождения» (пусть это будет еще одна структура, содержащая день, месяц, год) и два computed property: первое — вычисляющее его возраст, второе — вычисляющее, сколько лет он учился (считать, что он учился в школе с 6 лет, если студенту меньше 6 лет — возвращать 0).
 3. Создать структуру «Отрезок», содержащую две внутренние структуры «Точки». Структуру «Точка» создать самостоятельно, несмотря на уже имеющуюся в Swift’е. Таким образом, структура «Отрезок» содержит две структуры «Точки» — точки A и B (stored properties). Добавить два computed properties: « середина отрезка» и «длина» (считать математическими функциями).
 4. При изменении середины отрезка должно меняться положение точек A и B. При изменении длины, меняется положение точки B.
 */

//1. Самостоятельно повторить проделанное в уроке.
//2. Добавить студенту property «Дата рождения» (пусть это будет еще одна структура, содержащая день, месяц, год) и два computed property: первое — вычисляющее его возраст, второе — вычисляющее, сколько лет он учился (считать, что он учился в школе с 6 лет, если студенту меньше 6 лет — возвращать 0).

import Foundation

struct Student {
    
    var firstName: String {
        didSet {
            firstName = firstName.capitalized
        }
    }
    
    var lastName: String {
        didSet {
            lastName = lastName.capitalized
        }
    }
    
    var fullName: String {
        get {
            return firstName + " " + lastName
        }
        set {
            let words = newValue.components(separatedBy: " ")
            if words.count > 0 {
                firstName = words[0]
            }
            if words.count > 1 {
                lastName = words[1]
            }
        }
    }
    
    var dayOfBirth: Int {
        didSet {
            if dayOfBirth > 31 {
                dayOfBirth = oldValue
            }
        }
    }
    
    var monthOfBirth: Int {
        didSet {
            if monthOfBirth > 12 {
                monthOfBirth = oldValue
            }
        }
    }
    
    var yearOfBirth: Int {
        didSet {
            if yearOfBirth < 1900 {
                yearOfBirth = oldValue
            }
        }
    }
    
    
    var age: Int {
        
        let currentDate = Date()
        var dataComponents = DateComponents()
        dataComponents.year = yearOfBirth
        dataComponents.month = monthOfBirth
        dataComponents.day = dayOfBirth
        
        let userCalendar = Calendar.current
        let dateOfBirthday = userCalendar.date(from: dataComponents) ?? Date()
        let secondsFromDobToNow = currentDate.timeIntervalSince(dateOfBirthday)
        let secondsInYear: Double = 60 * 60 * 24 * 365
        
        return Int(secondsFromDobToNow / secondsInYear)
    }
    
    var yearsOfStudy: Int {
        if age <= 6 {
            return 0
        }
        return age - 6
    }
}

var student = Student(firstName: "Denis", lastName: "Prikhodko", dayOfBirth: 2, monthOfBirth: 12, yearOfBirth: 1987)

student.firstName = "DeNIs"
student.lastName = "PRIKhoDko"
student.fullName

student.age
student.yearsOfStudy

//3. Создать структуру «Отрезок», содержащую две внутренние структуры «Точки». Структуру «Точка» создать самостоятельно, несмотря на уже имеющуюся в Swift’е. Таким образом, структура «Отрезок» содержит две структуры «Точки» — точки A и B (stored properties). Добавить два computed properties: « середина отрезка» и «длина» (считать математическими функциями).

struct Point {
    
    var x = 0.0
    var y = 0.0
}

struct Line {
    
    var start = Point()
    var end = Point()
    
    var middleOfTheLine: Point {
        
        get {
            let middleOfLineX = (end.x + start.x) / 2
            let middleOfLineY = (end.y + start.y) / 2
            return Point(x: middleOfLineX, y: middleOfLineY)
        }
        
        set {
            let differenceX = newValue.x - middleOfTheLine.x
            let differenceY = newValue.y - middleOfTheLine.y
            
            start.x += differenceX
            start.y += differenceY
            
            end.x += differenceX
            end.y += differenceY
        }
    }
    
    var lenthOfTheLine: Double {
        
        get {
            let cathetus1 = end.x - start.x
            let cathetus2 = end.y - start.y
            let sumOfSquaredCathetus = (cathetus1 * cathetus1) + (cathetus2 * cathetus2)
            let hypotenuse = sumOfSquaredCathetus.squareRoot()
            return hypotenuse
        }
        set {
            end = Point(x: start.x + (end.x - start.x) * newValue / lenthOfTheLine, y: start.y + (end.y - start.y) * newValue / lenthOfTheLine)
        }
    }
}

var line = Line(start: Point(x: 5, y: 5), end: Point(x: 15, y: 15))

line.start.x
line.start.y
line.end.x
line.end.y

line.middleOfTheLine
line.lenthOfTheLine

//4. При изменении середины отрезка должно меняться положение точек A и B. При изменении длины, меняется положение точки B.

line.middleOfTheLine = Point(x: 15, y: 15)

line.start.x
line.start.y
line.end.x
line.end.y

line.lenthOfTheLine = 20

line.start.x
line.start.y
line.end.x
line.end.y
