//
//  BasicViewController.swift
//  API
//
//  Created by bu on 9/1/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

final class BasicViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Property
    private var viewModel = BasicViewModel()
     
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        configTableView()
        loadAPI()
    }
    
    // MARK: - Function
    private func configTableView() {
        let nib = UINib(nibName: "ImageTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "ImageTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadAPI() {
        viewModel.loadAPI { (done, message) in
            if done {
                self.tableView.reloadData()
            } else {
                print("API ERROR: \(message)")
            }
        }
    }
}

// MARK: - Extension UITableViewDataSource
extension BasicViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as? ImageTableViewCell else { return UITableViewCell() }
        
        cell.viewModel = viewModel.viewModelForItem(at: indexPath)
        return cell
    }
}

// MARK: - Extension UITableViewDelegate
extension BasicViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}
