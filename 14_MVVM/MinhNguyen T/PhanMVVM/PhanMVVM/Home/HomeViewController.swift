//
//  HomeViewController.swift
//  PhanMVVM
//
//  Created by MacBook Pro on 8/13/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - @IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Peroperties
    private var viewmodel = HomeViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel.getMyData()
        configNavi()
    }
    
    // MARK: - Private functions
    private func configNavi() {
        navigationItem.title = "Home"
        turnonTable()
    }
    
    private func configCollection() {
        let nib = UINib(nibName: "HomeDetailCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeDetailCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let slider = UINib(nibName: "SliderCollectionReusableView", bundle: .main)
        collectionView.register(slider, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SliderCollectionReusableView")
    }
    
    private func configTable() {
        let nib = UINib(nibName: "HomeDetailTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "HomeDetailTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        guard let slider = Bundle.main.loadNibNamed("SliderCollectionReusableView", owner: self, options: nil)?[0] as? SliderCollectionReusableView else { return }
        slider.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 200)
        tableView.tableHeaderView = slider
    }
    
    // MARK: - Objc functions
    @objc func turnonTable() {
        let tableButton = UIBarButtonItem(image: UIImage(systemName: "square.grid.2x2.fill"), style: .done, target: self, action: #selector(turnonSellection))
        navigationItem.rightBarButtonItem = tableButton
        configTable()
        tableView.reloadData()
        tableView.isHidden = false
        collectionView.isHidden = true
    }
    
    @objc func turnonSellection() {
        let collectionButton = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .done, target: self, action: #selector(turnonTable))
        navigationItem.rightBarButtonItem = collectionButton
        configCollection()
        collectionView.reloadData()
        collectionView.isHidden = false
        tableView.isHidden = true
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel.myData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeDetailCollectionViewCell", for: indexPath) as? HomeDetailCollectionViewCell else { return UICollectionViewCell() }
        cell.viewModel = viewmodel.getHomeTableCellModel(atIndexPath: indexPath)
        cell.index = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 20, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SliderCollectionReusableView", for: indexPath) as? SliderCollectionReusableView else { return UICollectionReusableView() }
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = HomeDetailViewController()
        vc.viewModel = viewmodel.detailView(indexPath: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let rotaiontranform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotaiontranform
        UIView.animate(withDuration: 1.5) {
            cell.layer.transform = CATransform3DIdentity
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeDetailTableViewCell", for: indexPath) as? HomeDetailTableViewCell else { return UITableViewCell() }
        cell.viewModel = viewmodel.getHomeTableCellModel(atIndexPath: indexPath)
        cell.index = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = HomeDetailViewController()
        vc.viewModel = viewmodel.detailView(indexPath: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotaiontranform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotaiontranform
        UIView.animate(withDuration: 1.5) {
            cell.layer.transform = CATransform3DIdentity
        }
    }
}

// MARK: - HomeDetailCollectionViewCellDelegate
extension HomeViewController: HomeDetailCollectionViewCellDelegate {
    func changeLikeButton(_ view: HomeDetailCollectionViewCell, neadsPerform action: HomeDetailCollectionViewCell.Action) {
        switch action {
        case .changeLike(index: let index, islike: let islike):
            viewmodel.changeLikeButton(index: index, islike: !islike)
            collectionView.reloadData()
            tableView.reloadData()
        }
    }
}

// MARK: - HomeDetailTableViewCellDelegate
extension HomeViewController: HomeDetailTableViewCellDelegate {
    func changeLikeButton(_ view: HomeDetailTableViewCell, neadsPerform action: HomeDetailTableViewCell.Action) {
        switch action {
        case .changeLike(index: let index, islike: let islike):
            viewmodel.changeLikeButton(index: index, islike: !islike)
            tableView.reloadData()
            collectionView.reloadData()
        }
    }
}
