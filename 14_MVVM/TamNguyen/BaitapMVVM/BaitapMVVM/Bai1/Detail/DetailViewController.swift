//
//  DetailViewController.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/17/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit
import MapKit

final class DetailViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet private weak var cafeMapView: MKMapView!
    
    // MARK: - Properties
    private var viewModel = DetailViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadData()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        contentLabel.layer.borderWidth = 1
        contentLabel.layer.cornerRadius = 2
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "DetailTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "tablecell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadData() {
        viewModel.getData()
    }
}

// MARK: - Extension UITableViewDelegate, UITableViewDataSource
extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
