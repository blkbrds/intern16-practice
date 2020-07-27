//
//  Bai4ViewController.swift
//  Protocol
//
//  Created by PCI0001 on 7/25/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai4ViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var provinceTableView: UITableView!
    
    // MARK: - Properties
    private var searchLocations: [String] = []
    private let cellIdentifier: String = "cell"
    private let locations: [String] = ["An Giang", "Bà Rịa - Vũng Tàu", "Bắc Giang", "Bắc Kạn", "Bạc Liêu", "Bắc Ninh", "Bến Tre",
                                       "Bình Định", "Bình Dương", "Bình Phước", "Bình Thuận", "Cà Mau", "Cao Bằng", "Đắk Lắk", "Đắk Nông",
                                       "Điện Biên", "Đồng Nai", "Đồng Tháp", "Gia Lai", "Hà Giang", "Hà Nam", "Hà Tĩnh", "Hải Dương", "Hậu Giang",
                                       "Hòa Bình", "Hưng Yên", "Khánh Hòa", "Kiên Giang", "Kon Tum", "Lai Châu", "Lâm Đồng", "Lạng Sơn", "Lào Cai",
                                       "Long An", "Nam Định", "Nghệ An", "Ninh Bình", "Ninh Thuận", "Phú Thọ", "Quảng Bình", "Quảng Nam",
                                       "Quảng Ngãi", "Đà Nẵng", "Hải Phòng", "Hà Nội",  "TP.HCM", "Thừa Thiên Huế"]
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        title = "Province Search"
        provinceTableView.delegate = self
        provinceTableView.dataSource = self
        provinceTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        provinceTableView.tableFooterView = UIView(frame: .zero)
        searchLocations = locations
        searchBar.delegate = self
    }
}

// MARK: - Extension
extension Bai4ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = searchLocations[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension Bai4ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let upperText = searchText.uppercased()
        searchLocations = locations.filter { $0.uppercased().hasPrefix(upperText) }
        provinceTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchLocations = locations
        searchBar.searchTextField.text = nil
        provinceTableView.reloadData()
    }
}
