//
//  AudioBookViewController.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/23/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class AudioBookViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Propeties
    private var viewModel = AudioBookViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadData()
    }
    
    // MARK: - Private functions
    private func configTableView() {
        let nib = UINib(nibName: "AudioBookCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "AudioBookCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadData() {
        viewModel.loadAPI { (done, msg) in
            if done {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("API error: \(msg)")
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension AudioBookViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AudioBookCell", for: indexPath) as? AudioBookCell else { return UITableViewCell() }
        cell.viewModel = viewModel.cellForRowAt(atIndexPath: indexPath)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension AudioBookViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
