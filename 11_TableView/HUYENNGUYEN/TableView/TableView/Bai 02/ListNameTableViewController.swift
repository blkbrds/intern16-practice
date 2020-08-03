//
//  ListNameTableViewController.swift
//  TableView
//
//  Created by bu on 8/2/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class ListNameTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        var nameArray: [String] = []
        if let URL = Bundle.main.url(forResource: "NameList", withExtension: "plist") {
            if let nameFromPlist = NSArray(contentsOf: URL) as? [String] {
                nameArray = nameFromPlist
              }
            }
        
        cell.textLabel?.text = "\(nameArray[indexPath.row])"
        return cell
        
    }
}
