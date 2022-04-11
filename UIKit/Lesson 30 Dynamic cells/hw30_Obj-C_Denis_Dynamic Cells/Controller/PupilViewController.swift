//
//  ViewController.swift
//  hw30_Obj-C_Denis_Dynamic Cells
//
//  Created by Denis on 01.02.2022.
//

/*
 Вот теперь начинается самое интересное! Нужна практика, много практики.
 Ученик.
 1. Создайте таблицу которая содержит 1000 разных ячеек.
 2. для каждой ячейки генирируйте радномный цвет.
 3. RGB данные пишите в тексте ячейки, например: RGB(10,20,255)
 4. Также раскрашивайте текст ячейки этим цветом.
 */

import UIKit

class PupilViewController: UIViewController {

    @IBOutlet weak var randomColorTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomColorTableView.dataSource = self
        randomColorTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Color")
    }
}

extension PupilViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emptyCell = UITableViewCell.init(frame: .zero)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Color") else { return emptyCell }

        let randomColor = RandomColor()

        let redText = NSString(format: "%.2f", randomColor.red)
        let greenText = NSString(format: "%.2f", randomColor.green)
        let blueText = NSString(format: "%.2f", randomColor.blue)
        cell.textLabel?.text = "R - \(redText), G - \(greenText), B - \(blueText)"
        
        cell.backgroundColor = UIColor(red: randomColor.red, green: randomColor.green, blue: randomColor.blue, alpha: 1)
        return cell
    }
}
