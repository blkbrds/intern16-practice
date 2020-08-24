//
//  HomeViewController.swift
//  BaitapTableView
//
//  Created by PCI0001 on 7/29/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var loadUser = LoadUser()
    private var sectionIndexs: [String] = []
    private var homeTableViewCell = HomeTableViewCell()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }
    
    // MARK: - Private methods
    private func loadData() {
        sectionIndexs = ["I", "R", "O", "N"]
        loadUser.getUser()
    }
    
    private func configTableView() {
        title = "List"
        let nib = UINib(nibName: "HomeTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        tableView.dataSource = self
    }
}

// MARK: - Extension UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        loadUser.numberOfSection()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        loadUser.numberOfRowInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        cell.viewModel = loadUser.viewModelForCell(at: indexPath)
        cell.delegate = self
        cell.section = indexPath.section
        cell.row = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionIndexs
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Intern"
        case 1:
            return "Rained Sister"
        case 2:
            return "Old Girl Friend"
        default:
            return "New Girl Friends"
        }
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

// MARK: - Extension HomeTableViewCellDelegate
extension HomeViewController: HomeTableViewCellDelegate {
    func tap(view: HomeTableViewCell) {
        print("hihi")
    }
}
