//
//  BaiTap9ViewController.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/29/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap9ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Propeties
    private var thingIndex: [String] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configNavigationBar()
        loadData()
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        title = "SECTIONS"
    }
    
    private func loadData() {
        Sections.loadData()
        thingIndex = ["GD", "TA", "ĐV"]
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "CustomTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "customCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension BaiTap9ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Sections.sections[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else { fatalError("Can't load CustomTableViewCell") }
        let newObject = MyClass(avatar: "sushi", name: Sections.sections[indexPath.section][indexPath.row], description: "subtitle")
        cell.updateTableCell(thing: newObject)
        cell.row = indexPath.row
        cell.section = indexPath.section
        cell.delegate = self
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
extension BaiTap9ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: - CustomTableViewCellDelegate
extension BaiTap9ViewController: CustomTableViewCellDelegate {
    
    func view(_ view: CustomTableViewCell, needsPerform action: CustomTableViewCell.Action) {
        switch action {
        case .tap(section: let section, row: let row):
            print("section: \(section) ; row : \(row)")
        }
    }
}
