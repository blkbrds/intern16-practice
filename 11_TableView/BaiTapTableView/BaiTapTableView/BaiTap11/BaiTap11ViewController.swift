//
//  BaiTap11ViewController.swift
//  BaiTapTableView
//
//  Created by PCI0004 on 8/6/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

class BaiTap11ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var content: [String] = ["P1: The appearance of labels is configurable, and they can display attributed strings, allowing you to customize the appearance of substrings within a label. You can add labels to your interface programmatically or by using Interface Builder The appearance of labels is configurable, and they can display attributed strings, allowing you to customize the appearance of substrings within a label."
        , "P2: You can add labels to your interface programmatically or by using Interface Builder The appearance of labels is configurable, and they can display attributed strings, allowing you to customize the appearance of substrings within a label."
        , "P3: You can add labels to your interface programmatically or by using Interface Builder The appearance of labels is configurable, and they can display attributed strings, allowing you to customize the appearance of substrings within a label. "]

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        configTableView()
    }

    // MARK: Private Functions
    private func configTableView() {
        // Register nib
        let nib = UINib(nibName: "ContentTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "ContentTableViewCell")
        tableView.dataSource = self
    }
}

extension BaiTap11ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentTableViewCell", for: indexPath) as! ContentTableViewCell
        cell.updateTableCell(content: content[indexPath.row])
        return cell
    }
}
