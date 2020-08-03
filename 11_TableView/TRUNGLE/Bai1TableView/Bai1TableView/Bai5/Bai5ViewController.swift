//
//  Bai5ViewController.swift
//  Bai1TableView
//
//  Created by Abcd on 7/28/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai5ViewController: UIViewController {
    
      //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
      //MARK: - Properties
    var contactsData: [String] = ["tuy", "nhiên", "các học"," trò của"," cựu danh"," thủ Scott"," Parker rất ","nhanh chóng"," lấy lại","tinh thần", "Chỉ 1 phút sau"," Neeskens Kebano"]
    var contacts: [String] = []
    var names: [String] = []
    
    
      //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configSearchBar()
        loadData()
    }
    
      //MARK: - Function
    override func viewWillAppear(_ animated: Bool) {
           names = contacts
           searchBar.text = ""
           tableView.reloadData()
       }
    
    func configTableView() {
        title = "HOME"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configSearchBar() {
           searchBar.delegate = self
       }
private func search(keyword: String) {
       names = getNames(keyword: keyword)
       tableView.reloadData()
   }

    func loadData() {
        contacts = contactsData
    }
private func getNames(keyword: String) -> [String] {
       if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "" {
           return contacts
       } else {
           var data: [String] = []
           for name in contacts {
               if let _ = name.range(of: keyword) {
                   data.append(name)
               }
           }
           return data
       }
   }
}
      //MARK: - Extension
extension Bai5ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let vcDetail = Bai5DetailViewController()
        vcDetail.name = names[indexPath.row]
        navigationController?.pushViewController(vcDetail, animated: true)
    }
}

// MARK: - UISearchBarDelegate
extension Bai5ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText = ""
        if let searchBarText = searchBar.text {
            currentText = searchBarText
        }
        let keyword = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text else {
            search(keyword: "")
            return
        }
        search(keyword: keyword)
    }
}
