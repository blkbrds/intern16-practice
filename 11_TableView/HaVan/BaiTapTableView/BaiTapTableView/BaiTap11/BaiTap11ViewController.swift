//
//  BaiTap11ViewController.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/29/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap11ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configData()
        configTableView()
        configNavigationBar()
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        title = "MESSAGES"
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "MessageTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "messageCell")
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 800
    }
    
    private func configData() {
        Message.getMessage()
    }
}

// MARK: - UITableViewDataSource
extension BaiTap11ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Message.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? MessageTableViewCell else { fatalError("Can't load MessageTableViewCell") }
        cell.setMessage(with: Message.messages[indexPath.row])
        return cell
    }
}
