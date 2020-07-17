//
//  HomeViewController.swift
//  BaiTap13
//
//  Created by PCI0020 on 7/16/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        setupTableView()
        homeViewModel.getData()
        tableView.reloadData()
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "HomeCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "HomeCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell else { return UITableViewCell() }
        cell.viewModel = homeViewModel.viewModelForItem(indexPath: indexPath)
        return cell
    }
}
