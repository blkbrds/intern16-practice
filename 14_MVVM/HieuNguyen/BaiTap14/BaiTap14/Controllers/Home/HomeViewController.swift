//
//  HomeViewController.swift
//  BaiTap13
//
//  Created by PCI0020 on 7/16/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    enum ScrollDirection {
        case up
        case down
        var ty: CGFloat {
            switch self {
                case .up: return -500
                case .down: return 500
            }
        }
    }
    
    private let viewModel = HomeViewModel()
    private var changeButton = UIBarButtonItem()
    private var lastContentOffset: CGFloat = 0
    private var scrollDirection: ScrollDirection = .up
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        viewModel.getData()
        changeButton.tag = 1
        changeViewType()
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "HomeTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        let headerView = Bundle.main.loadNibNamed("HomeSlideView", owner: self, options: nil)?[0] as! HomeSlideView
         headerView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 250)
         self.tableView.tableHeaderView = headerView
    }
    
    private func setupCollectionView() {
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        let homeSlideViewNib = UINib(nibName: "HomeSlideView", bundle: Bundle.main)
        collectionView.register(homeSlideViewNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeSlideView")
    }
    
    @objc private func changeViewType() {
        if changeButton.tag == 1 {
            changeButton = UIBarButtonItem(image: UIImage(systemName: "square.grid.2x2.fill"), style: .plain, target: self, action: #selector(changeViewType))
            navigationItem.rightBarButtonItem = changeButton
            setupCollectionView()
            tableView.isHidden = true
            collectionView.isHidden = false
            collectionView.reloadData()
            changeButton.tag = 2
        } else {
            changeButton = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(changeViewType))
            navigationItem.rightBarButtonItem = changeButton
            setupTableView()
            tableView.isHidden = false
            collectionView.isHidden = true
            tableView.reloadData()
            changeButton.tag = 1
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coffeeShops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        cell.viewModel = viewModel.viewModelForItem(indexPath: indexPath)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, scrollDirection.ty, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.5
        UIView.animate(withDuration: 0.5) {
          cell.layer.transform = CATransform3DIdentity
          cell.alpha = 1.0
        }
    }  
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            tableView.beginUpdates()
            tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: indexPath.section)], with: .right)
            self.viewModel.removeCell(indexPath: indexPath)
            tableView.endUpdates()
        }
        delete.backgroundColor = UIColor.red

        let insert = UITableViewRowAction(style: .default, title: "Insert") { (action, indexPath) in
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: indexPath.row + 1, section: indexPath.section)], with: .left)
            self.viewModel.insertCell(indexPath: indexPath)
            tableView.endUpdates()
        }
        insert.backgroundColor = UIColor.green

        return [delete, insert]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let homeDetailViewController = HomeDetailViewController()
        homeDetailViewController.viewModel = viewModel.detailViewModelForItem(indexPath: indexPath)
        navigationController?.pushViewController(homeDetailViewController, animated: true)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.coffeeShops.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        cell.viewModel = viewModel.viewModelForItem(indexPath: indexPath)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2 - 16, height: UIScreen.main.bounds.width * 60 / 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeSlideView", for: indexPath) as! HomeSlideView
            headerView.frame = CGRect(x: 0, y: 0, width: collectionView.frame.width, height: 250)
            return headerView
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 250)
    }
    // delegate
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, scrollDirection.ty, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.5
        UIView.animate(withDuration: 0.5) {
          cell.layer.transform = CATransform3DIdentity
          cell.alpha = 1.0
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
      if lastContentOffset > scrollView.contentOffset.y {
        // move up
        scrollDirection = .up
      }
      else if (lastContentOffset < scrollView.contentOffset.y) {
        // move down
        scrollDirection = .down
      }
      // update the new position acquired
      lastContentOffset = scrollView.contentOffset.y
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let homeDetailViewController = HomeDetailViewController()
        homeDetailViewController.viewModel = viewModel.detailViewModelForItem(indexPath: indexPath)
        navigationController?.pushViewController(homeDetailViewController, animated: true)
    }
}

extension HomeViewController: HomeTableViewCellDelegate {
    func likeCell(cell: HomeTableViewCell, isLike: Bool) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        viewModel.changeLike(at: indexPath.row, isLike: isLike) {
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}

extension HomeViewController: HomeCollectionViewCellDelegate {
    func likeCell(cell: HomeCollectionViewCell, isLike: Bool) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        viewModel.changeLike(at: indexPath.row, isLike: isLike) {
            collectionView.reloadItems(at: [indexPath])
        }
    }
    
    
}

