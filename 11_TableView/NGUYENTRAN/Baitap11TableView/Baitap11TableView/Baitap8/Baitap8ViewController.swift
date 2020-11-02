//
//  Baitap8ViewController.swift
//  Baitap11TableView
//
//  Created by MBA0245P on 11/2/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap8ViewController: UIViewController {

    var sections: [[String]] = []
    var sectionIndex: [String] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SECTIONS"
        loadData()
        configTableView()
    }

    func loadData() {
        guard let path = Bundle.main.url(forResource: "SectionList", withExtension: ".plist") else { return }
        guard let sectionList = NSArray(contentsOf: path) as? [[String]]
            else { return }
        sections = sectionList
        sectionIndex = ["F", "A", "T"]
    }

    func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
    }
    
    func addLabel() -> UILabel {
        let label = UILabel(frame: CGRect(x: 50, y: 25, width: 50, height: 20))
        label.textColor = .red
        label.text = "name"
        return label
    }
}

extension Baitap8ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionIndex
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(sections[indexPath.section][indexPath.row])"
        cell.contentView.addSubview(addLabel())
        return cell
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Foods"
        case 1: return "Animals"
        case 2: return "Things"
        default: return "Others"
        }
    }
}
