//
//  MasterViewController.swift
//  hw30_Obj-C_Denis_Dynamic Cells
//
//  Created by Denis on 01.02.2022.
//

/*
 Мастер.
 9. Возвращаемся к студентам. Сгенерируйте 20-30 разных студентов.
 10. В таблице создавайте не default ячейку а Value1. В этом случае у вас появится еще одна UILabel – detailLabel.
 11. В textLabel пишите имя и фамилию студента, а в detailLabel его средний бал.
 12. Если средний бал низкий – окрашивайте имя студента в красный цвет.
 13. Отсортируйте студентов в алфaвитном порядке и отобразите в таблице.
 */

import UIKit

class MasterViewController: UIViewController {
    
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
    
    private var fullNamesSorted = [Dictionary<String, Int>.Keys.Element]()
    private var fullNamesAndScores = [String: Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            self.getFullNamesSorted()
        }
    }
    
    private func getFullNamesSorted() {
        fullNamesAndScores = students
            .reduce(into: [String: Int]()) { dict, student in
                dict[student.fullName] = student.score
            }
        
        fullNamesSorted = Array(fullNamesAndScores.keys).sorted(by: <)
    }
}

extension MasterViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Student") else { return UITableViewCell() }
        
        let fullName = fullNamesSorted[indexPath.row]
        cell.textLabel?.text = fullName
        
        let score = fullNamesAndScores[fullName]
        cell.detailTextLabel?.text = String(score ?? 0)
        
        switch score {
        case 2: cell.backgroundColor = .red
        case 3: cell.backgroundColor = .yellow
        case 4: cell.backgroundColor = .cyan
        case 5: cell.backgroundColor = .green
        default:break
        }
        
        return cell
    }
}
