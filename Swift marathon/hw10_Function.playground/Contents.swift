import UIKit

/*
 Урок 10 Функции
 
 1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации.
 2. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль
 3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке. Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую.
 4. Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?
 5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)
 */

//1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации.

func music() -> String {
    let music = "\u{266b}"
    return music
}

func heart() -> String {
    let heart = "\u{2661}"
    return heart
}

print("\(music()) in my \(heart())")

//2. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль

func chessBoard (letter: String, number: Int ) -> String {
    var numberOfLetter = 0
    switch letter.lowercased() {
    case "a":
        numberOfLetter = 1
    case "b":
        numberOfLetter = 2
    case "c":
        numberOfLetter = 3
    case "d":
        numberOfLetter = 4
    case "e":
        numberOfLetter = 5
    case "f":
        numberOfLetter = 6
    case "g":
        numberOfLetter = 7
    case "h":
        numberOfLetter = 8
    default:
        break
    }
    
    var colorOfField = ""
    if ((numberOfLetter + number) % 2) == 0 {
        colorOfField = "Black"
    } else {
        colorOfField = "White"
    }
    return colorOfField
}

let color = chessBoard(letter: "a", number: 1)
print("The color of game field is \(color)")

//3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке. Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую.

//Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке.

func reversedNumbers(numbers: [Int]) -> ([Int]) {
    return numbers.reversed()
}

print("\(reversedNumbers(numbers: [1, 2, 3, 4, 5]))")

//Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке.

func reversedSequence(sequence: Int...) -> ([Int]) {
    return sequence.reversed()
}

print("\(reversedSequence(sequence: 10, 20, 30, 40, 50))")

//4. Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?

func changeValues(numbers: inout [Int]) -> ([Int]) {
    let result = numbers.map { number in
        return number + 1000
    }
    return result
}

var someNumbers = [1, 2, 3, 4, 5]
print("\(changeValues(numbers: &someNumbers))")

//5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания (можно заменить на пробелы), делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)

let someText = "Asynchronous code Consider similar code, but assume each iteration happens as a reaction to a tap on a button. As the user repeatedly taps on the button, the app prints out the next element in an array: var array = [1, 2, 3] var currentIndex = 0 // This method is connected in Interface Builder to a button @IBAction private func printNext() { print(array[currentIndex]) if currentIndex != array.count - 1 { currentIndex += 1 } } Think about this code in the same context as you did for the previous one. As the user taps the button, will that print all of the array’s elements? You really can’t say. Another piece of asynchronous code might remove the last element, before it’s been printed."

func crazyEditor (text: String) -> (String) {
    var resultString = ""
    for letter in text {
        switch letter.lowercased() {
        case "e":
            resultString += "E"
        case "y":
            resultString += "Y"
        case "u":
            resultString += "U"
        case "i":
            resultString += "I"
        case "o":
            resultString += "O"
        case "a":
            resultString += "A"
        case "q":
            resultString += "q"
        case "w":
            resultString += "w"
        case "r":
            resultString += "r"
        case "t":
            resultString += "t"
        case "p":
            resultString += "p"
        case "s":
            resultString += "s"
        case "d":
            resultString += "d"
        case "f":
            resultString += "f"
        case "g":
            resultString += "g"
        case "h":
            resultString += "h"
        case "j":
            resultString += "j"
        case "k":
            resultString += "k"
        case "l":
            resultString += "l"
        case "z":
            resultString += "z"
        case "x":
            resultString += "x"
        case "c":
            resultString += "c"
        case "v":
            resultString += "v"
        case "b":
            resultString += "b"
        case "n":
            resultString += "n"
        case "m":
            resultString += "m"
        case "0":
            resultString += "zero"
        case "1":
            resultString += "one"
        case "2":
            resultString += "two"
        case "3":
            resultString += "three"
        case "4":
            resultString += "four"
        case "5":
            resultString += "five"
        case "6":
            resultString += "six"
        case "7":
            resultString += "seven"
        case "8":
            resultString += "eight"
        case "9":
            resultString += "nine"
        case ",", ".", "<", ">", ";", ":", "'", "[", "]", "{", "}", "(", ")", "/", "|", "!", "?", "+", "=", "-", "*", "§", "±", "@", "#", "$", "%", "^", "&":
            resultString += "_"
        default:
            resultString += " "
            break
        }
    }
    return resultString
}

print(crazyEditor(text: someText))
