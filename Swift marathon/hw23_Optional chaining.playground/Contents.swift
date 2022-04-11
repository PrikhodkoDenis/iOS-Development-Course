/*
 Урок 23 Optional chaining и Type casting
 Сегодня будем строить свою небольшую социальную сеть.
 •    Сделать класс Человек, у этого класса будут проперти Папа, Мама, Братья, Сестры (массивы) (всё опционально).
 Сделать примерно 30 человек, взять одного из них, поставить ему Папу/Маму. Папе и Маме поставить Пап/Мам/Братьев/Сестер. Получится большое дерево иерархии.
 Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь, итд (Optional chaining)
 •    Все сестры, матери,… должны быть класса Женщина, Папы, братья,… класса Мужчины.
 У Мужчин сделать метод Двигать_диван, у Женщин Дать_указание (двигать_диван). Всё должно работать как и ранее.
 Всех этих людей положить в массив Семья, пройти по массиву посчитать количество Мужчин и Женщин, для каждого Мужчины вызвать метод Двигать_диван, для каждой женщины Дать_указание.
 •    Расширить класс человек, у него будет проперти Домашние_животные. Животные могут быть разные (попугаи, кошки, собаки…) их может быть несколько, может и не быть вообще.
 Раздать некоторым людям домашних животных. Пройти по всему массиву людей. Проверить каждого человека на наличие питомца, если такой есть – добавлять всех животных в массив животных. Посчитать сколько каких животных в этом массиве.
 Вся эта живность должна быть унаследована от класса Животные. У всех животных должен быть метод Издать_звук(крик) и у каждого дочернего класса этот метод переопределён на свой, т.е. каждое животное издаёт свой звук.
 Когда проходим по массиву животных, каждый представитель вида животных должен издать свой звук.
 Обязательно используем в заданиях Optional chaining и Type casting.
 */

var createdObjects = 0
var deletedObjects = 0

class Human {
    
    var name: String
    var father: Man?
    var mother: Woman?
    var grandFather: Man?
    var grandMother: Woman?
    var son: Man?
    var daughter: Woman?
    var brothers: [Man]?
    var sisters: [Woman]?
    var pets: [Animal]?
    
    init(name: String) {
        self.name = name
        createdObjects += 1
    }
    
    deinit {
        deletedObjects += 1
    }
}

class Man: Human {
    
    func buildHouse() { }
}

class Woman: Human {
    
    func plantFlowers() { }
}

class Animal {
    
    var nickName: String
    
    init(nickName: String) {
        self.nickName = nickName
        createdObjects += 1
    }
    
    func makeSound() { }
    
    deinit {
        deletedObjects += 1
    }
}

class Dog: Animal {
    
    override func makeSound() {
        print("The dog is barking")
    }
}

class Cat: Animal {
    
    override func makeSound() {
        print("The cat is mewing")
    }
}

class Bird: Animal {
    
    override func makeSound() {
        print("The bird is chirping")
    }
}

let playground = true

if playground {
    let father = Man(name: "Ivan")
    let mother = Woman(name: "Olga")
    let brotherOfFather = Man(name: "Sergey")
    let sisterOfFather = Woman(name: "Elena")
    let brotherOfMother = Man(name: "Alexey")
    let sisterOfMother = Woman(name: "Irina")
    
    let cousin1 = Man(name: "Petr")
    let cousin2 = Woman(name: "Oksana")
    let cousin3 = Man(name: "Alex")
    let cousin4 = Woman(name: "Veronica")
    let cousin5 = Man(name: "Vladimir")
    let cousin6 = Woman(name: "Polina")
    let cousin7 = Man(name: "Igor")
    let cousin8 = Woman(name: "Marina")
    
    let grandFather = Man(name: "Artem")
    let grandMother = Woman(name: "Inna")
    let olderBrother = Man(name: "Anton")
    let youngerBrother = Man(name: "Andrey")
    let olderSister = Woman(name: "Olga")
    let youngerSister = Woman(name: "Ekaterina")
    let human = Human(name: "Denis")
    
    human.father = father
    human.mother = mother
    human.grandFather = grandFather
    human.grandMother = grandMother
    human.brothers = [olderBrother, youngerBrother]
    human.sisters = [olderSister, youngerSister]
    father.brothers = [brotherOfFather]
    father.sisters = [sisterOfFather]
    mother.brothers = [brotherOfMother]
    mother.sisters = [sisterOfMother]
    
    brotherOfFather.son = cousin1
    brotherOfFather.daughter = cousin2
    sisterOfFather.son = cousin3
    sisterOfFather.daughter = cousin4
    brotherOfMother.son = cousin5
    brotherOfMother.daughter = cousin6
    sisterOfMother.son = cousin7
    sisterOfMother.daughter = cousin8
    
    //Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь, итд (Optional chaining). Всех этих людей положить в массив Семья, пройти по массиву посчитать количество Мужчин и Женщин, для каждого Мужчины вызвать метод Двигать_диван, для каждой женщины Дать_указание.
    
    let allHumanRelatives = [
        father,
        mother,
        brotherOfFather,
        sisterOfFather,
        brotherOfMother,
        sisterOfMother,
        grandFather,
        grandMother,
        olderBrother,
        olderSister,
        youngerSister,
        youngerBrother,
        cousin1,
        cousin2,
        cousin3,
        cousin4,
        cousin5,
        cousin6,
        cousin7,
        cousin8
    ]
    
    print("Total amount of relatives is \(allHumanRelatives.count)")
    print("")
    
    let amountOfUncles = allHumanRelatives
        .filter { $0.brothers?.count != nil }
        .reduce(into: 0) { $0 += $1.brothers?.count ?? 0 }
    
    print("Amount of uncles is \(amountOfUncles)")
    
    let amountOfAunts = allHumanRelatives
        .filter { $0.sisters?.count != nil }
        .reduce(into: 0) { $0 += $1.sisters?.count ?? 0 }
    
    print("Amount of aunts is \(amountOfAunts)")
    
    let relatives = allHumanRelatives
        .reduce(into: (mans: [Man](), womans: [Woman]())) { partialResult, human in
            if let man = human as? Man {
                partialResult.mans.append(man)
            } else if let woman = human as? Woman {
                partialResult.womans.append(woman)
            }
        }
    
    relatives.mans.forEach { $0.buildHouse() }
    relatives.womans.forEach { $0.plantFlowers() }
    
    print("Amount of man in relatives is \(relatives.mans.count)")
    print("Amount of woman in relatives is \(relatives.womans.count)")
    print("")
    
    //Раздать некоторым людям домашних животных.
    
    father.pets = [Dog(nickName: "Sharik")]
    mother.pets = [Cat(nickName: "Myrka"), Bird(nickName: "Orel"), Dog(nickName: "Bobik")]
    
    olderBrother.pets = [Dog(nickName: "Polkan")]
    youngerBrother.pets = [Bird(nickName: "Zzz"), Dog(nickName: "Belka")]
    
    olderSister.pets = [Cat(nickName: "Myrzik")]
    youngerSister.pets = [Bird(nickName: "Sokol")]
    
    brotherOfFather.pets = [Dog(nickName: "Strelka")]
    sisterOfFather.pets = [Cat(nickName: "Kisa")]
    
    //Пройти по всему массиву людей. Проверить каждого человека на наличие питомца, если такой есть – добавлять всех животных в массив животных.
    
    let none = Animal(nickName: "none")
    let animalsOfRelatives = allHumanRelatives
        .filter { $0.pets?.count != nil }
        .reduce(into: [Animal]()) { $0 += $1.pets ?? [none] }
    
    //Посчитать сколько каких животных в этом массиве. Вся эта живность должна быть унаследована от класса Животные. У всех животных должен быть метод Издать_звук(крик) и у каждого дочернего класса этот метод переопределён на свой, т.е. каждое животное издаёт свой звук. Когда проходим по массиву животных, каждый представитель вида животных должен издать свой звук.
    
    let animals = animalsOfRelatives
        .reduce(into: (dogs: [Dog](), cats: [Cat](), birds: [Bird]())) {
            if let dog = $1 as? Dog {
                $0.dogs.append(dog)
            } else if let cat = $1 as? Cat {
                $0.cats.append(cat)
            } else if let bird = $1 as? Bird {
                $0.birds.append(bird)
            }
        }
    
    animals.dogs.forEach { $0.makeSound() }
    animals.cats.forEach { $0.makeSound() }
    animals.birds.forEach { $0.makeSound() }
    
    print("")
    print("The relatives has \(animalsOfRelatives.count) pets.")
    print("They consist a \(animals.dogs.count) dogs \(animals.cats.count) cats and \(animals.birds.count) birds.")
    print("")
}

print("End")
print("")
print("Amount of created objects is \(createdObjects)")
print("Amount of deleted objects is \(deletedObjects)")

