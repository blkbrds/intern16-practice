//
//  BaiTap2TableViewController.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/28/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap2TableViewController: UITableViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadData()
    }
    
    // MARK: - Private functions
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseCell")
    }
    
    private func loadData() {
        Contacts.loadData()
    }
}

// MARK: - UITableViewDataSource
extension BaiTap2TableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Contacts.contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
        cell.textLabel?.text = "\(Contacts.contactList[indexPath.row])"
        return cell
    }
}

// MARK: - UITableViewDelegate
extension BaiTap2TableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
