//
//  Bai04ViewController.swift
//  TableView
//
//  Created by bu on 8/3/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class Bai04ViewController: UIViewController {
    
    // MARK: - Enum
    enum Section: Int {
        case food = 0
        case animal
        case tools
        
        var description: String? {
            switch self {
            case .food:
                return "Thức ăn"
            case .animal:
                return "Động vật"
            case .tools:
                return "Dụng cụ"
            }
        }
    }
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Property
    var names: [[String]] = [[]]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SECTIONS"
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
        
    }
}

// MARK: - Extension UITableViewDataSource
extension Bai04ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = "\(names[indexPath.section][indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let secion = Section.init(rawValue: section) else { return "" }
        switch secion {
        case .animal:
            return secion.description
        case .food:
            return secion.description
        case .tools:
            return secion.description
        }
    }
}
