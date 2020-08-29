//
//  BaiTap11ViewController.swift
//  Table View
//
//  Created by Phan Ngọc Khánh on 8/7/20.
//  Copyright © 2020 Phan Ngọc Khánh. All rights reserved.
//

import UIKit

final class BaiTap11ViewController: UIViewController {
    
    // MARK: - Properties
    var data: [String] = []
    
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configTableView()
        loadData()
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "ResponsiveTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Contents", withExtension: "plist"), let textData = NSArray(contentsOf: path) as? [String] else { return }
        data = textData
    }
}

// MARK: - Extensions
extension BaiTap11ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ResponsiveTableViewCell
        cell.contentLabel.text = data[indexPath.row]
        return cell
    }
}
