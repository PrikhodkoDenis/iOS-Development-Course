/*
 Домашнее задание №4
 
 1. Создать 5 констант типа «строка». Константы могут содержать только цифры, цифры и буквы, только буквы. Найти сумму всех констант, приведя их к Int. При переводе применять Optional binding и принудительное разворачивание.
 2. Получаем ответ от сервера в виде тюпла  (statusCode: Int, message: String?, errorMessage: String?). Если statusCode от 200 до 300 включительно, то показать message, если в другом диапазоне, то показать errorMessage. После этого создать такой же тюпл в котором statusCode нет. Есть только message и errorMessage. Один из них nil, а другой всегда содержит что-то. Нужно разобраться что из них что содержит и показать соответствующую строку.
 3. Создать тюпл студента (имя, номер машины, оценка за предыдущую контрольную). Попрактиковаться где нужно ставить ? или ! При создании тюпла в нем не должно быть данных. Создать 5 тюплов для 5 разных студентов. Заполняем сначала имена студентов. Потом если есть машина, то добавить номер и потом добавить результат контрольной (от 0 до 5). Если не писал контрольную, то nil.  Вывести через print имя студента, какая машина если есть. Если нет, то написать. И на сколько сдал предыдущую контрольную и был ли он на ней.
 */

import UIKit

// Пункт 1

let resistance01 = "100"
let resistance02 = "200"
let resistance03 = "300 Ohm"
let resistance04 = "400 Ohm"
let resistance05 = "five hundred Ohm"

let convertedResistance01 = Int(resistance01)
let convertedResistance02 = Int(resistance02)
let convertedResistance03 = Int(resistance03)
let convertedResistance04 = Int(resistance04)
let convertedResistance05 = Int(resistance05)

// Применяю принудительное разворачивание:

var summaryResistance1 = 0

if convertedResistance01 != nil {
    summaryResistance1 += convertedResistance01!
}

if convertedResistance02 != nil {
    summaryResistance1 += convertedResistance02!
}

if convertedResistance03 != nil {
    summaryResistance1 += convertedResistance03!
}

if convertedResistance04 != nil {
    summaryResistance1 += convertedResistance04!
}

if convertedResistance05 != nil {
    summaryResistance1 += convertedResistance05!
}

summaryResistance1

// Применяю optional binding

var summaryResistance2 = 0

if let optionalResistance01 = convertedResistance01 {
    summaryResistance2 += optionalResistance01
}

if let optionalResistance02 = convertedResistance02 {
    summaryResistance2 += optionalResistance02
}

if let optionalResistance03 = convertedResistance03 {
    summaryResistance2 += optionalResistance03
}

if let optionalResistance04 = convertedResistance04 {
    summaryResistance2 += optionalResistance04
}

if let optionalResistance05 = convertedResistance05 {
    summaryResistance2 += optionalResistance05
}

summaryResistance2

// Пункт 2

var responseFromServer: (Int, String?, String?) = (statusCode: 204, message: "Good message", errorMessage: "Bad message")

if responseFromServer.0 >= 200, responseFromServer.0 < 300 {
    print(responseFromServer.1!)
} else {
    print(responseFromServer.2!)
}

var anotherResponse: (String?, String?) = (message: "Information received", errorMessage: nil)


if anotherResponse.0 != nil {
    print(anotherResponse.0!)
} else {
    print("Nil")
}

// Пункт 3

// Создаю карточку для студентов

var studentCard01: (name: String?, car: String?, result: Int?)
var studentCard02: (name: String?, car: String?, result: Int?)
var studentCard03: (name: String?, car: String?, result: Int?)
var studentCard04: (name: String?, car: String?, result: Int?)
var studentCard05: (name: String?, car: String?, result: Int?)

// Пришла информация об именах студентов, результатах контрольной и автомобиле

var student01: (String?, String?, Int?) = ("Denis", "Mazda 308", 5)
var student02: (String?, String?, Int?) = ("Ivan", "have no a car", 3)
var student03: (String?, String?, Int?) = ("Stas", "Volvo 777", nil)
var student04: (String?, String?, Int?) = ("Petr", "have no a car", 4)
var student05: (String?, String?, Int?) = ("Sergey", "Lada 123", 2)

// Заполняю карточки для студентов

studentCard01.name = student01.0
studentCard02.name = student02.0
studentCard03.name = student03.0
studentCard04.name = student04.0
studentCard05.name = student05.0

studentCard01.car = student01.1
studentCard02.car = student02.1
studentCard03.car = student03.1
studentCard04.car = student04.1
studentCard05.car = student05.1

studentCard01.result = student01.2
studentCard02.result = student02.2
studentCard03.result = student03.2
studentCard04.result = student04.2
studentCard05.result = student05.2

// Вывожу информацию о студентах в консоль

if studentCard01.name != nil {
    print("The name of student 01 is \(studentCard01.name!)")
}

if let car = studentCard01.car {
    print("The car of student 01 is \(car)")
}

if let result = studentCard01.result {
    print("The result of control work of student 01 is \(result)")
}

if studentCard02.name != nil {
    print("The name of student 02 is \(studentCard02.name!)")
}

if let car2 = studentCard02.car {
    print("The student 02 is \(car2)")
}

if let result2 = studentCard02.result {
    print("The result of control work of student 02 is \(result2)")
}

if studentCard03.name != nil {
    print("The name of student 03 is \(studentCard03.name!)")
}

if let car3 = studentCard03.car {
    print("The car of student 03 is \(car3)")
}

if studentCard03.result != nil {
    print("The result of control work of student 02 is \(studentCard03.result!)")
} else {
    print("The student 03 did not write a control work")
}

if studentCard04.name != nil {
    print("The name of student 04 is \(studentCard04.name!)")
}

if let car4 = studentCard04.car {
    print("The student 04 is \(car4)")
}

if let result4 = studentCard04.result {
    print("The result of control work of student 04 is \(result4)")
}

if studentCard05.name != nil {
    print("The name of student 05 is \(studentCard05.name!)")
}

if let car5 = studentCard05.car {
    print("The car of student 05 is \(car5)")
}

if let result5 = studentCard05.result {
    print("The result of control work of student 05 is \(result5)")
}


