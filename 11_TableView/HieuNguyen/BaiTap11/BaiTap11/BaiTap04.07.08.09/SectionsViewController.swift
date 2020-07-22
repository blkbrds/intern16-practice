//
//  SectionsViewController.swift
//  BaiTap11
//
//  Created by hieungq on 7/13/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

final class SectionsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private var datas: [[String]] = [[]]
    private var dataIndex: [String] = []
    private var doAn: [String] = []
    private var dongVat: [String] = []
    private var vatDung: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupTableView()
    }
    
    private func setupTableView() {
        let sectionsTableViewCell = UINib(nibName: "SectionsTableViewCell", bundle: Bundle.main)
        tableView.register(sectionsTableViewCell, forCellReuseIdentifier: "SectionsTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Data2", withExtension: "plist") else { return }
        guard let contactsData = NSArray(contentsOf: path) as? [String] else { return }
        for i in 0..<contactsData.count {
            if i < 2 { doAn.append(contactsData[i]) }
            if 2 < i && i < 8 { dongVat.append(contactsData[i]) }
            if i > 8 { vatDung.append(contactsData[i]) }
        }
        datas = [doAn, dongVat, vatDung]
        dataIndex = ["A", "D", "V"]
    }
}

extension SectionsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionsTableViewCell", for: indexPath) as! SectionsTableViewCell
//        bai tap 4
//        cell.textLabel?.text = datas[indexPath.section][indexPath.row]
        
//        bai tap 7
//        let label = NameLabel()
//        label.frame = CGRect(x: 40, y: 30, width: 60, height: 20)
//        cell.addSubview(label)
        
//        bai tap 9
        cell.updateTableViewCell(image: UIImage(named: "defaultProfileImage")!, name: datas[indexPath.section][indexPath.row], description: "Subtitle")
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Đồ ăn"
        case 1:
            return "Động vật"
        default:
            return "Vật dụng"
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return dataIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension SectionsViewController: SectionsTableViewCellDelegate {
    func getSectionName(view: SectionsTableViewCell, needPerformAction action: SectionsTableViewCell.Action) {
        switch action {
        case .printName(let name):
            print("Tap: \(name)")
        }
    }
}
