//
//  BaiTap03TableViewController.swift
//  Table View
//
//  Created by Phan Ngọc Khánh on 7/30/20.
//  Copyright © 2020 Phan Ngọc Khánh. All rights reserved.
//

import UIKit

final class BaiTap03TableViewController: UITableViewController {
    
    // MARK: - Properties
    private var data: [String] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }
    
    // MARK: - Private function
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Contacts", withExtension: "plist") else {
            return
        }
        guard let contactData = NSArray(contentsOf: path) as? [String] else {
            return
        }
        data = contactData
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        title = "Real Madrid"
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactDetailViewController = ContactDetailViewController()
        contactDetailViewController.contactName = data[indexPath.row]
        navigationController?.pushViewController(contactDetailViewController, animated: true)
    }
}
