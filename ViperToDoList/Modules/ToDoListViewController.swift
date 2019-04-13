//
//  ViewController.swift
//  ViperToDoList
//
//  Created by Paulo Henrique dos Santos on 11/04/2019.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController, ToDoListViewProtocol {
    @IBOutlet weak var tableView: UITableView!
    var presenter: ToDoListPresenterProtocol?
    var dataSource: [ToDoItemEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchItems()
    }

    func reloadData(items: [ToDoItemEntity]) {
        dataSource = items
        tableView.reloadData()
    }
    
    @IBAction func addButtomClicked(_ sender: Any) {
        let alertController = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        let saveAction = UIAlertAction(title: "Save", style:.default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            let description = firstTextField.text ?? "No description"
            self.saveItemWith(description: description)
        })
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Item description"
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func saveItemWith(description: String) {
        let item = ToDoItemEntity(id: "0", completed: false, text: description)
        self.presenter?.addItem(item)
    }
}

extension ToDoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dataSource[indexPath.row].text
        return cell
    }
    
}

extension ToDoListViewController: UITableViewDelegate {
    
}
