//
//  Bai09ViewController.swift
//  TableView
//
//  Created by bu on 8/3/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class Bai09ViewController: UIViewController {

   @IBOutlet weak var tableView: UITableView!
        
        var names: [[String]] = [[]]
        var nameIndex: [String] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            configTableView()
            loadData()
        }
        
        private func configTableView() {
            let nib = UINib(nibName: "Bai09TableTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "Bai09TableTableViewCell")
            tableView.dataSource = self
        }
        
        func loadData() {
            guard let path = Bundle.main.url(forResource: "DataSection", withExtension: ".plist")
                else { return }
            guard let sectionData = NSArray(contentsOf: path) as? [[String]]
                else { return }
            names = sectionData
            nameIndex = ["T", "Đ", "D"]
        }
    }

    extension Bai09ViewController: UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            return names.count
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return names[section].count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Bai09TableTableViewCell", for: indexPath) as? Bai09TableTableViewCell else {
                return  UITableViewCell()
            }
            cell.setTableViewCell(image: "image1", name: names[indexPath.section][indexPath.row], subTitle: "wefw")
            cell.delegate = self
            return cell
        }
        
        func sectionIndexTitles(for tableView: UITableView) -> [String]? {
            return nameIndex
        }
        
        func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
            return index
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

extension Bai09ViewController: Bai09TableTableViewCellDelegate {
    func viewcell(_ view: Bai09TableTableViewCell) {
        print("")
    }
}

