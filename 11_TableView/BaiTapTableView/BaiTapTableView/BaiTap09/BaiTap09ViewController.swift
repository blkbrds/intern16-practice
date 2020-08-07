//
//  BaiTap09ViewController.swift
//  BaiTapTableView
//
//  Created by PCI0004 on 8/6/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class BaiTap09ViewController: UIViewController {

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
        // Register nib
        let nib = UINib(nibName: "GardenTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "GardenTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension BaiTap09ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return garden.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garden[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GardenTableViewCell", for: indexPath) as! GardenTableViewCell
        cell.updateTableCell(avatar: "avatar", nameGarden: garden[indexPath.section][indexPath.row],subtitle: "Click here")
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
extension BaiTap09ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

