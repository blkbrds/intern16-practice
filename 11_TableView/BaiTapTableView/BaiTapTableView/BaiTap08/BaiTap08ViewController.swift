//
//  BaiTap08ViewController.swift
//  BaiTapTableView
//
//  Created by PCI0004 on 8/6/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

class BaiTap08ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var garden: [[String]] = []
    var gardenIndex: [String] = []

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Garden"
        configTableView()
        loadData()
    }

    // MARK: Private Functions
    private func loadData() {
        let flowers: [String] = ["A", "B", "C", "D", "B", "C", "D"]
        let vegetables: [String] = ["B", "C", "D", "E", "F", "E", "F"]
        let animals: [String] = ["C", "D", "E", "D", "E"]

        garden = [flowers, vegetables, animals]
        gardenIndex = ["A", "B", "C"]
    }

    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
}

extension BaiTap08ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return garden.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garden[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = garden[indexPath.section][indexPath.row]
        let label = UILabel(frame: CGRect(x: 30, y: 30, width: 80, height: 15))
        label.text = "Name"
        label.textColor = .red
        cell.addSubview(label)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Flowers"
        case 1:
            return "Vegetables"
        default:
            return "Animals"
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return gardenIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}
