//
//  HomeViewController.swift
//  BaiTap_api
//
//  Created by Abcd on 8/19/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var viewModel = HomeViewModel()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadData()
    }
    
    func configTableView() {
        let nib = UINib(nibName: "Bai2TableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadData() {
        viewModel.loadAPI { (done, messages) in
            if done {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("loi API :\(messages)")
            }
        }
    }
}

//MARK: - Extension
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Bai2TableViewCell
        cell.viewModel = viewModel.cellForRowAt(atIndexPath: indexPath)
        return cell
    }
}
