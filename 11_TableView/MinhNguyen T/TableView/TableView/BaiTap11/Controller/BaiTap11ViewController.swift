//
//  BaiTap11ViewController.swift
//  TableView
//
//  Created by MacBook Pro on 7/29/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap11ViewController: UIViewController {

    // MARK: - @IBOulets
    @IBOutlet private weak var tbView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    // MARK: - Private functions
    private func getComment() {
        ProjectData.getData()
    }

    private func configTableView() {
        let nib = UINib(nibName: "Bai11TableViewCell", bundle: .main)
        tbView.register(nib, forCellReuseIdentifier: "cell")
        tbView.dataSource = self
        getComment() 
    }
}

extension BaiTap11ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProjectData.projectData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? Bai11TableViewCell else { return UITableViewCell() }
        cell.getComment(comment: ProjectData.projectData[indexPath.row])
        return cell
    }
}
