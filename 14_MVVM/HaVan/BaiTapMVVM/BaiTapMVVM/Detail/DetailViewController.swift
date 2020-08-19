//
//  DetailViewController.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/17/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit
import MapKit

final class DetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Propeties
    var viewModelDetail: DetailViewModel? {
        didSet {
            configNavigationController()
        }
    }
    private var timer: Timer = Timer()
    private var rightButton = UIBarButtonItem()
    private var count = 0
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        configTableView()
        firstState()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    // MARK: - Private functions
    private func configTableView() {
        let nib = UINib(nibName: "CommentCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "CommentTableViewCell")
        let labelCell = UINib(nibName: "DescriptionTableViewCell", bundle: Bundle.main)
        tableView.register(labelCell, forCellReuseIdentifier: "DescriptionTableViewCell")
        let mapCell = UINib(nibName: "MapTableViewCell", bundle: Bundle.main)
        tableView.register(mapCell, forCellReuseIdentifier: "MapTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configNavigationController() {
        title = viewModelDetail?.nameCoffee
        let backButton = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(backToHome))
        backButton.tintColor = #colorLiteral(red: 0.9710486531, green: 0.4711424708, blue: 0.4447130859, alpha: 1)
        backButton.titleTextAttributes(for: .focused)
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func configCollectionView() {
        let nib = UINib(nibName: "SlideCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "SlideCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { (timer) in
            guard let max = self.viewModelDetail?.numberOfItemsInSection() else { return }
            if self.count >= max {
                self.count = 0
            }
            self.collectionView.scrollToItem(at: IndexPath(item: self.count, section: 0), at: .right, animated: true)
            self.pageControl.currentPage = self.count
            self.count += 1
        }
    }
    
    // MARK: - Objc functions
    @objc private func firstState() {
        guard let fav = viewModelDetail?.favorite else { return }
        if fav {
            rightButton = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .plain, target: self, action: #selector(secondState))
        } else {
            rightButton = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(secondState))
        }
        rightButton.tintColor = #colorLiteral(red: 0.9710486531, green: 0.4711424708, blue: 0.4447130859, alpha: 1)
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc private func secondState() {
        guard let fav = viewModelDetail?.favorite else { return }
        if !fav {
            rightButton = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .plain, target: self, action: #selector(firstState))
        } else {
            rightButton = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(firstState))
        }
        rightButton.tintColor = #colorLiteral(red: 0.9710486531, green: 0.4711424708, blue: 0.4447130859, alpha: 1)
        viewModelDetail?.chaneState(fav: !fav)
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc private func backToHome() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension DetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 8, height: collectionView.bounds.height - 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
}

// MARK: - UICollectionViewDataSource
extension DetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModelDetail?.numberOfItemsInSection() ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideCell", for: indexPath) as? SlideCell else { return UICollectionViewCell() }
        cell.viewModel = viewModelDetail?.getImageCell(atIndexPath: indexPath)
        return cell
    }
}

// MARK: - UITableViewDataSource
extension DetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModelDetail?.numberOfSection() ?? 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelDetail?.numberOfRowInSection(section: section) ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = viewModelDetail?.chooseSectionType(section: indexPath.section)
        switch sectionType {
        case .description:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as? DescriptionTableViewCell else {
                return UITableViewCell()
            }
            cell.viewModel = viewModelDetail?.getDescriptionCell(atIndexPath: indexPath)
            return cell
        case .mapView:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MapTableViewCell", for: indexPath) as? MapTableViewCell else {
                return UITableViewCell()
            }
            cell.viewModel = viewModelDetail?.getMapViewCell(atIndexPath: indexPath)
            return cell
        case .comment:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? CommentCell else {
                return UITableViewCell()
            }
            cell.viewModel = viewModelDetail?.getCommentViewCell(atIndexPath: indexPath)
            return cell
        case .none:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

extension DetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        switch section {
        case 0:
            return UITableView.automaticDimension
        case 1:
            return 200
        case 2:
            return 150
        default:
            return 50
        }
    }
}
