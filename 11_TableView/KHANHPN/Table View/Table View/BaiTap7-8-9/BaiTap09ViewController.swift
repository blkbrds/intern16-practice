//
//  BaiTap09ViewController.swift
//  Table View
//
//  Created by Phan Ngọc Khánh on 8/6/20.
//  Copyright © 2020 Phan Ngọc Khánh. All rights reserved.
//

import UIKit

final class BaiTap09ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var dataIndex: [String] = []
    var back: [String] = []
    var midfielders: [String] = []
    var forward: [String] = []
    var players: [[String]] = [[]]
    let backImg: [UIImage?] = [UIImage(named: "casilas"), UIImage(named: "ramos"), UIImage(named: "pepe"), UIImage(named: "carvajal"), UIImage(named: "marcelo")]
    let midfieldersImg: [UIImage?] = [UIImage(named: "alonso"), UIImage(named: "kroos"), UIImage(named: "rooney")]
    let fowardImg: [UIImage?] = [UIImage(named: "kaka"), UIImage(named: "asensio"), UIImage(named: "ronaldo")]
    var images: [[UIImage?]] = [[]]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCell()
        loadData()
    }
    
    // MARK: - Private functions
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Contacts", withExtension: "plist"), let contactData = NSArray(contentsOf: path) as? [String] else { return }
        for i in 0..<contactData.count {
            if i >= 0 && i <= 4 {
                back.append(contactData[i])
            } else if i > 4 && i < 8 {
                midfielders.append(contactData[i])
            } else if i >= 8 && i < 11 {
                forward.append(contactData[i])
            }
        }
        players = [back, midfielders, forward]
        images = [backImg, midfieldersImg, fowardImg]
        dataIndex = ["D", "M", "A"]
    }
    
    private func configCell() {
        let nib = UINib(nibName: "CustomTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        title = "Real Madrid"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Extensions
extension BaiTap09ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 116
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        players[section].count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return dataIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.nameLabel.text = players[indexPath.section][indexPath.row]
        cell.descriptionLabel.text = "World Best"
        cell.avatarView.image = images[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Defenders"
        case 1:
            return "Midfielders"
        default:
            return "Attackers"
        }
    }
}

extension BaiTap09ViewController: CustomTableViewCellDelegate {
    func customTableViewCell(_ view: CustomTableViewCell, needsPerform action: CustomTableViewCell.Action) {
        switch action {
        case .tap(section: let section, row: let row):
            print("Selected cell \(row) in section \(section)")
        }
    }
}
