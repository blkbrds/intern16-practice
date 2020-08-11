//
//  Baitap1101ViewController.swift
//  baitap11
//
//  Created by NXH on 7/27/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap1101ViewController: UIViewController {

// MARK: @IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
// MARK: - properties
    private let names: [String] = ["I", "Love", "U", "So", "Much"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
}

extension Baitap1101ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
}
