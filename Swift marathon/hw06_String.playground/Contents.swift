/*
 Домашнее задание №6
 
 1. Создать 5 констант типа «строка». Константы могут содержать только цифры, цифры и буквы, только буквы. Найти сумму всех констант, приведя их к Int. При переводе применять оператор ?? Все это выражение записать в строке (Образец: 5 + 2 + nil + 3 + nil = 10). Распечатать в print() 2 раза. В первом случае использовать интерполяцию строк. Во втором конкатенацию строк.
 2. Выбрать 5 прикольных символ Unicode. Должна быть строка из этих 5 символов. Посчитать длину строки с помощью countElements и .length Посмотреть разницу.
 3. Cделать английский алфавит из маленьких букв. Найти индекс переменной Character в алфавите (какой-либо буквы) C помощью оператора for in.
 */

import UIKit

//Пункт 1

let resistance01 = "100"
let resistance02 = "200"
let resistance03 = "300 Ohm"
let resistance04 = "400 Ohm"
let resistance05 = "five hundred Ohm"

let res01 = Int(resistance01) ?? 0
let res02 = Int(resistance02) ?? 0
let res03 = Int(resistance03) ?? 0
let res04 = Int(resistance04) ?? 0
let res05 = Int(resistance05) ?? 0

//Интерполяция строк

print("Summary resistance of scheme is \(res01) + \(res02) + \(res03) + \(res04) + \(res05) = \(res01 + res02 + res03 + res04 + res05)")

// Конкатенация строк

var str01 = String(res01)
var str02 = String(res02)
var str03 = String(res03)
var str04 = String(res04)
var str05 = String(res05)
var str06 = "Summary resistance of scheme is "
var str07 = " = "
var sum = String(res01 + res02 + res03 + res04 + res05)

str01 += " + "
str02 += " + "
str03 += " + "
str04 += " + "

print(str06 + str01 + str02 + str03 + str04 + str05 + str07 + sum)

//Пункт 2

let myName = "\u{2202}\u{212f}\u{20dd}\u{210b}\u{1ef1}\u{301}\u{010c}"
myName.count
(myName as NSString).length
myName.unicodeScalars.count

let funSeaman = "\u{2693}\u{270c}"
print(myName)
print(funSeaman)

//Пункт 3

let englishAlfabet = "abcdefghijklmnopqrstuvwxyz"

let character: Character = "z"

for tuple in englishAlfabet.enumerated() {
    if tuple.element == character {
        print("Index of letter \(character) is \(tuple.offset)")
        break
    }
}



