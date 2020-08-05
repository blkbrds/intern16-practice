//
//  Bai11ViewController.swift
//  TableView
//
//  Created by bu on 8/4/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit
class Bai11ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var text: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadData()
    }
    
    private func configTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        let nib = UINib(nibName: "Bai11TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Bai11TableViewCell")
        tableView.dataSource = self
    }
    
    private func loadData() {
        if let URL = Bundle.main.url(forResource: "DataText", withExtension: "plist") {
            if let nameFromPlist = NSArray(contentsOf: URL) as? [String] {
                text = nameFromPlist
            }
        }
    }
}

extension Bai11ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return text.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Bai11TableViewCell", for: indexPath) as? Bai11TableViewCell else {
            return UITableViewCell()
        }
        cell.setContent(text: text[indexPath.row])
        cell.delegate = self
        return cell
    }
}

extension Bai11ViewController: Bai11TableViewCellDelegate {
    func viewcell(_ view: Bai11TableViewCell) {
        print("")
    }
}
