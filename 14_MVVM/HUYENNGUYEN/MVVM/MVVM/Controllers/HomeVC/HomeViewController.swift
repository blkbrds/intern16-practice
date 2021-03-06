//
//  HomeViewController.swift
//  MVVM
//
//  Created by bu on 8/24/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.width

final class HomeViewController: UIViewController {
    
    // MARK: - Struct
    struct Identifiers {
        static let sliderCell = "SliderCollectionViewCell"
        static let collectionCell = "HomeCollectionViewCell"
        static let tableCell = "Home2CollectionViewCell"
    }
    
    // MARK: - IBOutlet
    @IBOutlet private weak var sliderCollectionView: UICollectionView!
    @IBOutlet private weak var listItemCollectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    // MARK: - Properties
    private var index = 0
    var viewModel = HomeViewModel()
    private var timer: Timer?
    var typeView = Identifiers.collectionCell
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        configNavigation()
        configSlider()
        configListItem()
        configPageControl()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer?.invalidate()
        timer = nil
    }
    
    // MARK: - Function
    private func fetchData() {
        viewModel.getImages()
        viewModel.getListCoffee()
    }
    
    private func configNavigation() {
        if typeView == Identifiers.collectionCell {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic-table"), style: .plain, target: self, action: #selector(showViewCollection))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic-collection"), style: .plain, target: self, action: #selector(showViewCollection))
        }
    }
    
    private func configSlider() {
        let sliderNib = UINib(nibName: Identifiers.sliderCell, bundle: Bundle.main)
        sliderCollectionView.register(sliderNib, forCellWithReuseIdentifier: Identifiers.sliderCell)
        sliderCollectionView.dataSource = self
        sliderCollectionView.delegate = self
    }
    
    private func configPageControl() {
        pageControl.numberOfPages = viewModel.sliderImages.count
        pageControl.currentPage = index
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(turnRightButtonTouchUpInside), userInfo: nil, repeats: true)
    }
    
    private func configListItem() {
        let listNib1 = UINib(nibName: Identifiers.collectionCell, bundle: nil)
        listItemCollectionView.register(listNib1, forCellWithReuseIdentifier: Identifiers.collectionCell)
        
        let listNib2 = UINib(nibName: Identifiers.tableCell, bundle: nil)
        listItemCollectionView.register(listNib2, forCellWithReuseIdentifier: Identifiers.tableCell)
        
        listItemCollectionView.dataSource = self
        listItemCollectionView.delegate = self
    }
    
    // MARK: - Objc
    @objc private func showViewCollection() {
        if typeView == Identifiers.collectionCell {
            typeView = Identifiers.tableCell
            configNavigation()
            listItemCollectionView.reloadData()
            
        } else {
            typeView = Identifiers.collectionCell
            configNavigation()
            listItemCollectionView.reloadData()
            
        }
    }
    
    // MARK: - Action
    @IBAction private func turnLeftButtonTouchUpInside(_ sender: UIButton) {
        if index > 0 {
            index -= 1
            sliderCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
            pageControl.currentPage = index
        } else {
            index = viewModel.sliderImages.count
            sliderCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
            pageControl.currentPage = index
        }
    }
    
    @IBAction private func turnRightButtonTouchUpInside(_ sender: UIButton) {
        if index < viewModel.sliderImages.count - 1 {
            index += 1
            sliderCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
            pageControl.currentPage = index
        } else {
            index = 0
            sliderCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
            pageControl.currentPage = index
        }
    }
}

// MARK: - Extension UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case sliderCollectionView:
            return viewModel.sliderImages.count
        default:
            return viewModel.numberOfRows(inSection: section)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case sliderCollectionView:
            guard let cellSlide = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.sliderCell, for: indexPath) as? SliderCollectionViewCell else { return UICollectionViewCell() }
            cellSlide.viewModel = viewModel.viewModelForSlider(at: indexPath)
            return cellSlide
        default:
            if typeView == Identifiers.collectionCell {
                guard let cellList = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.collectionCell, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
                cellList.viewModel = viewModel.viewModelForItem(at: indexPath)
                return cellList
            } else {
                guard let cellList = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.tableCell, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
                cellList.viewModel = viewModel.viewModelForItem(at: indexPath)
                return cellList
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case sliderCollectionView:
            return CGSize(width: kScreenWidth, height: 300)
        default:
            if typeView == Identifiers.collectionCell {
                return CGSize(width: kScreenWidth, height: 100)
            } else {
                return CGSize(width: (kScreenWidth - 20) / 2, height: 200)
            }
        }
    }
}

// MARK: - Extension HomeTableCellDelegate
extension HomeViewController: HomeTableCellDelegate {
    func cell(_ cell: HomeCollectionViewCell, needsPerform action: HomeCollectionViewCell.Action) {
        switch action {
        case .didClickFavoriteButton(let isFavorite):
            guard let indexPath = listItemCollectionView.indexPath(for: cell) else { return }
            viewModel.changeFavorite(at: indexPath, isFavorite: isFavorite)
            cell.viewModel = viewModel.viewModelForItem(at: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case listItemCollectionView:
            guard let information = viewModel.getCoffeeAt(indexPath) else { return }
            let detailVC = DetailViewController()
            detailVC.viewModel = DetailViewModel(information: information)
            self.navigationController?.pushViewController(detailVC, animated: true)
        default:
            return
        }
    }
}
