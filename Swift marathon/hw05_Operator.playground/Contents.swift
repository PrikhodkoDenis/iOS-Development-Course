/*
 Домашнее задание №5
 
 1. Посчитать количество секунд от начала года до моего рождения. (Умножать и складывать).
 2. Посчитать в каком квартале я родился. Вывести на экран. (Деление).
 3. Есть шахматная доска. По вертикали и горизонтали от 1 до 8. Нужно сказать какое поле белое, а какое поле чёрное. (Две переменные х и у).
 */

import UIKit

//Пункт №1

let minute = 60
let hour = minute * 60
let day = hour * 24
let month28 = day * 28
let month30 = day * 30
let month31 = day * 31

let sum = month31 * 6 + month30 * 4 + month28 + day

print("Amount of seconds from 01 January to 02 December is \(sum)")

//Пункт 2

let monthOfBirthday = 12

var quaterOfBirthday = Int((Double(monthOfBirthday - 1) / 3) + 1)

print("Я родился в квартале номер \(quaterOfBirthday)")

//Пункт 3 Сделал сам без гугления и подсказок =)))

var x = 1
var y = 1

if ((x + y) % 2) == 0 {
    print("The color of square is black")
} else {
    print("The color of square is white")
}
