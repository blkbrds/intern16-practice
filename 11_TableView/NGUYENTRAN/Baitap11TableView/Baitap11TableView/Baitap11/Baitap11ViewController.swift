//
//  Baitap11ViewController.swift
//  Baitap11TableView
//
//  Created by MBA0245P on 11/5/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap11ViewController: UIViewController {

    var messages: [String] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }

    func loadData() {
        guard let path = Bundle.main.url(forResource: "MessageList", withExtension: ".plist") else { return }
        guard let messageList = NSArray(contentsOf: path) as? [String]
            else { return }
        messages = messageList
    }

    func configTableView() {
        let nib = UINib(nibName: "CustomCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "CustomCell")
        tableView.dataSource = self
    }
}

extension Baitap11ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.displayMessage(message: messages[indexPath.row])
        return cell
    }
}
