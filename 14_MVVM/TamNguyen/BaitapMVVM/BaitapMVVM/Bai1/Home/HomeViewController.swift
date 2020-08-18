//
//  HomeViewController.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/12/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var cafeImageView: UIImageView!
    @IBOutlet private weak var leftButton: UIButton!
    @IBOutlet private weak var rightButton: UIButton!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    // MARK: - Properties
    private var numberImage: Int = 1
    private var viewModel = HomeViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configCollectionView()
        configPageControl()
        loadData()
        switchCollectionButtonTouchUpInside()
    }
    
    // MARK: - Private methods
    private func configTableView() {
        title = "Home"
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "tableCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configCollectionView() {
        let nib = UINib(nibName: "CollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "collectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func loadData() {
        viewModel.getData()
    }
    
    private func configPageControl() {
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
    }
    
    private func slideShow() {
        switch numberImage {
        case 1:
            leftButton.isEnabled = false
            cafeImageView.image = UIImage(named: "i1")
        case 2:
            rightButton.isEnabled = true
            cafeImageView.image = UIImage(named: "i2")
        default:
            rightButton.isEnabled = false
            leftButton.isEnabled = true
            cafeImageView.image = UIImage(named: "image1")
        }
    }
    
    @objc private func switchCollectionButtonTouchUpInside() {
        let collectionButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-table-50.png"), style: .plain, target: self, action: #selector(switchTableButtonTouchUpInside))
        navigationItem.rightBarButtonItem = collectionButton
        tableView.isHidden = true
        collectionView.isHidden = false
    }
    
    @objc private func switchTableButtonTouchUpInside() {
        let tableButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-menu-50.png"), style: .plain, target: self, action: #selector(switchCollectionButtonTouchUpInside))
        navigationItem.rightBarButtonItem = tableButton
        tableView.isHidden = false
        collectionView.isHidden = true
    }
    
    // MARK: - IBActions
    @IBAction private func leftButtonTouchUpInside(_ sender: UIButton) {
        numberImage -= 1
        slideShow()
        pageControl.currentPage -= 1
    }
    
    @IBAction private func rightButtonTouchUpInside(_ sender: UIButton) {
        numberImage += 1
        slideShow()
        pageControl.currentPage += 1
    }
}

// MARK: - Extension UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSoure
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberRowInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as? HomeCell else { return UITableViewCell() }
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.title = viewModel.getNameCafe(at: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberRowInSection(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.viewmodel2 = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2 - 5, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.title = viewModel.getNameCafe(at: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
}
