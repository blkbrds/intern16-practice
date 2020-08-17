//
//  HomeViewController.swift
//  BaiTapTabbarController
//
//  Created by NganHa on 8/7/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var slideView: UIView!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var pageControl: UIPageControl!
    // MARK: - Propeties
    private var viewModel = HomeViewModel()
    private var count: Int = -1
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        configTableView()
        configCollectionView()
        configSlideView()
        tableViewState()
    }
    // MARK: - Override functions
    
    // MARK: - Private functions
    private func configNavigation() {
        title = "HOME"
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "HomeTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
    }
    
    private func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }
    
    private func configSlideView() {
        guard let slide = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as? SlideView else { return }
        slide.frame = CGRect(x: 0, y: 0, width: slideView.bounds.width, height: slideView.bounds.height)
        slideView.addSubview(slide)
    }
    // MARK: - Public functions
    
    // MARK: - Objc functions
    @objc private func collectionViewState() {
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .plain, target: self, action: #selector(tableViewState))
        rightItem.tintColor = #colorLiteral(red: 0.9103992581, green: 0.4987511039, blue: 0.4610315561, alpha: 1)
        navigationItem.rightBarButtonItem = rightItem
        self.tableView.alpha = 0
        collectionView.alpha = 1
    }
    
    @objc private func tableViewState() {
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.grid.2x2.fill"), style: .plain, target: self, action: #selector(collectionViewState))
        rightItem.tintColor = #colorLiteral(red: 0.9103992581, green: 0.4987511039, blue: 0.4610315561, alpha: 1)
        navigationItem.rightBarButtonItem = rightItem
        tableView.alpha = 1
        collectionView.alpha = 0
    }
    
    // MARK: - IBActions
    @IBAction private func rightButtonTouchUpInside(_ sender: UIButton) {
        count += 1
        if count <= 5 {
            
        } else {
            count = 0
        }
        pageControl.currentPage = count
    }
    
    @IBAction private func leftButtonTouchUpInside(_ sender: UIButton) {
        count -= 1
        if count >= 0 {
            
        } else {
            count = 5
        }
        pageControl.currentPage = count
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listCoffee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
            fatalError("can't load cell")
        }
        cell.viewModel = viewModel.getHomeCellViewModel(atIndexPath: indexPath)
        cell.position = indexPath.row
        cell.delegate = self
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

// MARK: - HomeTableViewCellDelegate
extension HomeViewController: HomeTableViewCellDelegate {
    
    func view(_ view: HomeTableViewCell, needsPerfom action: HomeTableViewCell.Action) {
        switch action {
        case .changeFavoriteState(position: let position, with: let fav):
            viewModel.changeState(position: position, favorite: fav)
            collectionView.reloadData()
            tableView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDatasource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.listCoffee.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        cell.viewModel = viewModel.getHomeCellViewModel(atIndexPath: indexPath)
        cell.position = indexPath.row
        cell.delegate = self
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2 - 8, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
}

// MARK: - HomeCollectionViewCellDelegate
extension HomeViewController: HomeCollectionViewCellDelegate {
    func view(_ view: HomeCollectionViewCell, needsPerfom action: HomeCollectionViewCell.Action) {
        switch action {
        case .changeFavoriteState(position: let position, with: let fav):
            viewModel.changeState(position: position, favorite: fav)
            collectionView.reloadData()
            tableView.reloadData()
        }
    }
}
