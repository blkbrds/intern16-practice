//
//  MasterViewController.swift
//  TableView
//
//  Created by bu on 8/3/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Property
    var contacts: [String] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contact"
        configTableView()
        loadData()
    }
    
    // MARK: - Function
    private func configTableView(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func loadData() {
        if let URL = Bundle.main.url(forResource: "NameList", withExtension: "plist") {
            if let nameFromPlist = NSArray(contentsOf: URL) as? [String] {
                contacts = nameFromPlist
            }
        }
    }
}

// MARK: - Extension UITableViewDataSource
extension MasterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = "\(contacts[indexPath.row])"
        return cell
    }
}

// MARK: - Extension UITableViewDelegate
extension MasterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.profiles = contacts[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
