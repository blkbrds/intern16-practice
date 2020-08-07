//
//  BaiTap05ViewController.swift
//  BaiTapTableView
//
//  Created by PCI0004 on 8/5/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

class BaiTap05ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!

    // MARK: - Properties
    var listData: [String] = [] // List chinh
    var filterData: [String] = [] // List de loc

    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        filterData = listData
        searchBar.text = ""
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        configSearchBar()
        configTableView()
        loadData()
    }

    // MARK: - Private functions
    private func configSearchBar() {
        searchBar.delegate = self
    }

    private func search(keyword: String) {
        filterData = getData(keyword: keyword)
        tableView.reloadData()
    }

    private func getData(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "" {
            return listData
        } else {
            var data: [String] = []
            for temp in listData {
                if let _ = temp.range(of: keyword) {
                    data.append(temp)
                }
            }
            return data
        }
    }

    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Data", withExtension: "plist") else { return }
        guard let humanData = NSArray(contentsOf: path) as? [String] else { return }
        listData = humanData
    }
}

extension BaiTap05ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // Mot danh sach can hien thi
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filterData[indexPath.row]
        return cell
    }
}

extension BaiTap05ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = BaiTap05DetailsViewController()
        vc.name = listData[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension BaiTap05ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var curentText = ""
        if let searchBarText = searchBar.text {
            curentText = searchBarText
        }
        let keyword = (curentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyWord = searchBar.text else {
            search(keyword: "")
            return
        }
        search(keyword: keyWord)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        search(keyword: "")
    }
}
