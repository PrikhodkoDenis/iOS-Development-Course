/*
 Урок 24 Extension
 1. Создайте расширение для Int с пропертисами isNegative, isPositive, bool(if == 0, return false).
 2. Добавьте проперти, которое возвращает количество символов в числе.
 3. Добавьте сабскрипт, который возвращает символ числа по индексу. Профи могут определить и сеттер.
 4. Расширить String, чтобы принимал сабскрипт вида s[0..<3] и мог также устанавливать значения используя его.
 5. Добавить стрингу метод truncate, чтобы отрезал лишние символы и , если таковые были, заменял их на троеточие:
 Let s = «Hi hi hi»
 s.truncate(4) // Hi h…
 s.truncate(10) // Hi hi hi
 */

//1. Создайте расширение для Int с пропертисами isNegative, isPositive, bool(if == 0, return false)

extension Int {
    
    var isPositive: Bool {
        self > 0
    }
    
    var isNegative: Bool {
        self < 0
    }
}

var number = 123456789
number.isPositive
number.isNegative

//2. Добавьте проперти, которое возвращает количество символов в числе

extension Int {
    
    var symbols: Int {
        self.description.count
    }
}

number.symbols

//3. Добавьте сабскрипт, который возвращает символ числа по индексу:

extension Int {
    
    subscript(value: Int) -> String  {
        get {
            guard value < self.symbols else { return "Inserted wrong index" }
            
            let numbers = self
                .description
                .reduce(into: [String]()) { $0 += [String($1)] }
            return numbers[value]
        }
        
        set {
            guard newValue.count < 2 else { return }
            var numbers = self
                .description
                .reduce(into: [String]()) { $0 += [String($1)] }
            numbers[value] = newValue
            let result = numbers
                .reduce(into: "") { $0 += $1 }
            self = Int(result) ?? 0
        }
    }
}

number = 123

number[0]
number[1]
number[2]

number[0] = "3"
number[1] = "2"
number[2] = "1"

number

number[777]        // такие действия не приведут к ошибке
number[0] = "777"
number[4] = "777"  // такие действия не приведут к ошибке
number             //значение осталось корректным

