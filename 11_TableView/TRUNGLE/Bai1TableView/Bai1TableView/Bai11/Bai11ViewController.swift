//
//  Bai11ViewController.swift
//  Bai1TableView
//
//  Created by Abcd on 8/2/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai11ViewController: UIViewController {
    
    //MARK: -IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var viewModel = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    //MARK: - Function
    private func configTableView() {
        let nib = UINib(nibName: "CustomBai11TableViewCell", bundle:  Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
}
extension Bai11ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        as! CustomBai11TableViewCell
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
    
    
}
