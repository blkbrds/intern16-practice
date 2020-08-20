//
//  ListNameTableViewController.swift
//  TableView
//
//  Created by bu on 8/2/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class ListNameTableViewController: UITableViewController {
    var nameArray: [String] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        //get data from plist
        if let URL = Bundle.main.url(forResource: "NameList", withExtension: "plist") {
            if let nameFromPlist = NSArray(contentsOf: URL) as? [String] {
                nameArray = nameFromPlist
            }
        }
    }
    
    // MARK: - Function
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = "\(nameArray[indexPath.row])"
        return cell
    }
}
