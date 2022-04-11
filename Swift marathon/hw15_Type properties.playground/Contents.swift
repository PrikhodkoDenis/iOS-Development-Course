/*
 Урок 15 Свойства типов.
 
 1. Создать структуру “Описание файла” содержащую свойства:
 - путь к файлу
 - имя файла
 - максимальный размер файла на диске
 - путь к папке, содержащей этот файл
 - тип файла (скрытый или нет)
 - содержимое файла (можно просто симулировать контент)
 Главная задача – это использовать правильные свойства там, где нужно, чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.
 2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.
 3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
 - минимальный и максимальный возраст каждого объекта
 - минимальную и максимальную длину имени и фамилии
 - минимально возможный рост и вес
 - самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса
 */

//Пункт 1

import UIKit

enum FileType {
    case visible
    case hidden
}

struct DescriptionOfTheFile {
    
    static var maxFileSize = 100
    
    var path: String {
        return "\(pathToFolder)\(fileName)"
    }
    
    var fileSize: Int {
        didSet {
            if fileSize > DescriptionOfTheFile.maxFileSize {
                fileSize = oldValue
            }
        }
    }
    
    var fileName: String
    var pathToFolder: String
    var typeFile: FileType
    
    lazy var fileContent = "password: qwerty12345"
}

let file = DescriptionOfTheFile(fileSize: 50, fileName: "password", pathToFolder: "d:\\", typeFile: .hidden)

//2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.


enum Rainbow: Int {
    
    static var numberOfColor = 7
    static var firstColor = Rainbow.red
    static var lastColor = Rainbow.purple
    
    case red = 0xff0000
    case orange = 0xffa500
    case yellow = 0xffff00
    case green = 0x008000
    case cyan = 0x00ffff
    case blue = 0x0000ff
    case purple = 0x800080
}

Rainbow.numberOfColor
Rainbow.firstColor
Rainbow.lastColor

//3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому //классу чтобы контролировать:
//- минимальный и максимальный возраст каждого объекта
//- минимальную и максимальную длину имени и фамилии
//- минимально возможный рост и вес
//- самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса

class Human {
    
    static let minAge = 0
    static let maxAge = 150
    
    static let minSymbols = 1
    static let maxSymbols = 50
    
    static let minHeight = 50
    static let maxHeight = 300
    
    static let minWeight = 1
    static let maxWeight = 300
    
    static var totalHumans = 0
    
    var firstName: String {
        didSet {
            if firstName.count < Human.minSymbols || firstName.count > Human.maxSymbols {
                firstName = oldValue
            }
        }
    }
    
    var lastName: String {
        didSet {
            if lastName.count < Human.minSymbols || lastName.count > Human.maxSymbols {
                lastName = oldValue
            }
        }
    }
    
    var age: Int {
        didSet {
            if age < Human.minAge || age > Human.maxAge  {
                age = oldValue
            }
        }
    }
    
    var height: Int {
        didSet {
            if height < Human.minHeight || height > Human.maxHeight {
                height = oldValue
            }
        }
    }
    
    var weight: Int {
        didSet {
            if weight < Human.minWeight || weight > Human.maxWeight {
                weight = oldValue
            }
        }
    }
    
    init(firstName: String, lastName: String, age: Int, height: Int, weight: Int) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.height = height
        self.weight = weight
        
        Human.totalHumans += 1
    }
}

let human1 = Human(firstName: "Ivan", lastName: "Ivanov", age: 35, height: 178, weight: 77)
let human2 = Human(firstName: "Petr", lastName: "Petrov", age: 45, height: 185, weight: 90)

Human.totalHumans

