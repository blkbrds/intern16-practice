//
//  Bai10ViewController.swift
//  BaitapTableView
//
//  Created by PCI0001 on 7/31/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai10ViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var prepareData = PrepareData()
    private var customTableViewCell = CustomTableViewCell()
    private var searchList: [[String]] = []
    private var cellIdentifier: String = "CustomTableViewCell"
    private var homeTitle: String = "Contact"
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }
    
    // MARK: - Private methods
    private func loadData() {
        title = homeTitle
        prepareData.getUser()
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "CustomTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = self
    }
}

// MARK: - Extension UITableViewDataSource
extension Bai10ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return prepareData.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prepareData.numberOfRowInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        cell.userInCell = prepareData.viewModelForCell(at: indexPath)
        return cell
    }
}
