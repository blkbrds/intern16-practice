//
//  Baitap1112ViewController.swift
//  baitap11
//
//  Created by NXH on 8/2/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap1112ViewController: UIViewController {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var datas: [String] = ["one", "two", "three", "four", "five"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private Function
    private func configUI() {
        turnOffEditingMode()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc private func turnOffEditingMode() {
        title = "Home"
        tableView.isEditing = false
        tableView.allowsMultipleSelection = false
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(turnOnEditingMode))
        navigationItem.rightBarButtonItems = [editButton]
        navigationItem.leftBarButtonItems = []
    }
    
    @objc private func turnOnEditingMode() {
        title = nil
        tableView.allowsMultipleSelectionDuringEditing = true
        tableView.isEditing = true
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(turnOffEditingMode))
        let insertButton = UIBarButtonItem(title: "Insert", style: .plain, target: self, action: #selector(insertButtonTouchUpInside))
        let deleteAllButton = UIBarButtonItem(title: "Delete All", style: .plain, target: self, action: #selector(deleteAll))
        navigationItem.rightBarButtonItems = [doneButton, insertButton]
        navigationItem.leftBarButtonItems = [deleteAllButton]
    }
    
    @objc private func insertButtonTouchUpInside() {
        let insertAlert: UIAlertController = UIAlertController(title: "Insert name cell", message: "", preferredStyle: .alert)
        insertAlert.addTextField { (context) in
            context.placeholder = "Nhập tên bạn muốn thêm"
        }
        let okButton: UIAlertAction = UIAlertAction(title: "OK", style: .default) { (ok) in
            if let name = insertAlert.textFields?[0].text {
                if name != "" {
                    self.datas.append(name)
                    self.tableView.reloadData()
                }
            }
        }
        let cancelButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .destructive) { (cancel) in
        }
        insertAlert.addAction(okButton)
        insertAlert.addAction(cancelButton)
        present(insertAlert, animated: true)
    }
    
    @objc private func deleteAll() {
        if let remove = tableView.indexPathsForSelectedRows {
            tableView.beginUpdates()
            for index in remove {
                datas.remove(at: index.row)
            }
            tableView.deleteRows(at: remove, with: .right)
            tableView.endUpdates()
            return
        }
        var message = "Bạn muốn xoá tất cả?"
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.datas.removeAll()
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (cancel) in
            self.turnOnEditingMode()
        }
        var actionsButton: [UIAlertAction] = [cancelAction, okAction]
        if datas.isEmpty {
            message = "Không có dữ liệu"
            actionsButton = [cancelAction]
        }
        let alert = UIAlertController(title: "Thông báo", message: message, preferredStyle: .alert)
        for action in actionsButton {
            alert.addAction(action)
        }
        present(alert, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension Baitap1112ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = datas[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension Baitap1112ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .right)
            datas.remove(at: indexPath.row)
            tableView.endUpdates()
        default:
            return
        }
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = datas[sourceIndexPath.row]
        datas[sourceIndexPath.row] = datas[destinationIndexPath.row]
        datas[destinationIndexPath.row] = temp
    }
}
