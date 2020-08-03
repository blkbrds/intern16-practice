//
//  Bai12ViewController.swift
//  Bai1TableView
//
//  Created by Abcd on 8/2/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai12ViewController: UIViewController {
    
    //MARK: -IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    //MARK: - Properties
    var data  = ["one", "two", "three", "four", "five"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configtableView()
        configNavi()
    }
    
    //MARK: - Function
    private func configtableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configNavi() {
            title = "Home"
            editingOff()
    }
    
   @objc private func editingOff() {
        tableView.isEditing = false
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(edditingOn))
        textField.isHidden = true
        textField.text = ""
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc func edditingOn() {
        tableView.isEditing = true
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(editingOff))
        let deleteAllButton = UIBarButtonItem(title: "Delete All", style: .plain, target: self, action: #selector(deleteAll))
        textField.isHidden = false
        navigationItem.rightBarButtonItem = doneButton
        navigationItem.leftBarButtonItem = deleteAllButton
    }
    
    @objc func deleteAll() {
        var mess = "Do you want to delete all?"
        let agree = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.data.removeAll()
            self.tableView.reloadData()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default) { (cancel) in
            self.edditingOn()
        }
        var actions: [UIAlertAction] = [agree, cancel]
        if data.isEmpty {
            mess = "No Data"
            actions = [cancel]
        }
        let alert = UIAlertController(title: "Warning", message: mess, preferredStyle: .actionSheet)
        actions.forEach{ alert.addAction($0)}
        present(alert,animated: true,completion: nil)
    }
}

extension Bai12ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        let results = indexPath.row % 2
        switch results {
        case 0:
            return .delete
        default:
            return .insert
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .right)
            data.remove(at: indexPath.row)
            tableView.endUpdates()
        case .insert:
            tableView.beginUpdates()
            if let text = textField.text {
                tableView.insertRows(at: [IndexPath(row: indexPath.row + 1, section: indexPath.section)], with: .left)
                data.insert(text, at: indexPath.row + 1)
            }
            tableView.endUpdates()
        default:
            return
        }
    }
}
