//
//  CustomTableViewController.swift
//  Collection View
//
//  Created by Ngoc Khanh Phan on 8/18/20.
//  Copyright © 2020 Phan Ngọc Khánh. All rights reserved.
//

import UIKit

final class CustomTableViewController: UIViewController {
    
    // MARK: - Properties
    var colorsArray = Colors()
    
    // MARK: - IBOutlet:
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Private Functions
    private func setupTableView() {
        title = "Custom Collection Table View"
        let nib = UINib(nibName: "TableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "tableCellID")
        let cellNib = UINib(nibName: "SlideTableViewCell", bundle: .main)
        tableView.register(cellNib, forCellReuseIdentifier: "slideCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - Extensions
extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorsArray.objectsArray[section].subcategory.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return colorsArray.objectsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 && indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "slideCell", for: indexPath) as? SlideTableViewCell {
                return cell
            }
            return UITableViewCell()
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "tableCellID", for: indexPath) as? TableViewCell {
                
                let subCategoryTitle = colorsArray.objectsArray[indexPath.section].subcategory
                cell.subCategoryLabel.text = subCategoryTitle[indexPath.row]
                
                let rowArray = colorsArray.objectsArray[indexPath.section].colors[indexPath.row]
                cell.updateCellWith(row: rowArray)
                cell.selectionStyle = .none
                return cell
            }
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 && indexPath.section == 0 {
            return 250
        } else {
            return 180
        }
    }
}
