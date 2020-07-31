//
//  BaiTap12ViewController.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/30/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap12ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    // MARK: - Propeties
    var newNumbers = Number()
    // MARK: - Initialize
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configNavigation()
    }
    // MARK: - Override functions
    
    // MARK: - Private functions
    private func configNavigation() {
        title = "Tableview reorder"
        turnOffEditingMode()
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseCells")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func deleteACell(index: Int) {
        newNumbers.listOfNumber.remove(at: index)
        tableView.reloadData()
    }
    
    @objc func turnOnEditingMode() {
        tableView.isEditing = true
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(turnOffEditingMode))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func turnOffEditingMode() {
        tableView.isEditing = false
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(turnOnEditingMode))
        navigationItem.rightBarButtonItem = editButton
    }
}

extension BaiTap12ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            self.deleteACell(index: indexPath.row)
            completionHandler(true)
        }
        delete.backgroundColor = .red
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }
    
    private func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> [UITableViewCell.EditingStyle] {
        return [.delete, .insert]
    }
}

extension BaiTap12ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newNumbers.listOfNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCells", for: indexPath)
        cell.textLabel?.text = newNumbers.listOfNumber[indexPath.row]
        return cell
    }
}
