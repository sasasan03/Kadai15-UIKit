//
//  ViewController.swift
//  Kadai15-UIKit
//
//  Created by sako0602 on 2023/07/01.
//

import UIKit

struct Item{
    var name: String
    var isChecked: Bool
}

class ViewController: UIViewController {
    
    let identifier = "ItemTableViewCell"
    
    var itemArray = [
        Item(name: "朝もく", isChecked: false),
        Item(name: "夜もく", isChecked: true),
        Item(name: "深夜もく", isChecked: false),
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func exit(segue: UIStoryboardSegue){}
    
    @IBAction func saveExit(segue: UIStoryboardSegue){
        guard let nextVC = segue.source as? AdditemViewController,
              let addItem = nextVC.textField.text else { return }
        itemArray.append(Item(name: addItem, isChecked: false))
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ItemTableViewCell
        cell.checkImage.image = UIImage(systemName: itemArray[indexPath.row].isChecked ? "checkmark.seal.fill" : "seal")
        cell.label.text = itemArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].isChecked.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
