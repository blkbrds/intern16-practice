//
//  Bai12ViewController.swift
//  TableView
//
//  Created by bu on 8/5/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class Bai12ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Property
    var contacts: [String] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configNavigation()
        loadData()
    }
    
    // MARK: - Function
    private func configNavigation() {
        title = "Table reorder"
        let editButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editTouchUpInside))
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.dataSource = self
    }
    
    private func loadData() {
        if let URL = Bundle.main.url(forResource: "NameList", withExtension: "plist") {
            if let nameFromPlist = NSArray(contentsOf: URL) as? [String] {
                contacts = nameFromPlist
            }
        }
    }
    
    // MARK: - Objc
    @objc private func editTouchUpInside(_ sender: UIBarButtonItem) {
        self.tableView.isEditing = !self.tableView.isEditing
        sender.title = (self.tableView.isEditing) ? "Done": "Edit"
    }
    
}

// MARK: - Extension
extension Bai12ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = "\(contacts[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = contacts[sourceIndexPath.item]
        contacts.remove(at: sourceIndexPath.item)
        contacts.insert(itemToMove, at: destinationIndexPath.item)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contacts.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

