//
//  Bai3ViewController.swift
//  Bai1TableView
//
//  Created by Abcd on 7/28/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai3ViewController: UIViewController {
        //MARK: - Properties
       var names: [String] = ["Name 1",
                              "Name 2",
                              "Name 3",
                              "Name 4",
                              "Name 5",
                              "Name 6",
                              "Name 7",
                              "Name 8",
                              "Name 9",
                              "Name 10"]
      //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
      //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }

}
      //MARK: - Extension
extension Bai3ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Bai3DetailViewController()
        vc.name = names[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
