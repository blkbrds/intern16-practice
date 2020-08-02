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
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }
    
    // MARK: - Private methods
    private func loadData() {
        title = "Contact"
        prepareData.getUser()
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "CustomTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.dataSource = self
        //searchBar.delegate = self
    }
}

// MARK: - Extension
extension Bai10ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return prepareData.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prepareData.numberOfRowInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.userInCell = prepareData.viewModelForCell(at: indexPath)
        return cell
    }
}

//extension Bai10ViewController: UISearchBarDelegate {
 //   func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
  //      let upperText = searchText.uppercased()
   //     searchList = prepareData.getUser().filter { $0.uppercased().hasPrefix(upperText)
    //    }
     //   tableView.reloadData()
    //}
    
    
    //func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
     //   searchList = prepareData.users
      //  searchBar.searchTextField.text = nil
       // tableView.reloadData()
    //}
//}
