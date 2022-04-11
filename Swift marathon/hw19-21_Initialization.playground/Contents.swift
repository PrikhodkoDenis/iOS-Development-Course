import Foundation

enum Rank {
    case captain
    case mate
    case engineer
    case bosun
    case seaman
    case cook
    case steward
    case motorman
    case empty
}

class Sailor {
    
    let firstName: String
    let lastName: String
    var age: Int
    var rank: Rank
    var experience: Int
    
    required init(firstName: String, lastName: String, age: Int, rank: Rank, experience: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.rank = rank
        self.experience = experience
    }
    
    convenience init(firstName: String) {
        self.init(firstName: firstName, lastName: "", age: 0, rank: .empty, experience: 0)
    }
    
    convenience init(lastName: String) {
        self.init(firstName: "", lastName: lastName, age: 0, rank: .empty, experience: 0)
    }
    
    convenience init(age: Int) {
        self.init(firstName: "", lastName: "", age: age, rank: .empty, experience: 0)
    }
    
    convenience init(rank: Rank) {
        self.init(firstName: "", lastName: "", age: 0, rank: rank, experience: 0)
    }
    
    convenience init(experience: Int) {
        self.init(firstName: "", lastName: "", age: 0, rank: .empty, experience: experience)
    }
    
    convenience init() {
        self.init(firstName: "", lastName: "", age: 0, rank: .empty, experience: 0)
    }
    
    deinit {
        print("Sailor deinitialized")
    }
}

let sailor = Sailor()

class EngineDepartment: Sailor {
    
    let amountOfEngineers = 5
    let amountOfMotormans = 4
}

let engineer = EngineDepartment(firstName: "Ivan", lastName: "Ivanov", age: 55, rank: .engineer, experience: 20)

class DeckDepartment: Sailor {
    
    let amountOfMates: Int
    let amountOfSeamans: Int
    
    init(amountOfMates: Int, amountOfSeamans: Int) {
        self.amountOfMates = amountOfMates
        self.amountOfSeamans = amountOfSeamans
        super.init(firstName: "", lastName: "", age: 0, rank: .empty, experience: 0)
    }
    
    required init(firstName: String, lastName: String, age: Int, rank: Rank, experience: Int) {
        self.amountOfMates = 4
        self.amountOfSeamans = 6
        super.init(firstName: "", lastName: "", age: 0, rank:.empty, experience: 0)// после rank: нужен пробел
    }
    
    convenience init() {
        self.init(amountOfMates: 4, amountOfSeamans: 6)
    }
    
    deinit {
        print("DeckDepartment deinitialized")
    }
}

let mate = DeckDepartment()

class BosunDepartment: DeckDepartment {
    
    var bosunNickName: String
    
    init(bosunNickName: String) {
        self.bosunNickName = bosunNickName
        super.init(firstName: "", lastName: "", age: 0, rank: .empty, experience: 0)
    }
    
    override init(amountOfMates: Int, amountOfSeamans: Int) {
        self.bosunNickName = "Dragon"
        super.init(firstName: "", lastName: "", age: 0, rank: .empty, experience: 0)
    }
    
    required init(firstName: String, lastName: String, age: Int, rank: Rank, experience: Int) {
        self.bosunNickName = "Dragon"
        super.init(firstName: "", lastName: "", age: 0, rank:.empty, experience: 0)
    }
    
    convenience init() {
        self.init(bosunNickName: "Dragon")
    }
    
    deinit {
        print("BosunDepartment deinitialized")
    }
}

let bosun = BosunDepartment()

class CookingDepartment: Sailor {
    
    var amountOfCook: Int
    var amountOfSteward: Int = {
        let random = Int(arc4random_uniform(2))
        return random
    }()
    
    init?(amountOfCook: Int, amountOfSteward: Int) {
        self.amountOfCook = amountOfCook
        super.init(firstName: "", lastName: "", age: 0, rank: .empty, experience: 0)
        
        if amountOfCook > 0 && amountOfSteward > 0  {
            self.amountOfCook = amountOfCook
            self.amountOfSteward = amountOfSteward
        } else {
            return nil
        }
    }
    
    init() {
        self.amountOfCook = 1
        super.init(firstName: "", lastName: "", age: 0, rank: .empty, experience: 0)
    }
    
    required init(firstName: String, lastName: String, age: Int, rank: Rank, experience: Int) {
        self.amountOfCook = 1
        super.init(firstName: "", lastName: "", age: 0, rank:.empty, experience: 0)
    }
    
    deinit {
        print("CookingDepartment deinitialized")
    }
}

var cook = CookingDepartment(amountOfCook: 1, amountOfSteward: 1)
cook = nil
