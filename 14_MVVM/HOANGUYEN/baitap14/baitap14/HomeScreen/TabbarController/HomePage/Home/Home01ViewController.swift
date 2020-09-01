//
//  Home01ViewController.swift
//  baitap13
//
//  Created by NXH on 8/6/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Home01ViewController: BaseViewController {
    
    // MARK: -@IBOutlet
    @IBOutlet private weak var imageCollectionView: UICollectionView!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private let viewModelImageCollectionView = ImageCollectionViewViewModel()
    private var current: Int = 0
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavi()
        configImageCollectionView()
        configTableView()
        configcollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        collectionView.reloadData()
    }
    // MARK: - Private func
    private func configNavi() {
        title = "Home"
        let righBarButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "icons8-collectionViewMode-50"), style: .plain, target: self, action: #selector(changeMode))
        navigationItem.rightBarButtonItem = righBarButton
    }
    
    private func configImageCollectionView() {
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        let nib = UINib(nibName: "ImageCollectionViewCell", bundle: .main)
        imageCollectionView.register(nib, forCellWithReuseIdentifier: "imageColectionViewCell")
        pageControl.numberOfPages = viewModelImageCollectionView.getNumberImage()
    }
    
    private func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "tableViewCell")
    }
    
    private func configcollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "CollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "collectionViewCell")
    }
    
    // MARK: - @objc func
    @objc private func changeMode() {
        if tableView.alpha == 1 {
            navigationItem.rightBarButtonItems?.first?.image = UIImage(named: "icons8-tableViewMode-50")
            tableView.alpha = 0
            collectionView.alpha = 1
            collectionView.reloadData()
        } else {
            navigationItem.rightBarButtonItems?.first?.image = UIImage(named: "icons8-collectionViewMode-50")
            tableView.alpha = 1
            collectionView.alpha = 0
            tableView.reloadData()
        }
    }
    
    // MARK: - @IBAction
    @IBAction func backButtonTouchUpInside(_ sender: UIButton) {
        var back = current - 1
        if back >= 0 {
            imageCollectionView.scrollToItem(at: IndexPath(row: back, section: 0), at: .left, animated: true)
            pageControl.currentPage = back
        } else {
            back = 0
        }
        current = back
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        var next = current + 1
        if next < 5 {
            imageCollectionView.scrollToItem(at: IndexPath(row: next, section: 0), at: .left, animated: true)
            pageControl.currentPage = next
        } else {
            next = 4
        }
        current = next
    }
}
// MARK: - extension: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension Home01ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case imageCollectionView:
            return viewModelImageCollectionView.numberOfItems(inSection: 0)
        default:
            return HomeViewModel.viewModel.numberOfItems(inSection: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case imageCollectionView:
            guard let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "imageColectionViewCell", for: indexPath) as? ImageCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.viewModel = viewModelImageCollectionView.getImageCollectionViewCell(atIndexPath: indexPath)
            return cell
        default:
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
            if indexPath.row % 2 == 0 {
                cell.frame.origin.x = cell.frame.origin.x + 2
            } else {
                cell.frame.origin.x = cell.frame.origin.x - 2
            }
            cell.viewModel = HomeViewModel.viewModel.getHomeCell(atIndexPath: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case imageCollectionView:
            let height: CGFloat = collectionView.frame.height
            let width: CGFloat = collectionView.frame.width
            return CGSize(width: width, height: height)
        default:
            let width: CGFloat = collectionView.frame.width / 2 - 5
            let height: CGFloat = width
            return CGSize(width: width, height: height)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let view = DetailsViewController()
        view.viewModel = HomeViewModel.viewModel.getDetailCoffeeShop(atIndexPath: indexPath)
        navigationController?.pushViewController(view, animated: true)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension Home01ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeViewModel.viewModel.listCoffeeShop.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        cell.viewModel = HomeViewModel.viewModel.getHomeCell(atIndexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = DetailsViewController()
        view.viewModel = HomeViewModel.viewModel.getDetailCoffeeShop(atIndexPath: indexPath)
        navigationController?.pushViewController(view, animated: true)
    }
}

