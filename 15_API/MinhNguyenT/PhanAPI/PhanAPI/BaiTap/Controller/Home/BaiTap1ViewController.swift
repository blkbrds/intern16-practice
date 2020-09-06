//
//  BaiTap1ViewController.swift
//  PhanAPI
//
//  Created by MacBook Pro on 8/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap1ViewController: UIViewController {
    
    // MARK: - @IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Peroperties
    var viewModel = HomeViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavi()
        cofigTable()
    }
    
    // MARK: - Private functions
    private func configNavi() {
        navigationItem.title = "Home"
        let reloadButton = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(loadAPI))
        navigationItem.rightBarButtonItem = reloadButton
    }
    
    private func cofigTable() {
        let nib = UINib(nibName: "BaiTap1TableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "BaiTap1TableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func updateUI() {
        tableView.reloadData()
    }
    
    @objc private func loadAPI(){
        viewModel.loadAPI { (done, msg) in
            if done {
                self.tableView.reloadData()
            } else  {
                let alert = UIAlertController(title: "Error!!!!!!!", message: "Error", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

extension BaiTap1ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.musics.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BaiTap1TableViewCell", for: indexPath) as? BaiTap1TableViewCell else {return UITableViewCell()}
        cell.viewModel = viewModel.cellForRowAt(atIndexPath: indexPath)
        return cell
    }
}
