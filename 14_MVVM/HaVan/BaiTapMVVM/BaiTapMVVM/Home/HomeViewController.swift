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
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Propeties
    private var viewModel = HomeViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        configTableView()
        configCollectionView()
        tableViewState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
        collectionView.reloadData()
    }
    
    // MARK: - Private functions
    private func configNavigation() {
        title = "HOME"
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "HomeTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        guard let slider = Bundle.main.loadNibNamed("SlideReusableView", owner: self, options: nil)?.first as? SlideReusableView else { return }
        slider.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 200)
        tableView.tableHeaderView = slider
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configCollectionView() {
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        let slider = UINib(nibName: "SlideReusableView", bundle: Bundle.main)
        collectionView.register(slider, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SlideReusableView")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Objc functions
    @objc private func collectionViewState() {
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .plain, target: self, action: #selector(tableViewState))
        rightItem.tintColor = #colorLiteral(red: 0.9103992581, green: 0.4987511039, blue: 0.4610315561, alpha: 1)
        navigationItem.rightBarButtonItem = rightItem
        tableView.isHidden = true
        collectionView.isHidden = false
    }
    
    @objc private func tableViewState() {
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.grid.2x2.fill"), style: .plain, target: self, action: #selector(collectionViewState))
        rightItem.tintColor = #colorLiteral(red: 0.9103992581, green: 0.4987511039, blue: 0.4610315561, alpha: 1)
        navigationItem.rightBarButtonItem = rightItem
        tableView.isHidden = false
        collectionView.isHidden = true
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.viewModelDetail = viewModel.getDetailModel(atIndexPath: indexPath)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - HomeTableViewCellDelegate
extension HomeViewController: HomeTableViewCellDelegate {
    
    func view(_ view: HomeTableViewCell, needsPerfom action: HomeTableViewCell.Action) {
        switch action {
        case .changeFavoriteState(position: let position, with: let fav):
            viewModel.changeState(position: position, favorite: fav)
            collectionView.reloadItems(at: [IndexPath(item: position, section: 0)])
            tableView.reloadRows(at: [IndexPath(row: position, section: 0)], with: .none)
        }
    }
}

// MARK: - UICollectionViewDatasource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.listCoffee.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        cell.viewModel = viewModel.getHomeCellViewModel(atIndexPath: indexPath)
        cell.position = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SlideReusableView", for: indexPath) as? SlideReusableView else { return UICollectionReusableView() }
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 200)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.bounds.width / 2 - 8, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.viewModelDetail = viewModel.getDetailModel(atIndexPath: indexPath)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - HomeCollectionViewCellDelegate
extension HomeViewController: HomeCollectionViewCellDelegate {
    
    func view(_ view: HomeCollectionViewCell, needsPerfom action: HomeCollectionViewCell.Action) {
        switch action {
        case .changeFavoriteState(position: let position, with: let fav):
            viewModel.changeState(position: position, favorite: fav)
            collectionView.reloadItems(at: [IndexPath(item: position, section: 0)])
            if let cells = tableView.visibleCells as? [HomeTableViewCell] {
                cells[position].viewModel = viewModel.getHomeCellViewModel(atIndexPath: IndexPath(row: position, section: 0))
            }
        }
    }
}
