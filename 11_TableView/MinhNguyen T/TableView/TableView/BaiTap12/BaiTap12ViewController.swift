//
//  BaiTap12ViewController.swift
//  TableView
//
//  Created by MacBook Pro on 7/31/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap12ViewController: UIViewController {

    // MARK: - @IBOulets
    @IBOutlet private weak var myTableView: UITableView!

    // MARK: - Private peroperties
    private var data: [String] = ["One","Two","Three","Four","Five","Six","Seven", "Eight"]
    private var selectArr: [Int] = []

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configtable()
        configNavi()
    }

    // MARK: - Private functions
    private func configtable() {
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.allowsMultipleSelectionDuringEditing = true
    }

    private func configNavi() {
        navigationItem.title = "Table Reorder"
        handleTurnOnEdit()
        handleTurnOffEdit()
    }

    // MARK: - Objc functions
    @objc private func handleDeleteAllButtonTouchUpInside(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Delete", message: "Are you sure?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (_)in
            self.data.removeAll()
            self.myTableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }

    @objc private func deleteCellSelected() {
        selectArr.sort()
        if selectArr.count != 0 {
            for index in selectArr.reversed() {
                data.remove(at: index)
            }
            selectArr.removeAll()
            myTableView.reloadData()
        }
    }

    @objc private func handleTurnOnEdit() {
        myTableView.isEditing = true
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(handleTurnOffEdit))
        let deleteSelectedButton = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deleteCellSelected))
        navigationItem.rightBarButtonItem = doneButton
        navigationItem.leftBarButtonItem = deleteSelectedButton
    }

    @objc private func handleTurnOffEdit() {
        myTableView.isEditing = false
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(handleTurnOnEdit))
        let deleteAllButton = UIBarButtonItem(title: "Delete All", style: .plain, target: self, action: #selector(handleDeleteAllButtonTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
        navigationItem.leftBarButtonItem = deleteAllButton
    }
}

// MARK: - UITableViewDataSource
extension BaiTap12ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        data.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectArr.append(indexPath.row)
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let index = selectArr.lastIndex(of: indexPath.row) {
            selectArr.remove(at: index)
        }
    }
}

// MARK: - UITableViewDelegate
extension BaiTap12ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            tableView.beginUpdates()
            self.data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
        deleteAction.backgroundColor = .red
        let insertAction = UIContextualAction(style: .destructive, title: "Insert") { (action, view, handler) in
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: indexPath.row + 1, section: indexPath.section)], with: .left)
            self.data.insert("hello", at: indexPath.row + 1)
            tableView.endUpdates()
        }
        insertAction.backgroundColor = .green
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction,insertAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
}
