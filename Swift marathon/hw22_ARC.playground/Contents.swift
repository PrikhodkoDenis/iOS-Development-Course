/*
 Урок 22. ARC.
 Рассмотрим такую ситуацию: есть семья – папа, мама и дети.
 Папа глава семьи, у него есть Мама, Мама контролирует детей, т.е. иерархия: Папа – Мама – Дети, Дети на одном уровне.
 Дети могут вызывать друг друга и они могут искать пути, как общаться с другими Детьми, например говорить «дай игрушку», спрашивать Маму: «Мама, дай конфетку»(метод), общаться с Папой: «Папа, купи игрушку».
 Вся эта иерархия лежит в объекте класса Семья, у которого есть методы, например распечатать всю Семью, т.е. метод вернёт массив всех членов Семьи.
 У Папы есть 3 кложера (closures) – 1. Когда он обращается к Семье – распечатать всю Семью, 2. Распечатать Маму, 3. Распечатать всех Детей.
 Создать всю иерархию со связями. При выходе из зоны видимости все объекты должны быть уничтожены. Используем Command-Line Tool.
 */

class Family {
    
    func printing(family: [Family]) {
        for relative in family {
            if let father = relative as? Father {
                print("The name of father is \(father.name)")
            } else if let mother = relative as? Mother {
                print("The name of mother is \(mother.name)")
            } else if let kid = relative as? Kid {
                print("The name of kid is \(kid.name)")
            }
        }
    }
}

class Father: Family {
    
    let name: String
    var wife: Mother?
    var kid: Kid?
    
    var printMother = {
        (relative: Mother) in
        print("The name of mother is \(relative.name)")
    }
    
    var printKids = {
        (relative: [Kid]) in
        for kid in relative {
            print("The name of kid is \(kid.name)")
        }
    }
    
    init(name: String) {
        self.name = name
        print("Father created")
    }
    
    func answer(kid: Kid) {
        print("\(kid.name) what kind of toy do you want?")
    }
    
    deinit {
        print("Father deleted")
    }
}

class Mother: Family {
    
    let name: String
    weak var husband: Father?
    var kid: Kid?
    lazy var showName = {
        [unowned self] in
        print("My name is \(self.name)")
    }
    
    init(name: String) {
        self.name = name
        print("Mother created")
    }
    
    func answer(kid: Kid) {
        print("\(kid.name) take your meal first!")
    }
    
    deinit {
        print("Mother deleted")
    }
}

class Kid: Family {
    
    let name: String
    unowned var father: Father
    unowned var mother: Mother
    var brother: Kid?
    weak var sister: Kid?
    
    init(name: String, father: Father, mother: Mother) {
        self.name = name
        self.father = father
        self.mother = mother
        print("Kid created")
    }
    
    func askSweets(mother: Mother) {
        print("\(mother.name) give me a sweets please!")
    }
    
    func askToy(kid: Kid) {
        print("\(kid.name) give me a toy please!")
    }
    
    func buyToy(father: Father) {
        print("\(father.name) buy me a toy please!")
    }
    
    deinit {
        print("Kid deleted")
    }
}

var playground = true

if playground {
    
    let father = Father(name: "Dad")
    let mother = Mother(name: "Mum")
    let son = Kid(name: "Jonh", father: father, mother: mother)
    let daughter = Kid(name: "Lisa", father: father, mother: mother)
    let family = [father, mother, son, daughter]
    let kids = [son, daughter]
    print("")
    
    father.printing(family: family)
    print("")
    
    father.printMother(mother)
    print("")
    
    father.printKids(kids)
    print("")
    
    mother.showName()
    print("")
    
    father.wife = mother
    mother.husband = father
    
    father.kid = son
    son.father = father
    
    father.kid = daughter
    daughter.father = father
    
    mother.kid = son
    son.mother = mother
    
    mother.kid = daughter
    daughter.mother = mother
    
    son.sister = daughter
    daughter.brother = son
    
    son.askSweets(mother: mother)
    mother.answer(kid: son)
    print("")
    
    daughter.askSweets(mother: mother)
    mother.answer(kid: daughter)
    print("")
    
    son.askToy(kid: daughter)
    daughter.askToy(kid: son)
    print("")
    
    son.buyToy(father: father)
    father.answer(kid: son)
    print("")
    
    daughter.buyToy(father: father)
    father.answer(kid: daughter)
    print("")
}

print("")
print("End")
