//
//  Baitap1102ViewController.swift
//  baitap11
//
//  Created by NXH on 7/27/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap1102ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var names: [String] = []
    private var name: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        readData()
        configTableView()
    }
    
    func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func readData() {
        guard let path = Bundle.main.path(forResource: "name", ofType: "plist") else { return }
        guard let data = NSArray(contentsOfFile: path) as? [String] else { return }
        names = data
    }
}

extension Baitap1102ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
}

extension Baitap1102ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = DetailsViewController()
        view.dataSource = self
        name = names[indexPath.row]
        navigationController?.pushViewController(view, animated: true)
    }
}

extension Baitap1102ViewController: DetailsViewControllerDataSource {
    func getName() -> String {
        return name
    }
}
