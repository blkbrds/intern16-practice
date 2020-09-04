//
//  DetailViewController.swift
//  MVVM
//
//  Created by bu on 8/27/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit
import MapKit

final class DetailViewController: UIViewController {
    // MARK: - Struct
    struct Identifiers {
        static let sliderCell = "SliderCollectionViewCell"
        static let contentCell = "ContentTableViewCell"
        static let commentCell = "CommentTableViewCell"
        static let mapCell = "MapTableViewCell"
    }
    
    // MARK: - IBOutlet
    @IBOutlet private weak var sliderCollectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: -  Properties
    private var index = 0
    var viewModel: DetailViewModel?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        configPageControl()
        configTableView()
    }

    // MARK: - Function
    private func configCollectionView() {
        let sliderNib = UINib(nibName: Identifiers.sliderCell, bundle: Bundle.main)
        sliderCollectionView.register(sliderNib, forCellWithReuseIdentifier: Identifiers.sliderCell)
        sliderCollectionView.dataSource = self
        sliderCollectionView.delegate = self
    }

    private func configPageControl() {
        guard let viewModel = viewModel else { return }
        pageControl.numberOfPages = viewModel.information.imageNames.count
        pageControl.currentPage = index
    }

    private func configTableView() {
        let contentNib = UINib(nibName: Identifiers.contentCell, bundle: Bundle.main)
        tableView.register(contentNib, forCellReuseIdentifier: Identifiers.contentCell)

        let commentNib = UINib(nibName: Identifiers.commentCell, bundle: Bundle.main)
        tableView.register(commentNib, forCellReuseIdentifier: Identifiers.commentCell)

        let mapNib = UINib(nibName: Identifiers.mapCell, bundle: Bundle.main)
        tableView.register(mapNib, forCellReuseIdentifier: Identifiers.mapCell)

        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - Action
    @IBAction private func turnLeftButtonTouchUpInside(_ sender: UIButton) {
        if index > 0 {
            index -= 1
            sliderCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
            pageControl.currentPage = index
        } else {
            guard let viewModel = viewModel else { return }
            index = viewModel.information.imageNames.count
            sliderCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
            pageControl.currentPage = index
        }
    }

    @IBAction private func turnRightButtonTouchUpInside(_ sender: UIButton) {
        guard let viewModel = viewModel else { return }
        if index < viewModel.information.imageNames.count {
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

// MARK: - Extension UICollectionViewDataSource
extension DetailViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfItemsForCollection(inSection: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellSlide = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as? SliderCollectionViewCell else { return UICollectionViewCell() }
        return cellSlide
    }
}

// MARK: - Extension UICollectionViewDelegateFlowLayout
extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: kScreenWidth, height: 300)
    }
}

// MARK: - Extension UITableViewDataSource
extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfRows(inSection: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel, let type = DetailViewModel.Section(rawValue: indexPath.section) else { return UITableViewCell() }
        switch type {
        case .content:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.contentCell, for: indexPath) as? ContentTableViewCell else { return UITableViewCell() }
            cell.viewModel = viewModel.cellForItem(at: indexPath) as? ContentTableViewCellViewModel
            return cell
        case .map:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.mapCell, for: indexPath) as? MapTableViewCell else { return UITableViewCell() }
            return cell
        case .comment:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.commentCell, for: indexPath) as? CommentTableViewCell else { return UITableViewCell() }
            cell.viewModel = viewModel.cellForItem(at: indexPath) as? CommentTableViewCellViewModel
            return cell
        }
    }
}

// MARK: - Extension UITableViewDelegate
extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let type = DetailViewModel.Section(rawValue: indexPath.section) else { return 0 }
        switch type {
        case .map:
            return 300
        default:
            return UITableView.automaticDimension
        }
    }
}
