//
//  BaiTap4ViewController.swift
//  Table View
//
//  Created by Phan Ngọc Khánh on 8/6/20.
//  Copyright © 2020 Phan Ngọc Khánh. All rights reserved.
//

import UIKit

final class BaiTap4ViewController: UIViewController {
    
    // MARK: - Properties
    var back: [String] = []
    var midfielders: [String] = []
    var forward: [String] = []
    var players: [[String]] = [[]]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }
    
    // MARK: - Private functions
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Contacts", withExtension: "plist") else { return }
        guard let contactData = NSArray(contentsOf: path) as? [String] else { return }
        for i in 0..<contactData.count {
            switch i {
            case 0...4:
                back.append(contactData[i])
            case 5...7:
                midfielders.append(contactData[i])
            case 8...10:
                forward.append(contactData[i])
            default:
                return
            }
        }
        players = [back, midfielders, forward]
    }
    
    private func configTableView() {
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        title = "Real Madrid"
    }
}

// MARK: - Extensions
extension BaiTap4ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = players[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Defenders"
        case 1:
            return "Midfielders"
        default:
            return "Attackers"
        }
    }
}
