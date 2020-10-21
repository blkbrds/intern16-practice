//
//  Baitap2ViewController.swift
//  Baitap11TableView
//
//  Created by MBA0245P on 10/21/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap2ViewController: UIViewController {
    
    var contacts: [String] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }
    
    func loadData() {
        guard let path = Bundle.main.url(forResource: "NameList", withExtension: "plist") else { return }
        guard let contactsData = NSArray(contentsOf: path) as? [String]
            else { return }
        contacts = contactsData
    }
    
    func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
    }
}

extension Baitap2ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(contacts[indexPath.row])"
        return cell
    }
}
