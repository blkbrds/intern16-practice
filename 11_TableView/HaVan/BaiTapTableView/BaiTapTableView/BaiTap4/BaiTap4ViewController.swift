//
//  BaiTap4ViewController.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/28/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap4ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSections()
        configNavigationBar()
        configTableView()
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        title = "SECTIONS"
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseCell")
        tableView.dataSource = self
    }
    
    private func loadSections() {
        Sections.loadData()
    }
}

// MARK: - UITableViewDataSource
extension BaiTap4ViewController: UITableViewDataSource {
    
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
}

// MARK: - UITableViewDelegate
extension BaiTap4ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
