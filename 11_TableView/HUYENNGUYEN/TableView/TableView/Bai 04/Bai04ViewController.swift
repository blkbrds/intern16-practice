//
//  Bai04ViewController.swift
//  TableView
//
//  Created by bu on 8/3/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class Bai04ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var names: [[String]] = [[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SECTIONS"
        tableView.dataSource = self
        configTableView()
        loadData()
    }
    
    private func configTableView(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    func loadData() {
        guard let path = Bundle.main.url(forResource: "DataSection", withExtension: ".plist")
            else { return }
        guard let sectionData = NSArray(contentsOf: path) as? [[String]]
            else { return }
        names = sectionData
        
    }
}

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
