//
//  Baitap1105ViewController.swift
//  baitap11
//
//  Created by NXH on 7/27/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap11part4789ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - properties
    private var datas: [[String]] = []
    private var indexTitle: [String] = []
    private var images: [[String]] = []
    private var sections: [String] = ["Animals", "Equipments", "Foods"]
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        readData()
        readNameImagefromPlist()
        config()
    }
    
    // MARK: - private func
    private func config() {
        let nib = UINib(nibName: "CustomCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "CELL")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func readData() {
        guard let path = Bundle.main.path(forResource: "data", ofType: "plist") else { return }
        guard let data = NSArray(contentsOfFile: path) as? [[String]] else { return }
        datas = data
    }
    
    private func readNameImagefromPlist() {
        guard let path = Bundle.main.path(forResource: "image", ofType: "plist") else { return }
        guard let image = NSArray(contentsOfFile: path) as? [[String]] else { return }
        images = image
    }
}

// MARK: - extendion
extension Baitap11part4789ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func checkRangeImage(section: Int, row: Int) throws -> String {
        let avatar = images[section][row]
        return avatar
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as? CustomTableViewCell {
            cell.delegate = self
            cell.titleCell.text = datas[indexPath.section][indexPath.row]
            cell.subCell.text = "name"
            let isValid = images[indexPath.section].indices.contains(indexPath.row)
            if isValid {
                cell.imageCell.image = UIImage(named: images[indexPath.section][indexPath.row])
            } else {
                cell.imageCell.image = UIImage(named: "avatar")
            }
            return cell
        }
        return UITableViewCell()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return sections[0]
        case 1:
            return sections[1]
        default:
            return sections[2]
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return [String(sections[0].first ?? " "), String(sections[1].first ?? " "), String(sections[2].first ?? " ")]
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

extension Baitap11part4789ViewController: CustomTableViewCellDelegate {
    func view(_ view: CustomTableViewCell, needsPerform action: CustomTableViewCell.Action) {
        var markString: String = ""
        switch action {
        case .tapme:
            if let name = view.titleCell.text {
                markString = name
            }
            for (section , values) in datas.enumerated() {
                for (row, value) in values.enumerated() {
                    if value == markString {
                        print("YOU TAPED: " + "Section: \(section + 1)", "and Row: \(row + 1)")
                    }
                }
            }
        }
    }
}
