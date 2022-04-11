
//Домашнее задание № 7

/*
 1. создать массив "дни в месяцах"
 12 элементов содержащих количество дней в соответствующем месяце
 
 Используя цикл for и этот массив:
 
 - выведите количество дней в каждом месяце (без имен месяцев)
 - используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней
 - сделайте тоже самое, но используя массив тюплов с параметрами (имя месяца, кол-во дней)
 - сделайте тоже самое, только выводите дни в обратном порядке (порядок в массиве не меняется)
 - для произвольно выбранной даты (месяц и день) посчитайте количество дней до этой даты от начала года
 
 2. Сделайте первое задание к уроку номер 4 используя массивы:
 
 (создайте массив опшинал интов и посчитайте сумму)
 
 - в одном случае используйте optional binding
 - в другом forced unwrapping
 - а в третьем оператор ??
 
 3. создайте строку алфавит и пустой массив строк
 
 в цикле пройдитесь по всем символам строки попорядку, преобразовывайте каждый в строку и добавляйте в массив, причем так, чтобы на выходе получился массив с алфавитом задом-наперед
 */

import UIKit

// Пункт 1

let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

//- выведите количество дней в каждом месяце (без имен месяцев)

daysInMonth
    .forEach { number in
        print(number)
    }

//- используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней

let monthsInYear = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

daysInMonth
    .enumerated()
    .forEach{ (index, value) in
        print("\(monthsInYear[index]) - \(value)")
    }

//- сделайте тоже самое, но используя массив тюплов с параметрами (имя месяца, кол-во дней)

let monthAndDays: [(month: String, day: Int)] = [
    ("January", 31),
    ("February", 28),
    ("March", 31),
    ("April", 30),
    ("May", 31),
    ("June", 30),
    ("July", 31),
    ("August", 31),
    ("September", 30),
    ("October", 31),
    ("November", 30),
    ("December", 31)
]

monthAndDays
    .forEach { index in
        print("The month \(index.month) is contains \(index.day) days")
    }

//- сделайте тоже самое, только выводите дни в обратном порядке (порядок в массиве не меняется)

monthAndDays
    .reversed()
    .forEach { index in
        print("\(index.day)")
    }

// - для произвольно выбранной даты (месяц и день) посчитайте количество дней до этой даты от начала года
// 2 of December

var amountOfDays = 0

monthAndDays
    .forEach { index in
        if index.month == "December" {
            amountOfDays += 2
        }
        amountOfDays += index.day
    }

amountOfDays

// Пункт 2

//(создайте массив опшинал интов и посчитайте сумму)

let figures: [Int?] = [100, 200, nil, nil, nil]

//- в одном случае используйте optional binding

var sum = 0

figures
    .forEach { digit in
        if let number = digit {
            sum += number
        }
    }
sum

//- в другом forced unwrapping

var sum2 = 0

figures
    .forEach { digit in
        if digit != nil {
            sum2 += digit!
        }
    }

sum2

//- а в третьем оператор ??

var sum3 = 0

figures
    .forEach { number in
        sum3 += number ?? 0
    }

sum3


// Пункт 3

//создайте строку алфавит и пустой массив строк

let englishAlfabet = "abcdefghijklmnopqrstuvwxyz"

var letters = [String]()

//в цикле пройдитесь по всем символам строки попорядку, преобразовывайте каждый в строку и добавляйте в массив, причем так, чтобы на выходе получился массив с алфавитом задом-наперед

englishAlfabet
    .reversed()
    .forEach { letter in
        letters += [String(letter)]
    }

print("\(letters)")
