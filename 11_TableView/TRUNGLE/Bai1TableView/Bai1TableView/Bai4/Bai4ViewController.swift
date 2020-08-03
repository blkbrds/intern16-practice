//
//  Bai4ViewController.swift
//  Bai1TableView
//
//  Created by Abcd on 7/28/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai4ViewController: UIViewController {
    
      //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
      //MARK: - Properties
    private var viewModel = Bai4Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
        
    }
    
      //MARK: - Function
    func loadData() {
        viewModel.getData()
    }
    
    func configTableView() {
        title = "SECTION"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
}

      //MARK: - Extension
extension Bai4ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Section 0"
        case 1:
            return "Section 1"
        default:
            return "Section 2"
        }
    }
    
}
