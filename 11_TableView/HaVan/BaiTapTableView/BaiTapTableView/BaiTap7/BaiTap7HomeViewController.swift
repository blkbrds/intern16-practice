//
//  BaiTap7HomeViewController.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/28/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap7HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Propeties
    private var thingIndex: [String] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configData()
        configTableView()
    }
    
    // MARK: - Private functions
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseCell")
        tableView.dataSource = self
    }
    
    private func configData() {
        Sections.loadData()
        thingIndex = ["GD", "TA", "ĐV"]
    }
}

// MARK: - UITableViewDataSource
extension BaiTap7HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Sections.sections[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
        cell.textLabel?.text = Sections.sections[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Đồ gia dụng"
        case 1:
            return "Thức ăn"
        case 2:
            return "Động vật"
        default:
            return "linh tinh"
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return thingIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

// MARK: - UITableViewDelegate
extension BaiTap7HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
