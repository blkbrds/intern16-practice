//
//  Bai7_8ViewController.swift
//  Bai1TableView
//
//  Created by Abcd on 7/29/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai7_8ViewController: UIViewController {
    
      //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
      //MARK: - Properties
    private var  viewModel = Bai7_8Model()
    private var dataIndex: [String] = []
    
      //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }
    
      //MARK: - Function
    func loadData() {
        viewModel.getData()
        dataIndex = ["T", "G", "Đ"]
    }
    
    func configTableView() {
        title = "SECTIONS"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
}
        //MARK: - Extension
extension Bai7_8ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.viewModelForCell(at: indexPath)
        let label = UILabel(frame: CGRect(x: 30, y: 30, width: 100, height: 15))
        label.text = "Name"
        label.textColor = .blue
        cell.addSubview(label)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Thuc An"
        case 1:
            return "Gia Suc"
        default:
            return "Do Vat"
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return dataIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
}
