//
//  Bai7ViewController.swift
//  BaitapTableView
//
//  Created by PCI0001 on 7/29/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai7ViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var getDataFriends = GetDataFriends()
    private var titles: [String] = ["Intern", "Rained Sister", "Old Girl Friends", "New Girl Friends"]
    private var sectionIndexs: [String] = ["I", "R", "O", "N"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }
    
    // MARK: - Private methods
    private func loadData() {
        getDataFriends.loadData()
    }
    
    private func configTableView() {
        title = "Girl Friends"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
}

// MARK : - Extension UITableViewDataSource
extension Bai7ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return getDataFriends.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getDataFriends.numberOfRowsInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = getDataFriends.viewModelForCell(at: indexPath)
        let nambeLabel = UILabel(frame: CGRect(x: 40, y: 30, width: 50, height: 20))
        nambeLabel.text = "Intern"
        nambeLabel.textColor = .red
        cell.addSubview(nambeLabel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionIndexs
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

