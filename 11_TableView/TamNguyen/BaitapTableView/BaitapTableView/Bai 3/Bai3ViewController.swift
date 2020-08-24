//
//  Bai3ViewController.swift
//  BaitapTableView
//
//  Created by PCI0001 on 7/28/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai3ViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }
    
    // MARK: - Properties
    private var contacts: [String] = []
    
    // MARK: - Private methods
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Contacts", withExtension: "plist") else { return }
        guard let contactsData = NSArray(contentsOf: path) as? [String] else { return }
        contacts = contactsData
    }
    
    private func configTableView() {
        title = "Contacts"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewSCell")
        //dataSource, delegate
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - Extension UITableViewDataSource
extension Bai3ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewSCell", for: indexPath)
        cell.textLabel?.text = "\(contacts[indexPath.row])"
        return cell
    }
}

// MARK: - Extension UITableViewDelegate
extension Bai3ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = DetailViewController()
        nextVC.contactName = contacts[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
