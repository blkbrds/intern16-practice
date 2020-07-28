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
    private var searh = false

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        myTableView.dataSource = self
        myTableView.delegate = self
        searchBar.delegate = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        getData()
    }

    // MARK: - Private functions
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
        if searh {
            return newData.count
        } else {
            return listPeople.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if searh {
                cell.textLabel?.text = newData[indexPath.row]
        } else {
                cell.textLabel?.text = listPeople[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.name = listPeople[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension BaiTap2ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        newData = listPeople.filter{$0.contains(searchText)}
        if searchText.isEmpty {
            searh = false
        } else {
            searh = true
        }
        myTableView.reloadData()
    }
}
