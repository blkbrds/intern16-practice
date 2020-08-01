//
//  BaiTap1ViewController.swift
//  TableView
//
//  Created by MacBook Pro on 7/27/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap1ViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var myTableView: UITableView!
    
    // MARK: - Private peroperties
    private var listName: [String] = ["Name1","Name2","Name3","Name4","Name5","Name6","Name7","Name8","Name9","Name10"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension BaiTap1ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listName[indexPath.row]
        return cell
    }
}
