//
//  SupermanViewController.swift
//  hw30_Obj-C_Denis_Dynamic Cells
//
//  Created by Denis on 01.02.2022.
//

/*
 Супермен.
 14. Средний бал для студентов ставьте рандомно от 2 до 5
 15. После того, как вы сгенерировали 30 студентов вам надо их разбить на группы:
 Отличники, хорошисты, троечники и двоечники
 16. Каждая группа это секция с соответствующим названием.
 17. Студенты внутри своих групп должны быть в алфовитном порядке
 18. Отобразите группы студентов с их оченками в таблице.
 */

/*
 Mission Impossible!
 19. Добавьте к супермену еще одну секцию, в которой вы отобразите 10 моделей цветов из задания Студент.
 20. Помните, это должно быть 2 разных типа ячеек Value1 для студентов и Default для цветов.
 Не забудьте показывать скриншоты!
 */

import UIKit

class SupermanViewController: UIViewController {
    
    private let students = [
        Student(fullName: "Петроченко Денис Алексеевич", score: 4),
        Student(fullName: "Мироненко Кристина Олеговна", score: 2),
        Student(fullName: "Зюзько Кирилл Владимирович", score: 5),
        Student(fullName: "Коноплин Павел Владимирович", score: 5),
        Student(fullName: "Мацепуро Ирина Олеговна", score: 3),
        Student(fullName: "Розинкевич Татьяна Николаевна", score: 3),
        Student(fullName: "Кучерявая Татьяна Анатольевна", score: 2),
        Student(fullName: "Литвяков Евгений Александрович", score: 4),
        Student(fullName: "Щетник Руслан Александрович", score: 2),
        Student(fullName: "Мехедов Максим Николаевич", score: 2),
        Student(fullName: "Соколов Андрей Александрович", score: 3),
        Student(fullName: "Дедков Сергей Васильевич", score: 4),
        Student(fullName: "Богданова Полина Павловна", score: 5),
        Student(fullName: "Кухаренкова Кристина Валерьевна", score: 4),
        Student(fullName: "Дерюго Надежда Юрьевна", score: 4),
        Student(fullName: "Ступак Алексей Владимирович", score: 4),
        Student(fullName: "Бондарев Владислав Витальевич", score: 3),
        Student(fullName: "Решетнева Наталья Михайловна", score: 3),
        Student(fullName: "Костюченко Николай Сергеевич", score: 5),
        Student(fullName: "Протченко Алексей Михайлович", score: 2),
        Student(fullName: "Московская Кристина Александровна", score: 5),
        Student(fullName: "Белозор Надежда Андреевна", score: 4),
        Student(fullName: "Рамазанов Александр Игоревич", score: 2),
        Student(fullName: "Агеенко Лилия Сергеевна", score: 5),
        Student(fullName: "Жигальский Николай Владимирович", score: 2),
        Student(fullName: "Жигальская Олеся Сергеевна", score: 2),
        Student(fullName: "Матвеенко Алексей Михайлович", score: 4),
        Student(fullName: "Сарамок Кристина Радиковна", score: 3),
        Student(fullName: "Романенко Дмитрий Анатольевич", score: 3),
    ]
    
    private var randomColors = [RandomColor]()
    private let studentsTableView = UITableView()
    
    private var excellent = [Dictionary<String, Int>.Element]()
    private var good = [Dictionary<String, Int>.Element]()
    private var satisfactory = [Dictionary<String, Int>.Element]()
    private var bad = [Dictionary<String, Int>.Element]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureSubViews()
        makeConstraints()
        fillRandomColors()
        
        DispatchQueue.global().async {
            self.getFullNamesAndScores()
        }
    }
    
    private func addSubViews() {
        view.addSubview(studentsTableView)
    }
    
    private func configureSubViews() {
        studentsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        studentsTableView.dataSource = self
        studentsTableView.backgroundColor = .black
    }
    
    private func makeConstraints() {
        studentsTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            studentsTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            studentsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            studentsTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            studentsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func fillRandomColors() {
        for _ in 0...9 {
            randomColors.append(RandomColor())
        }
    }
    
    private func getFullNamesAndScores() {
        let fullNamesAndScores = students
            .reduce(into: [String: Int]()) { dict, student in
                dict[student.fullName] = student.score
            }
        
        excellent = fullNamesAndScores
            .filter { $1 == 5 }
            .sorted(by: <)
        
        good = fullNamesAndScores
            .filter { $1 == 4 }
            .sorted(by: <)
        
        satisfactory = fullNamesAndScores
            .filter { $1 == 3 }
            .sorted(by: <)
        
        bad = fullNamesAndScores
            .filter { $1 == 2 }
            .sorted(by: <)
    }
}

extension SupermanViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Отличники:"
        case 1: return "Хорошисты"
        case 2: return "Троечники"
        case 3: return "Двоечники"
        case 4: return "Цвета"
        default: break
        }
        
        return ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return excellent.count
        case 1: return good.count
        case 2: return satisfactory.count
        case 3: return bad.count
        case 4: return randomColors.count
        default: break
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else { return UITableViewCell() }
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "\(excellent[indexPath.row].key) - 5"
            cell.backgroundColor = .green
        case 1:
            cell.textLabel?.text = "\(good[indexPath.row].key) - 4"
            cell.backgroundColor = .cyan
        case 2:
            cell.textLabel?.text = "\(satisfactory[indexPath.row].key) - 3"
            cell.backgroundColor = .yellow
        case 3:
            cell.textLabel?.text = "\(bad[indexPath.row].key) - 2"
            cell.backgroundColor = .red
        case 4:
            let cellColorComponents = randomColors[indexPath.row]
            let redComponent = cellColorComponents.red
            let greenComponent = cellColorComponents.green
            let blueComponent = cellColorComponents.blue
            let redText = NSString(format: "%.2f", redComponent)
            let greenText = NSString(format: "%.2f", greenComponent)
            let blueText = NSString(format: "%.2f", blueComponent)
            cell.textLabel?.text = "R - \(redText) G - \(greenText) B - \(blueText)"
            
            cell.backgroundColor = UIColor(red: redComponent, green: greenComponent, blue: blueComponent, alpha: 1)
            return cell
        default: break
        }
        
        return cell
    }
}

