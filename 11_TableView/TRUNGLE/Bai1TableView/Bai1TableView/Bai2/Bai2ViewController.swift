//
//  Bai2ViewController.swift
//  Bai1TableView
//
//  Created by Abcd on 7/28/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai2ViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    private var viewModel = Bai2Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        title  = "Home"
        loadData()
        configTableView()
    }
    
    //MARK: - Function
    func loadData() {
        viewModel.getData()
    }
    
    func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }

}
    //MARK: - Extension
extension Bai2ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
}
