/*
 Урок 27. Протоколы.
 1. Объявить протокол Food, который будет иметь проперти name (только чтение) и метод taste(), который будет выводить текст со вкусовыми ощущениями.
 2. Все продукты разных типов, которые вы принесли из супермаркета, находятся в сумке (массив) и все, как ни странно, реализуют протокол Food. Вам нужно пройтись по сумке, назвать предмет и откусить кусочек. Можете отсортировать продукты до имени. Используйте для этого отдельную функцию, которая принимает массив продуктов.
 3. Некоторые продукты могут испортиться, если их не положить в холодильник. Создайте новый протокол Storable, он наследуется от протокола Food и содержит еще булевую проперти – expired. У некоторых продуктов замените Food на Storable. Теперь пройдитесь по всем продуктам и, если продукт надо хранить в холодильнике, то перенесите его туда, но только если продукт не испорчен уже, иначе просто избавьтесь от него. Используйте функцию для вывода продуктов для вывода содержимого холодильника.
 4. Добавьте проперти daysToExpire в протокол Storable. Отсортируйте массив продуктов в холодильнике. Сначала пусть идут те, кто быстрее портятся. Если срок совпадает, то сортируйте по имени.
 5. Не все, что мы кладем в холодильник, является едой. Поэтому сделайте так, чтобы Storable не наследовался от Food. Мы по прежнему приносим еду домой, но некоторые продукты реализуют теперь 2 протокола. Холодильник принимает только те продукты, которые еще и Storable. Функция сортировки должна по прежнему работать.
 */

//1. Объявить протокол Food, который будет иметь проперти name (только чтение) и метод taste(), который будет выводить текст со вкусовыми ощущениями.

protocol Food {
    
    var name: String { get }
    func taste()
}

protocol Storable {
    
    var name: String { get }
    var expired: Bool { get }
    var daysToExpire: Int { get }
}

//2. Все продукты разных типов, которые вы принесли из супермаркета, находятся в сумке (массив) и все, как ни странно, реализуют протокол Food. Вам нужно пройтись по сумке, назвать предмет и откусить кусочек. Можете отсортировать продукты до имени. Используйте для этого отдельную функцию, которая принимает массив продуктов.

struct MilkProducts: Storable, Food {
    
    var name: String
    var expired: Bool
    var daysToExpire: Int
    
    func taste() {
        print("Mmm, this \(name) isn't fatty too much!")
    }
}

let milk = MilkProducts(name: "milk", expired: false, daysToExpire: 5)
let yogurt = MilkProducts(name: "yogurt", expired: true, daysToExpire: -3)
let cheese = MilkProducts(name: "cheese", expired: false, daysToExpire: 10)

struct MeatProducts: Storable, Food {
    
    var name: String
    var expired: Bool
    var daysToExpire: Int
    
    func taste() {
        print("This \(name) is like just from a farm!")
    }
}

let pork = MeatProducts(name: "pork", expired: false, daysToExpire: 9)
let beef = MeatProducts(name: "beef", expired: false, daysToExpire: 9)
let chicken = MeatProducts(name: "chicken", expired: false, daysToExpire: 7)

struct Vegetables: Food {
    
    var name: String
    
    func taste() {
        print("This \(name) is very good!")
    }
}

let carrot = Vegetables(name: "carrot")
let tomato = Vegetables(name: "tomato")
let broccoli = Vegetables(name: "broccoli")

let bag: [Food] = [milk, yogurt, cheese, pork, beef, chicken, carrot, tomato, broccoli]

func taste (bag: [Food]) {
    let newBag = bag.sorted { $0.name < $1.name }
    newBag.forEach { $0.taste() }
}

taste(bag: bag)

//3. Некоторые продукты могут испортиться, если их не положить в холодильник. Создайте новый протокол Storable, он наследуется от протокола Food и содержит еще булевую проперти – expired. У некоторых продуктов замените Food на Storable. Теперь пройдитесь по всем продуктам и, если продукт надо хранить в холодильнике, то перенесите его туда, но только если продукт не испорчен уже, иначе просто избавьтесь от него. Используйте функцию для вывода продуктов для вывода содержимого холодильника.

var refrigerator = [Food & Storable]()
var box = [Food]()
var trash = [Food]()

func sortBag(bag: [Food]) {
    for product in bag {
        switch product {
        case let product as Food & Storable where product.expired == false:
            refrigerator.append(product)
        case let product as Food & Storable where product.expired == true:
            trash.append(product)
        default:
            box.append(product)
        }
    }
}

sortBag(bag: bag)
refrigerator
box
trash
refrigerator.count
box.count
trash.count

//4. Добавьте проперти daysToExpire в протокол Storable. Отсортируйте массив продуктов в холодильнике. Сначала пусть идут те, кто быстрее портятся. Если срок совпадает, то сортируйте по имени.

let sortedRefrigerator = refrigerator.sorted {
    if $0.daysToExpire == $1.daysToExpire {
        return $0.name < $1.name
    } else {
        return $0.daysToExpire < $1.daysToExpire
    }
}

sortedRefrigerator

//5. Не все, что мы кладем в холодильник, является едой. Поэтому сделайте так, чтобы Storable не наследовался от Food. Мы по прежнему приносим еду домой, но некоторые продукты реализуют теперь 2 протокола. Холодильник принимает только те продукты, которые еще и Storable. Функция сортировки должна по прежнему работать.

//✅ решение выше ⬆️
