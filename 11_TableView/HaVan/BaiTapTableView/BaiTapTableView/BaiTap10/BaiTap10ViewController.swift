//
//  BaiTap10ViewController.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/29/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap10ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Propeties
    private var keys: [String] = []
    private var values: [String] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configData()
        configNavigationBar()
        getKey()
        configTableView()
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        title = "CONTACTS"
    }
    
    private func configData() {
        let managementContact = ManagementContact()
        managementContact.getContactsFromIphone()
        managementContact.saveContacts()
        ContactInformation.readPropertyList()
    }
    
    private func getKey() {
        keys = Array(ContactInformation.contacts.keys)
        values = Array(ContactInformation.contacts.values)
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "PeopleTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "reuseContactCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension BaiTap10ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactInformation.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseContactCell", for: indexPath) as! PeopleTableViewCell
        cell.updateCell(name: keys[indexPath.row], phone: values[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension BaiTap10ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
