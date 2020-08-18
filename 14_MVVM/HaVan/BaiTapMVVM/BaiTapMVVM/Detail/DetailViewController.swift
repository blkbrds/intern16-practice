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
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Propeties
    var viewModelDetail: DetailViewModel? {
        didSet {
            setTitle()
        }
    }
    var rightButton = UIBarButtonItem()
    var viewModelComment: CommentViewModel?
    var viewModelSlideDetail: SlideDetailViewModel?
    private var count = 0
    private var countDetail = 0
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        configTableView()
        updateDetailImageAndLocation()
        firstState()
    }
    
    // MARK: - Private functions
    private func configTableView() {
        let nib = UINib(nibName: "CommentCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "CommentTableViewCell")
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
    }
    
    private func updateDetailImageAndLocation() {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { (timer) in
            self.countDetail += 1
            guard let max = self.viewModelDetail?.numberOfImgage() else { return }
            if self.countDetail >= max {
                self.countDetail = 0
            }
            self.descriptionLabel.text = self.viewModelDetail?.imageDetail[self.countDetail]
        }
        guard let location = viewModelDetail?.location else { return }
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        guard let nameCoffee = viewModelDetail?.nameCoffee else { return }
        annotation.title = "\(nameCoffee)"
        annotation.subtitle = "subtitle 0001"
        mapView.addAnnotation(annotation)
        mapView.setCenter(location, animated: true)
    }
    
    private func setTitle() {
        title = viewModelDetail?.nameCoffee
    }
    
    private func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "SlideCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "SlideCell")
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { (timer) in
            self.count += 1
            guard let max = self.viewModelSlideDetail?.numberOfItemsInSection() else { return }
            if self.count >= max {
                self.count = 0
            }
            self.collectionView.scrollToItem(at: IndexPath(item: self.count, section: 0), at: .right, animated: true)
            self.pageControl.currentPage = self.count
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
        rightButton.tintColor = #colorLiteral(red: 0.9103992581, green: 0.4987511039, blue: 0.4610315561, alpha: 1)
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc private func secondState() {
        guard let fav = viewModelDetail?.favorite else { return }
        if !fav {
            rightButton = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .plain, target: self, action: #selector(firstState))
        } else {
            rightButton = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(firstState))
        }
        rightButton.tintColor = #colorLiteral(red: 0.9103992581, green: 0.4987511039, blue: 0.4610315561, alpha: 1)
        viewModelDetail?.chaneState(fav: !fav)
        navigationItem.rightBarButtonItem = rightButton
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
        return viewModelSlideDetail?.numberOfItemsInSection() ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideCell", for: indexPath) as? SlideCell else { return UICollectionViewCell() }
        cell.viewModel = viewModelSlideDetail?.getImageCell(atIndexPath: indexPath)
        return cell
        
    }
}

// MARK: - UITableViewDataSource
extension DetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelComment?.numberOfRowInSection() ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? CommentCell else {
            return UITableViewCell()
        }
        cell.viewModel = viewModelComment?.getCommentViewCell(atIndexPath: indexPath)
        return cell
    }
}
