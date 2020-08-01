//
//  HomeViewController.swift
//  Bai1TableView
//
//  Created by Abcd on 7/30/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Properties
    var viewModel = HomeModel()
    private var gardenIndex: [String] = []
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }
    
    // MARK: - Function
    private func loadData() {
        gardenIndex = ["T", "G", "Đ"]
        viewModel.getData()
    }
    
    private func configTableView() {
        title = "SECTIONS"
        let nib = UINib(nibName: "CustomTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.dataSource = self
        tableView.rowHeight = 100
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Thức Ăn"
        case 1:
            return "Gia Súc"
        default:
            return "Đồ Vật"
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return gardenIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}


extension HomeViewController: CustomTableViewCellDelegate {
    func clickMe(_ customTableViewCell: CustomTableViewCell) {
        var userName = ""
        if let name = customTableViewCell.nameLabel.text {
            userName = name
        }
        print("Home cell --> Tap Me: \(userName)")
    }
}
