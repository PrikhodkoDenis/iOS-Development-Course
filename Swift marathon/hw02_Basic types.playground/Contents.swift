/*
 Домашнее задание к уроку №2
 
 1. Прочитать документацию Apple.
 2. Используя print() вывести в консоль диапазоны чисел в Swift (строка и значение).
 3. Создать три константы (Int, Float, Double).
 4. Создать еще три константы (Int, Float, Double). Каждая из них является суммой первых трех.
 5. Создать условие сравнивающее Int и Double. Точнее ли результат Double чем Int. Вывести результат в консоль.
 */

//Пункт 2

let minInt = Int.min
let maxInt = Int.max
print("Минимальное значение Int равно \(minInt)")
print("Максимальное значение Int равно \(maxInt)")

let minInt8 = Int8.min
let maxInt8 = Int8.max
print("Минимальное значение Int8 равно \(minInt8)")
print("Максимальное значение Int8 равно \(maxInt8)")

let minInt16 = Int16.min
let maxInt16 = Int16.max
print("Минимальное значение Int16 равно \(minInt16)")
print("Максимальное значение Int16 равно \(maxInt16)")

let minInt32 = Int32.min
let maxInt32 = Int32.max
print("Минимальное значение Int32 равно \(minInt32)")
print("Максимальное значение Int32 равно \(maxInt32)")

let minInt64 = Int64.min
let maxInt64 = Int64.max
print("Минимальное значение Int64 равно \(minInt64)")
print("Максимальное значение Int64 равно \(maxInt64)")

let minUInt = UInt.min
let maxUInt = UInt.max
print("Минимальное значение UInt равно \(minUInt)")
print("Максимальное значение UInt равно \(maxUInt)")

let minUInt8 = UInt8.min
let maxUInt8 = UInt8.max
print("Минимальное значение UInt8 равно \(minUInt8)")
print("Максимальное значение UInt8 равно \(maxUInt8)")

let minUInt16 = UInt16.min
let maxUInt16 = UInt16.max
print("Минимальное значение UInt16 равно \(minUInt16)")
print("Максимальное значение UInt16 равно \(maxUInt16)")

let minUInt32 = UInt32.min
let maxUInt32 = UInt32.max
print("Минимальное значение UInt32 равно \(minUInt32)")
print("Максимальное значение UInt32 равно \(maxUInt32)")

let minUInt64 = UInt64.min
let maxUInt64 = UInt64.max
print("Минимальное значение UInt64 равно \(minUInt64)")
print("Максимальное значение UInt64 равно \(maxUInt64)")

//Пункт 3

let firstNumber = 7
let secondNumber: Float = 10.5
let thirdNumber = 33.3

//Пункт 4

let sumInt = Int(Double(firstNumber) + Double(secondNumber) + thirdNumber)
let sumFloat = Float(firstNumber) + secondNumber + Float(thirdNumber)
let sumDouble = Double(firstNumber) + Double(secondNumber) + thirdNumber

//Пункт 5

if sumDouble > Double(sumInt) {
    print("Значение Double точнее Int")
} else {
    print("Значение Int точнее Int")
}
