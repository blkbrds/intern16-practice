//
//  Bai08ViewController.swift
//  TableView
//
//  Created by bu on 8/3/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class Bai08ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var names: [[String]] = [[]]
    var nameIndex: [String] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        configTableView()
        loadData()
    }
    
    // MARK: - Function
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "DataSection", withExtension: ".plist")
            else { return }
        guard let sectionData = NSArray(contentsOf: path) as? [[String]]
            else { return }
        names = sectionData
        nameIndex = ["T", "Đ", "D"]
    }
}

// MARK: - Extension UITableViewDataSource
extension Bai08ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = "\(names[indexPath.section][indexPath.row])"
        let nameLabel = NameLabel()
        nameLabel.frame = CGRect(x: 40, y: 30, width: 60, height: 20)
        cell.addSubview(nameLabel)
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return nameIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Thức ăn"
        case 1:
            return "Động vật"
        default:
            return "Dụng cụ"
        }
    }
}
