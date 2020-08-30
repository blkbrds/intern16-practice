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
    private var newNumbers = Number()
    private var selectedPosition: [Int] = []
    private var addPosition: Int = -1
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configNavigation()
    }
    
    // MARK: - Private functions
    private func configNavigation() {
        title = "Tableview reorder"
        turnOffEditingMode()
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseCells")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    private func deleteACell(index: Int) {
        newNumbers.listOfNumber.remove(at: index)
        tableView.reloadData()
    }
    
    private func insertACell(index: Int) {
        let customView = CustomInsertViewController()
        customView.modalPresentationStyle = .overCurrentContext
        addPosition = index
        customView.delegate = self
        self.present(customView, animated: true, completion: nil)
    }
    
    // MARK: - Objc functions
    @objc private func turnOnEditingMode() {
        tableView.isEditing = true
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(turnOffEditingMode))
        let deleteSelectedButton = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deleteCellSelected))
        navigationItem.rightBarButtonItem = doneButton
        navigationItem.leftBarButtonItem = deleteSelectedButton
    }
    
    @objc private func turnOffEditingMode() {
        tableView.isEditing = false
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(turnOnEditingMode))
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addACell))
        let deleteAllButton = UIBarButtonItem(title: "Delete All", style: .plain, target: self, action: #selector(deleteAllCell))
        navigationItem.rightBarButtonItems = [editButton, addButton]
        navigationItem.leftBarButtonItem = deleteAllButton
    }
    
    @objc private func deleteAllCell() {
        newNumbers.listOfNumber.removeAll()
        tableView.reloadData()
    }
    
    @objc private func deleteCellSelected() {
        selectedPosition.sort { (a, b) -> Bool in
            return a > b
        }
        if selectedPosition.count != 0 {
            for position in selectedPosition {
                newNumbers.listOfNumber.remove(at: position)
            }
            tableView.reloadData()
        }
        selectedPosition.removeAll()
    }
    
    @objc private func addACell() {
        insertACell(index: newNumbers.listOfNumber.count - 1)
    }
}

// MARK: - UITableViewDelegate
extension BaiTap12ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            self.deleteACell(index: indexPath.row)
            completionHandler(true)
        }
        let insert = UIContextualAction(style: .normal, title: "Insert") { (action, view, completionHandler) in
            self.insertACell(index: indexPath.row)
            completionHandler(true)
        }
        delete.backgroundColor = .red
        insert.backgroundColor = .green
        let swipe = UISwipeActionsConfiguration(actions: [delete,insert])
        return swipe
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPosition.append(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let index = selectedPosition.lastIndex(of: indexPath.row) {
            selectedPosition.remove(at: index)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveObject = self.newNumbers.listOfNumber[sourceIndexPath.row]
        newNumbers.listOfNumber.remove(at: sourceIndexPath.row)
        newNumbers.listOfNumber.insert(moveObject, at: destinationIndexPath.row)
    }
}

// MARK: - UITableViewDataSource
extension BaiTap12ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newNumbers.listOfNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCells", for: indexPath)
        cell.textLabel?.text = newNumbers.listOfNumber[indexPath.row]
        return cell
    }
}

// MARK: - CustomInsertViewControllerDelegate
extension BaiTap12ViewController: CustomInsertViewControllerDelegate {
    
    func controller(_ controller: CustomInsertViewController, needsPerform action: CustomInsertViewController.Action) {
        switch action {
        case .sendTextfield(text: let text):
            newNumbers.listOfNumber.insert(text, at: addPosition + 1)
            tableView.reloadData()
            self.dismiss(animated: true, completion: nil)
        case .cancel:
            self.dismiss(animated: true, completion: nil)
        }
    }
}
