//
//  Home2ViewController.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/15/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Home2ViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var cafeImageView: UIImageView!
    @IBOutlet private weak var leftButton: UIButton!
    @IBOutlet private weak var rightButton: UIButton!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    // MARK: - Properties
    private var numberImage: Int = 1
    private var viewmodel2 = CollectionViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadData()
        configUI()
    }
    
    // MARK: - Private methods
    private func configTableView() {
        let nib = UINib(nibName: "Home2TableViewCell", bundle:.main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadData() {
        viewmodel2.getData()
    }
    
    private func configUI() {
        let tableButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-table-50.png"), style: .plain, target: self, action: #selector(switchButtonTouchUpInside))
        navigationItem.rightBarButtonItem = tableButton
    }
    
    @objc private func switchButtonTouchUpInside() {
        guard let vc = navigationController?.viewControllers.first(where: { $0 is HomeViewController }) else { return }
        navigationController?.popToViewController(vc, animated: true)
    }
}

// MARK: - Extension UITableViewDelegae, DataSource
extension Home2ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewmodel2.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel2.numberOfRowInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? Home2TableViewCell else { return UITableViewCell() }
        cell.viewModel2 = viewmodel2.viewModelForCell(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
