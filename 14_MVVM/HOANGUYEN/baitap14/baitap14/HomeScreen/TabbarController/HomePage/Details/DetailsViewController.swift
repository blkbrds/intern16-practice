//
//  DetailsViewController.swift
//  baitap14
//
//  Created by NXH on 8/14/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit
import MapKit

final class DetailsViewController: UIViewController {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var detailsCollectionView: UICollectionView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - Properties
    var viewModelCollectionView: DetailsCollectionViewViewModel = DetailsCollectionViewViewModel()
    var viewModel: DetailsViewModel?
    private var height: CGFloat = 0
    private var timer: Timer = Timer()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavi()
        configMapView()
        configCommentTableView()
        configDetailsCollectionView()
        randomCellCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        commentTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        commentTableView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    // MARK: - override func
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let obj = object as? UITableView {
            if obj == self.commentTableView && keyPath == "contentSize" {
                tableViewHeightConstraint.constant = obj.contentSize.height + 10
            }
        }
    }
    
    // MARK: - Private Func
    private func configDetailsCollectionView() {
        detailsCollectionView.dataSource = self
        detailsCollectionView.delegate = self
        let nib = UINib(nibName: "DetailsCollectionViewCell", bundle: .main)
        detailsCollectionView.register(nib, forCellWithReuseIdentifier: "detailsCollectionViewCell")
        guard let images = viewModel else {
            return
        }
        pageControl.numberOfPages = images.getNumberImages()
    }
    
    private func configCommentTableView() {
        let nib = UINib(nibName: "CommentTableViewCell", bundle: .main)
        commentTableView.register(nib, forCellReuseIdentifier: "commentTableViewCell")
        commentTableView.dataSource = self
        commentTableView.delegate = self
    }
    
    private func configMapView() {
        let annotation = MKPointAnnotation()
        let latitude = viewModel?.coffeeShop.coordinate.latitude ?? 0
        let longitude = viewModel?.coffeeShop.coordinate.longitude ?? 0
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        map.addAnnotation(annotation)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        map.region = MKCoordinateRegion(center: annotation.coordinate, span: span)
    }
    
    private func configNavi() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icons8-star-50"), style: .plain, target: self, action: #selector(tapFavoritesButton))
        guard let text = viewModel?.coffeeShop.name else {
            return
        }
        title = text
        if  HomeViewModel.viewModel.settupFavoritesButton(text: text) {
            navigationItem.rightBarButtonItem?.tintColor = .yellow
        } else {
            navigationItem.rightBarButtonItem?.tintColor = .lightGray
        }
    }
    
    private func randomCellCollectionView() {
        var index: IndexPath = IndexPath(row: 0, section: 0)
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (time) in
            if index.row < 4 {
                index.row += 1
            } else {
                index.row = 0
            }
            self.pageControl.currentPage = index.row
            self.detailsCollectionView.scrollToItem(at: index, at: .right, animated: true)
        }
    }
    
    // MARK: - objc func
    @objc func tapFavoritesButton() {
        guard let text = title else {
            return
        }
        if navigationItem.rightBarButtonItem?.tintColor == .yellow {
            navigationItem.rightBarButtonItem?.tintColor = .lightGray
        } else {
            navigationItem.rightBarButtonItem?.tintColor = .yellow
        }
        
        for (index, value) in HomeViewModel.viewModel.listCoffeeShop.enumerated() {
            if value.name == text {
                if HomeViewModel.viewModel.listCoffeeShop[index].favorties == false {
                    HomeViewModel.viewModel.listCoffeeShop[index].favorties = true
                } else {
                    HomeViewModel.viewModel.listCoffeeShop[index].favorties = false
                }
            }
        }
    }
}

extension DetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.coffeeShop.comment?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = commentTableView.dequeueReusableCell(withIdentifier: "commentTableViewCell", for: indexPath) as? CommentTableViewCell else { return UITableViewCell() }
        cell.viewModel = viewModel?.getCell(atIndexPath: indexPath)?.cellViewModel
        return cell
    }
}

// MARK: - extension: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModelCollectionView.numberOfItems(inSection: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = detailsCollectionView.dequeueReusableCell(withReuseIdentifier: "detailsCollectionViewCell", for: indexPath) as? DetailsCollectionViewCell else { return UICollectionViewCell() }
        cell.viewModel = viewModelCollectionView.getImageCollectionViewCell(atIndexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = detailsCollectionView.frame.height
        let width: CGFloat = detailsCollectionView.frame.width
        return CGSize(width: width, height: height)
    }
}
