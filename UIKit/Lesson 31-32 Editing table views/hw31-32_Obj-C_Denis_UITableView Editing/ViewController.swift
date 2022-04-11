//
//  ViewController.swift
//  hw31-32_Obj-C_Denis_UITableView Editing
//
//  Created by Denis on 05.02.2022.
//

/*
 Итак редактируем наши таблицы.
 Задание.
 Ученик
 1. Создайте контроллер с таблицей в коде без сторибордов.
 2. Заполните таблицу данными на свое усмотрение.
 3. Объедините данные в группы (секции).
 Студент.
 4. Реализуйте механизм перемещения данных между рядами и секциями.
 5. Вы должны четко понимать что и как работает и в какой последовательности поэтому повторяйте задание пока вы полностью не освоите этот механизм
 Мастер.
 6. Реализуйте удаление рядов.
 Супермен
 7. Реализуйте механизм добавления секций и рядов на ваше усмотрение.
 */

import UIKit

class ViewController: UIViewController {
    
    private var firstGroup = [
        Student(fullName: "Петроченко Денис Алексеевич"),
        Student(fullName: "Мироненко Кристина Олеговна"),
        Student(fullName: "Зюзько Кирилл Владимирович"),
        Student(fullName: "Коноплин Павел Владимирович"),
        Student(fullName: "Мацепуро Ирина Олеговна"),
        Student(fullName: "Розинкевич Татьяна Николаевна"),
        Student(fullName: "Кучерявая Татьяна Анатольевна"),
        Student(fullName: "Литвяков Евгений Александрович"),
        Student(fullName: "Щетник Руслан Александрович"),
        Student(fullName: "Мехедов Максим Николаевич"),
        Student(fullName: "Соколов Андрей Александрович"),
        Student(fullName: "Дедков Сергей Васильевич"),
        Student(fullName: "Богданова Полина Павловна"),
        Student(fullName: "Кухаренкова Кристина Валерьевна"),
        Student(fullName: "Дерюго Надежда Юрьевна")
    ]
    
    private var secondGroup = [
        Student(fullName: "Ступак Алексей Владимирович"),
        Student(fullName: "Бондарев Владислав Витальевич"),
        Student(fullName: "Решетнева Наталья Михайловна"),
        Student(fullName: "Костюченко Николай Сергеевич"),
        Student(fullName: "Протченко Алексей Михайлович"),
        Student(fullName: "Московская Кристина Александровна"),
        Student(fullName: "Белозор Надежда Андреевна"),
        Student(fullName: "Рамазанов Александр Игоревич"),
        Student(fullName: "Агеенко Лилия Сергеевна"),
        Student(fullName: "Жигальский Николай Владимирович"),
        Student(fullName: "Жигальская Олеся Сергеевна"),
        Student(fullName: "Матвеенко Алексей Михайлович"),
        Student(fullName: "Сарамок Кристина Радиковна"),
        Student(fullName: "Романенко Дмитрий Анатольевич")
    ]
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(actionEdit))
        navigationItem.rightBarButtonItem = editButton
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addStudent))
        navigationItem.leftBarButtonItem = addButton
    }
    
    private func configureSubviews() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        navigationItem.title = "Students"
    }
    
    private func makeConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "First group"
        case 1: return "Second group"
        default: break
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return firstGroup.count
        case 1: return secondGroup.count
        default: break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else { return UITableViewCell() }
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = firstGroup[indexPath.row].fullName
            cell.backgroundColor = .green
        case 1:
            cell.textLabel?.text = secondGroup[indexPath.row].fullName
            cell.backgroundColor = .cyan
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        var movingStudent = Student(fullName: "")
        
        if sourceIndexPath.section == 0 {
            movingStudent = firstGroup.remove(at: sourceIndexPath.row)
        } else {
            movingStudent = secondGroup.remove(at: sourceIndexPath.row)
        }
        
        if destinationIndexPath.section == 0 {
            firstGroup.insert(movingStudent, at: destinationIndexPath.row)
        } else {
            secondGroup.insert(movingStudent, at: destinationIndexPath.row)
        }
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if indexPath.section == 0 {
                firstGroup.remove(at: indexPath.row)
            } else {
                secondGroup.remove(at: indexPath.row)
            }
            
            tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController {
    
    @objc func actionEdit(sender: UIBarButtonItem) {
        let isEditing = tableView.isEditing
        tableView.setEditing(!isEditing, animated: true)
        var item = UIBarButtonItem.SystemItem.edit
        if tableView.isEditing {
            item = UIBarButtonItem.SystemItem.done
        }
        let editButton = UIBarButtonItem(barButtonSystemItem: item, target: self, action: #selector(actionEdit))
        navigationItem.setRightBarButton(editButton, animated: true)
    }
    
    @objc func addStudent(sender: UIBarButtonItem) {
        let ac = UIAlertController(title: "Внимание!", message: "Вы хотите добавить студента?", preferredStyle: .alert)
        
        ac.addTextField { (fullName) in
            fullName.placeholder = "Введите ФИО студента"
        }
        
        ac.addTextField { (groupNumber) in
            groupNumber.placeholder = "Введите номер группы"
        }
        
        let actionYes = UIAlertAction(title: "Да", style: .default) { [self] _ in
            guard let fullNameField = ac.textFields?[0] else { return }
            guard let groupNumber = ac.textFields?[1] else { return }
            let student = Student(fullName: fullNameField.text ?? "")
            
            if groupNumber.text == "1" {
                firstGroup.append(student)
            } else if groupNumber.text == "2" {
                secondGroup.append(student)
            }
            
            tableView.reloadData()
        }
        
        let actionNo = UIAlertAction(title: "Нет", style: .default, handler: nil)
        
        ac.addAction(actionYes)
        ac.addAction(actionNo)
        present(ac, animated: true, completion: nil)
    }
}
