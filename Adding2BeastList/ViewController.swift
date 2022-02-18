//
//  ViewController.swift
//  Adding2BeastList
//
//  Created by Najla on 26/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var tasks = ["Feed Gary the snail", "Make Krabby Patties", "Hangout with Sanndy"]

    @IBOutlet weak var Table: UITableView!
    
    @IBOutlet weak var TaskText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Table.dataSource = self
        Table.delegate  = self
    }
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        // your code here
        // Add the textField text as an item to the array
        tasks.append(TaskText.text!)
        // reload the table view data
        Table.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Table.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        tasks.remove(at: indexPath.row)
        Table.reloadData()
    }

}


