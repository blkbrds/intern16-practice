//
//  Baitap1102ViewController.swift
//  baitap11
//
//  Created by NXH on 7/27/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap1105ViewController: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    private var names: [String] = []
    private var filterName: [String] = []
    private var indexTitle: [String] = []
    private var name: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        readData()
        filterName = names
        configTableView()
        configSearchBar()
    }

    // MARK: - Private func
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }
    
    private func search(keyword: String) {
        filterName = getListName(keyword: keyword)
        tableView.reloadData()
    }
    
    private func getListName(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "" {
            return names
        } else {
            var data: [String] = []
            for name in names {
                if let _ = name.range(of: keyword) {
                    data.append(name)
                }
            }
            return data
        }
    }
    
    private func readData() {
        guard let path = Bundle.main.path(forResource: "name", ofType: "plist") else { return }
        guard let data = NSArray(contentsOfFile: path) as? [String] else { return }
        names = data
    }
}

extension Baitap1105ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterName.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filterName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filterName[indexPath.row]
        return cell
    }
}

extension Baitap1105ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
        let view = DetailsViewController()
        view.dataSource = self
        name = filterName[indexPath.row]
        searchBar.text = nil
        search(keyword: "")
        navigationController?.pushViewController(view, animated: true)
    }
}

extension Baitap1105ViewController: DetailsViewControllerDataSource {
    func getName() -> String {
        return name
    }
}

extension Baitap1105ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText = ""
        if let text = searchBar.text {
            currentText = text
        }
        let keyword = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let word = searchBar.text else {
            searchBar.text = ""
            search(keyword: "")
            return
        }
        search(keyword: word)
        view.endEditing(true)
    }
}
