//
//  BaiTap2ViewController.swift
//  TableView
//
//  Created by MacBook Pro on 7/27/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap2ViewController: UIViewController, UITableViewDelegate {

    // MARK: - IBOulets
    @IBOutlet private weak var myTableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!

    // MARK: - Peropeties
    private var listPeople: [String] = []
    private var newData: [String] = []
    private var isSearching: Bool = false

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        configTable()
    }

    // MARK: - Private functions
    private func configTable() {
        myTableView.dataSource = self
        myTableView.delegate = self
        searchBar.delegate = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        getData()
    }

    private func getData() {
        if let path = Bundle.main.path(forResource: "Data", ofType: "plist"){
            if let myDict = NSArray(contentsOfFile: path){
                listPeople = myDict as! [String]
            }
        }
    }
}

extension BaiTap2ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching == true ? newData.count : listPeople.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if isSearching {
            cell.textLabel?.text = newData[indexPath.row]
        } else {
            cell.textLabel?.text = listPeople[indexPath.row]
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        if isSearching {
            vc.name = newData[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        } else {
            vc.name = listPeople[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension BaiTap2ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        newData = listPeople.filter{$0.contains(searchText)}
        isSearching = searchText.isEmpty ? false : true
        myTableView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
