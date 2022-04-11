//
//  StudentViewController.swift
//  hw30_Obj-C_Denis_Dynamic Cells
//
//  Created by Denis on 01.02.2022.
//

/*
 Студент.
 5. Теперь создайте класс, который содержит цвет и нейм.
 6. В viewDidLoad сгенерируйте 1000 объектов такого класса по принципу из ученика
 7. Положите их в массив и отобразите в таблице
 8. В этом случае когда вы будете листать назад вы увидете те же ячейки, что там и были, а не новые рандомные.
 */

import UIKit

class StudentViewController: UIViewController {
    
    var randomColors = [RandomColor]()
    @IBOutlet weak var randomColorTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomColorTableView.dataSource = self
        fillRandomColors()
    }
    
    private func fillRandomColors() {
        for _ in 0...999 {
            randomColors.append(RandomColor())
        }
    }
}

extension StudentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Color") else { return UITableViewCell() }
        
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
    }
}

