//
//  Bai1ViewController.swift
//  Bai1TableView
//
//  Created by Abcd on 7/29/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai1ViewController: UIViewController {
    var names: [String] = ["Name 1",
                             "Name 2",
                             "Name 3",
                             "Name 4",
                             "Name 5",
                             "Name 6",
                             "Name 7",
                             "Name 8","Name 9","Name 10"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
       
    }
}
extension Bai1ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
