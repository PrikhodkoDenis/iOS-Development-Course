import UIKit

/*
 1. У нас есть базовый клас «Артист» и у него есть имя и фамилия. И есть метод «Выступление». У каждого артиста должно быть свое выступление: танцор танцует, певец поет и тд. А для художника, что бы вы не пытались ставить, пусть он ставит что-то свое (пусть меняет имя на свое артистическое). Когда вызываем метод «выступление» показать в консоле имя и фамилию артиста и собственно само выступление. Полиморфизм используем для артистов. Положить их всех в массив, пройтись по нему и вызвать их метод «выступление».
 
 2. Создать базовый клас «транспортное средство» и добавить три разных проперти: скорость, вместимость и стоимость одной перевозки (all computed). Создайте несколько дочерних класов и переопределите их компютед проперти у всех. Создайте класс самолет, корабль, вертолет, машина, поезд и у каждого по одному объекту. В компютед пропертис каждого класса напишите свои значения скорости, вместимости, стоимости перевозки. + у вас должен быть свой метод который считает сколько уйдет денег и времени что бы перевести из пункта А в пункт В определенное количество людей с использованимем наших транспортных средств. Вывести в кольсоль результат (как быстро сможем перевести, стоимость, количество перевозок). Используем полиморфизм. 100 человек и 10 000 человек.
 
 3. Есть 5 классов: люди, крокодилы, обезьяны, собаки, жирафы. (в этом задании вы будете создавать не дочерние классы, а родительские и ваша задача создать родительский таким образом, что бы группировать эти 5).
 - Создайте по пару объектов каждого класса.
 - Посчитайте присмыкающихся (создайте масив, поместите туда присмыкающихся и скажите сколько в нем объектов)
 - Сколько четвероногих?
 - Сколько здесь животных?
 - Сколько живых существ?
 */

class Artist {
    
    var firstName: String
    var lastName: String
    var fullName: String {
        return firstName + " " + lastName
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func performance() {
        print("\(fullName) is showing you a performance!")
    }
}

class Dancer: Artist {
    
    override func performance() {
        print("\(fullName) is dancing for you!")
    }
}

let dancer = Dancer(firstName: "Michael", lastName: "Jackson")
dancer.firstName
dancer.lastName
dancer.fullName

class Singer: Artist {
    
    override func performance() {
        print("\(fullName) is singing for you!")
    }
}

let singer = Singer(firstName: "Freddie", lastName: "Mercury")
singer.firstName
singer.lastName
singer.fullName

class Painter: Artist {
    
    override var firstName: String {
        didSet {
            firstName = "Salvador"
        }
    }
    
    override var lastName: String {
        didSet {
            lastName = "Dali"
        }
    }
    
    override var fullName: String {
        return "Salvador Dali"
    }
    
    override func performance() {
        print("\(fullName) is painting for you!")
    }
}

var painter = Painter(firstName: "Ivan", lastName: "Ivanov")
painter.firstName
painter.lastName
painter.fullName

let greatArtists = [dancer, singer, painter]

for artist in greatArtists {
    artist.performance()
}

print("")

//2. Создать базовый клас «транспортное средство» и добавить три разных проперти: скорость, вместимость и стоимость одной перевозки (all computed). Создайте несколько дочерних класов и переопределите их компютед проперти у всех. Создайте класс самолет, корабль, машина, поезд и у каждого по одному объекту. В компютед пропертис каждого класса напишите свои значения скорости, вместимости, стоимости перевозки. + у вас должен быть свой метод который считает сколько уйдет денег и времени что бы перевести из пункта А в пункт В определенное количество людей с использованимем наших транспортных средств. Вывести в кольсоль результат (как быстро сможем перевести, стоимость, количество перевозок). Используем полиморфизм. Перевезти надо 100 человек и 10 000 человек.

let distance = 9500.0 // примерное расстояние от Новороссийска до Владивостока

class Vehicle {
    
    var speed = 0.0
    var capacity = 0.0
    var ticketPrice = 0.0
    
    func movePeoples(amountOfPeoples: Double) { }
}

class Plane: Vehicle {
    
    override var speed: Double {
        get {
            return super.speed
        }
        set {
            super.speed = newValue
        }
    }
    
    override var capacity: Double {
        get {
            return super.capacity
        }
        set {
            super.capacity = newValue
        }
    }
    
    override var ticketPrice: Double {
        get {
            return super.ticketPrice
        }
        set {
            super.ticketPrice = newValue
        }
    }
    
    override func movePeoples(amountOfPeoples: Double) {
        
        let amountOfTrip = (amountOfPeoples / airbusA380.capacity).rounded(.awayFromZero)
        print("Airbus A380 can transport \(amountOfPeoples) peoples for \(amountOfTrip) time(s)")
        
        let timeOfAllTrips = (amountOfTrip * distance / airbusA380.speed).rounded(.awayFromZero)
        print("Time of all trips is around \(timeOfAllTrips) hours")
        
        let costOfTransport = (amountOfPeoples * airbusA380.ticketPrice * amountOfTrip).rounded(.awayFromZero)
        print("The cost of transporting \(amountOfPeoples) peoples is around \(costOfTransport) rubles")
    }
}

let airbusA380 = Plane()
airbusA380.speed = 1050
airbusA380.capacity = 852
airbusA380.ticketPrice = 30000

class Ship: Vehicle {
    
    override var speed: Double {
        get {
            return super.speed
        }
        set {
            super.speed = newValue
        }
    }
    
    override var capacity: Double {
        get {
            return super.capacity
        }
        set {
            super.capacity = newValue
        }
    }
    
    override var ticketPrice: Double {
        get {
            return super.ticketPrice
        }
        set {
            super.ticketPrice = newValue
        }
    }
    
    override func movePeoples(amountOfPeoples: Double) {
        let amountOfTrip = (amountOfPeoples / symphonyOfTheSeas.capacity).rounded(.awayFromZero)
        print("Symphony of the seas can transport \(amountOfPeoples) peoples for \(amountOfTrip) time(s)")
        
        let timeOfAllTrips = (amountOfTrip * distance / symphonyOfTheSeas.speed).rounded(.awayFromZero)
        print("Time of all trips is around \(timeOfAllTrips) hours")
        
        let costOfTransport = (amountOfPeoples * symphonyOfTheSeas.ticketPrice * amountOfTrip).rounded(.awayFromZero)
        print("The cost of transporting \(amountOfPeoples) peoples is around \(costOfTransport) rubles")
    }
}

let symphonyOfTheSeas = Ship()
symphonyOfTheSeas.speed = 20
symphonyOfTheSeas.capacity = 6780
symphonyOfTheSeas.ticketPrice = 50000

class Train: Vehicle {
    
    override var speed: Double {
        get {
            return super.speed
        }
        set {
            super.speed = newValue
        }
    }
    
    override var capacity: Double {
        get {
            return super.capacity
        }
        set {
            super.capacity = newValue
        }
    }
    
    override var ticketPrice: Double {
        get {
            return super.ticketPrice
        }
        set {
            super.ticketPrice = newValue
        }
    }
    
    override func movePeoples(amountOfPeoples: Double) {
        let amountOfTrip = (amountOfPeoples / australianGhan.capacity).rounded(.awayFromZero)
        print("Australian Ghan can transport \(amountOfPeoples) peoples for \(amountOfTrip) time(s)")
        
        let timeOfAllTrips = (amountOfTrip * distance / australianGhan.speed).rounded(.awayFromZero)
        print("Time of all trips is around \(timeOfAllTrips) hours")
        
        let costOfTransport = (amountOfPeoples * australianGhan.ticketPrice * amountOfTrip).rounded(.awayFromZero)
        print("The cost of transporting \(amountOfPeoples) peoples is around \(costOfTransport) rubles")
    }
}

let australianGhan = Train()
australianGhan.speed = 50
australianGhan.capacity = 1200
australianGhan.ticketPrice = 20000

class Bus: Vehicle {
    
    override var speed: Double {
        get {
            return super.speed
        }
        set {
            super.speed = newValue
        }
    }
    
    override var capacity: Double {
        get {
            return super.capacity
        }
        set {
            super.capacity = newValue
        }
    }
    
    override var ticketPrice: Double {
        get {
            return super.ticketPrice
        }
        set {
            super.ticketPrice = newValue
        }
    }
    
    override func movePeoples(amountOfPeoples: Double) {
        let amountOfTrip = (amountOfPeoples / neoplanJumboCruiser.capacity).rounded(.awayFromZero)
        print("Neoplan JumboCruiser can transport \(amountOfPeoples) peoples for \(amountOfTrip) time(s)")
        
        let timeOfAllTrips = (amountOfTrip * distance / neoplanJumboCruiser.speed).rounded(.awayFromZero)
        print("Time of all trips is around \(timeOfAllTrips) hours")
        
        let costOfTransport = (amountOfPeoples * neoplanJumboCruiser.ticketPrice * amountOfTrip).rounded(.awayFromZero)
        print("The cost of transporting \(amountOfPeoples) peoples is around \(costOfTransport) rubles")
    }
}

let neoplanJumboCruiser = Bus()
neoplanJumboCruiser.speed = 70
neoplanJumboCruiser.capacity = 103
neoplanJumboCruiser.ticketPrice = 25000

let hugeVehicles = [airbusA380, symphonyOfTheSeas, australianGhan, neoplanJumboCruiser]

for vehicle in hugeVehicles {
    vehicle.movePeoples(amountOfPeoples: 100.0)
    print("")
    vehicle.movePeoples(amountOfPeoples: 10000.0)
    print("")
}

//3. Есть 5 классов: люди, крокодилы, обезьяны, собаки, жирафы. (в этом задании вы будете создавать не дочерние классы, а родительские и ваша задача создать родительский таким образом, что бы группировать эти 5).
//- Создайте по пару объектов каждого класса.
//- Посчитайте присмыкающихся (создайте масив, поместите туда присмыкающихся и скажите сколько в нем объектов)
//- Сколько четвероногих?
//- Сколько здесь животных?
//- Сколько живых существ?
// */

class LivingCreature {
    
    var amountOfLegs: Int
    var isReptile: Bool
    var isAnimal: Bool
    
    init(amountOfLegs: Int, isReptile: Bool, isAnimal: Bool) {
        self.amountOfLegs = amountOfLegs
        self.isReptile = isReptile
        self.isAnimal = isAnimal
    }
}

class Human: LivingCreature { }

let human1 = Human(amountOfLegs: 2, isReptile: false, isAnimal: false)
let human2 = Human(amountOfLegs: 2, isReptile: false, isAnimal: false)

class Crocodile: LivingCreature { }

let crocodile1 = Crocodile(amountOfLegs: 4, isReptile: true, isAnimal: false)
let crocodile2 = Crocodile(amountOfLegs: 4, isReptile: true, isAnimal: false)

class Monkey: LivingCreature { }

let monkey1 = Monkey(amountOfLegs: 2, isReptile: false, isAnimal: true)
let monkey2 = Monkey(amountOfLegs: 2, isReptile: false, isAnimal: true)

class Dog: LivingCreature { }

let dog1 = Dog(amountOfLegs: 4, isReptile: false, isAnimal: true)
let dog2 = Dog(amountOfLegs: 4, isReptile: false, isAnimal: true)

class Jiraffe: LivingCreature { }

let jiraffe1 = Jiraffe(amountOfLegs: 4, isReptile: false, isAnimal: true)
let jiraffe2 = Jiraffe(amountOfLegs: 4, isReptile: false, isAnimal: true)

let livingCreatures = [human1, human2, crocodile1, crocodile2, monkey1, monkey2, dog1, dog2, jiraffe1, jiraffe2]
print("Quantity of living creatures is \(livingCreatures.count)")

let animals = livingCreatures
    .filter { $0.isAnimal }
print("Quantity of animals is \(animals.count)")

let reptiles = livingCreatures
    .filter { $0.isReptile }
print("Quantity of reptiles is \(reptiles.count)")

let quadruped = livingCreatures
    .filter { $0.amountOfLegs == 4 }
print("Quantity of quadruped is \(quadruped.count)")
