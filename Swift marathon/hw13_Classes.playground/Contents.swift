/*
 Урок 13 Классы и структуры.
 
 1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).
 2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.
 3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.
 4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.
 5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.
 6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?
 7. Уровень супермен. Выполните задание шахмат из урока по энумам используя структуры либо классы.
 */

//1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).

struct farmer {
    var name: String
    var surname: String
    var year: Int
    var averageMark: Double
}

let farmer01 = farmer(name: "Andrey", surname: "Ivanchenko", year: 1967, averageMark: 4.5)
let farmer02 = farmer(name: "Vladimir", surname: "Chugunov", year: 1960, averageMark: 4.7)
let farmer03 = farmer(name: "Ruslan", surname: "Baranov", year: 1983, averageMark: 4.0)
let farmer04 = farmer(name: "Artem", surname: "Derygin", year: 1994, averageMark: 4.9)
let farmer05 = farmer(name: "Viktor", surname: "Derygin", year: 1990, averageMark: 4.3)

var journal = [farmer01, farmer02, farmer03, farmer04, farmer05]

//2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.

func printJournal(journal: [farmer]) {
    journal
        .enumerated()
        .forEach { (number, farmer) in
            print("\(number + 1). Name - \(farmer.name), surname - \(farmer.surname), DOB - \(farmer.year), average mark - \(farmer.averageMark)")
        }
}

print("")
printJournal(journal: journal)

//3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.

let sortedByMark = journal.sorted { farmer1, farmer2 in
    farmer1.averageMark > farmer2.averageMark
}

print("")
printJournal(journal: sortedByMark)

//4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.

let sortedBySurname = journal.sorted { farmer1, farmer2 in
    if farmer1.surname == farmer2.surname {
        return farmer1.name < farmer2.name
    }
    return farmer1.surname < farmer2.surname
}

print("")
printJournal(journal: sortedBySurname)

//5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.

var anotherJournal = journal

anotherJournal[0].name = "Ivan"
anotherJournal[1].name = "Ivan"
anotherJournal[2].name = "Ivan"
anotherJournal[3].name = "Ivan"
anotherJournal[4].name = "Ivan"

anotherJournal[0].surname = "Ivanov"
anotherJournal[1].surname = "Ivanov"
anotherJournal[2].surname = "Ivanov"
anotherJournal[3].surname = "Ivanov"
anotherJournal[4].surname = "Ivanov"

anotherJournal[0].year = 1900
anotherJournal[1].year = 1900
anotherJournal[2].year = 1900
anotherJournal[3].year = 1900
anotherJournal[4].year = 1900

anotherJournal[0].averageMark = 3
anotherJournal[1].averageMark = 3
anotherJournal[2].averageMark = 3
anotherJournal[3].averageMark = 3
anotherJournal[4].averageMark = 3

print("")
printJournal(journal: anotherJournal)
print("")
printJournal(journal: journal) //первый массив не изменился (Value type)

//6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?

class Bestfarmer {
    var name: String
    var surname: String
    var year: Int
    var averageMark: Double
    
    init(name: String, surname: String, year: Int, averageMark: Double) {
        self.name = name
        self.surname = surname
        self.year = year
        self.averageMark = averageMark
    }
}

let bestfarmer01 = Bestfarmer(name: "Andrey", surname: "Ivanchenko", year: 1967, averageMark: 4.5)
let bestfarmer02 = Bestfarmer(name: "Vladimir", surname: "Chugunov", year: 1960, averageMark: 4.7)
let bestfarmer03 = Bestfarmer(name: "Ruslan", surname: "Baranov", year: 1983, averageMark: 4.0)
let bestfarmer04 = Bestfarmer(name: "Artem", surname: "Derygin", year: 1994, averageMark: 4.9)
let bestfarmer05 = Bestfarmer(name: "Viktor", surname: "Derygin", year: 1990, averageMark: 4.3)

var bestJournal = [bestfarmer01, bestfarmer02, bestfarmer03, bestfarmer04, bestfarmer05]

func printBestJournal(journal: [Bestfarmer]) {
    journal
        .enumerated()
        .forEach { (number, farmer) in
            print("\(number + 1). Name - \(farmer.name), surname - \(farmer.surname), DOB - \(farmer.year), average mark - \(farmer.averageMark)")
        }
}

print("")
printBestJournal(journal: bestJournal)

let sortedBestfarmersMark = bestJournal.sorted { farmer1, farmer2 in
    farmer1.averageMark > farmer2.averageMark
}

print("")
printBestJournal(journal: sortedBestfarmersMark)

let sortedBestfarmersSurname = bestJournal.sorted { farmer1, farmer2 in
    if farmer1.surname == farmer2.surname {
        return farmer1.name < farmer2.name
    }
    return farmer1.surname < farmer2.surname
}

print("")
printBestJournal(journal: sortedBestfarmersSurname)

var anotherBestJournal = bestJournal

anotherBestJournal[0].name = "Ivan"
anotherBestJournal[1].name = "Ivan"
anotherBestJournal[2].name = "Ivan"
anotherBestJournal[3].name = "Ivan"
anotherBestJournal[4].name = "Ivan"

anotherBestJournal[0].surname = "Ivanov"
anotherBestJournal[1].surname = "Ivanov"
anotherBestJournal[2].surname = "Ivanov"
anotherBestJournal[3].surname = "Ivanov"
anotherBestJournal[4].surname = "Ivanov"

anotherBestJournal[0].year = 1900
anotherBestJournal[1].year = 1900
anotherBestJournal[2].year = 1900
anotherBestJournal[3].year = 1900
anotherBestJournal[4].year = 1900

anotherBestJournal[0].averageMark = 3
anotherBestJournal[1].averageMark = 3
anotherBestJournal[2].averageMark = 3
anotherBestJournal[3].averageMark = 3
anotherBestJournal[4].averageMark = 3

print("")
printBestJournal(journal: anotherBestJournal)
print("")
printBestJournal(journal: bestJournal)
