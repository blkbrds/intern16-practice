//
//  HomeViewController.swift
//  TabbarController
//
//  Created by Abcd on 8/11/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{
    
    //MARK: - IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    var postion: Int?
    var viewModel = HomeViewModel()
    var count = 0
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        configTableView()
        configCollectionView()
        tableViewType()
        setupSlide()
    }
    
    //MARK: - Function
    func configTableView(){
        let nib = UINib(nibName: "HomeTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configCollectionView() {
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupSlide() {
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(viewModel.images.count), height: 300)
        for index in 0 ..< viewModel.images.count {
            let imageView = UIImageView(image: UIImage(named: viewModel.images[index]))
            imageView.frame = CGRect(x: view.frame.width * CGFloat(index), y: 0, width: view.frame.width, height: 300)
            scrollView.addSubview(imageView)
        }
    }
    
    //MARK: -IBAction
    @IBAction func forwardImage(_ sender: Any) {
        if count < viewModel.images.count - 1 {
            count += 1
        UIView.animate(withDuration: 1, animations: {
            self.scrollView.contentOffset =
                CGPoint(x: CGFloat(self.count) * self.view.frame.width, y: 0)
        })
        }
    }
    @IBAction func backImage(_ sender: Any) {
        if count > 0 {
            count -= 1
            UIView.animate(withDuration: 1, animations: {
                self.scrollView.contentOffset =
                    CGPoint(x: CGFloat(self.count) * self.view.frame.width, y: 0)
            })
        }
    }
    // MARK: - Objc functions
    @objc private func collectionViewType() {
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .plain, target: self, action: #selector(tableViewType))
        rightItem.tintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        navigationItem.rightBarButtonItem = rightItem
        tableView.isHidden = true
        collectionView.isHidden = false
    }
    
    @objc private func tableViewType() {
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.grid.2x2.fill"), style: .plain, target: self, action: #selector(collectionViewType))
        rightItem.tintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        navigationItem.rightBarButtonItem = rightItem
        tableView.isHidden = false
        collectionView.isHidden = true
    }
}

//MARK: - Extension
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coffeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.viewModel = viewModel.getHomeCellViewModel(at: indexPath)
        cell.postion = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.title = viewModel.datas[indexPath.row].name
        detailVC.isFavorite = viewModel.datas[indexPath.row].favorite
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

    extension HomeViewController: HomeTableViewCellDelegate {
        func view(view: HomeTableViewCell, needsPerform action: HomeTableViewCell.Action) {
            switch action {
            case .favoriteAction(postion: let postion, value: let favorite):
                viewModel.changeState(postion: postion, favorite: favorite)
                collectionView.reloadData()
                tableView.reloadData()
            }
        }
    }

extension HomeViewController:  UICollectionViewDelegate, UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.coffeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.viewModel = viewModel.getHomeCellViewModel(at: indexPath)
        cell.position = indexPath.row
        cell.delegate = self
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.bounds.width / 2 - 10, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detaiVC = DetailViewController()
        detaiVC.title = viewModel.datas[indexPath.row].name
        detaiVC.isFavorite = viewModel.datas[indexPath.row].favorite
        navigationController?.pushViewController(detaiVC, animated: true)
    }
}
// MARK: - HomeCollectionViewCellDelegate
extension HomeViewController: HomeCollectionViewCellDelegate {
    
    func view(view: HomeCollectionViewCell, needsPerfom action: HomeCollectionViewCell.Action) {
        switch action {
        case .favoriteChange(position: let position, value: let fav):
            viewModel.changeState(postion: position, favorite: fav)
            collectionView.reloadData()
            tableView.reloadData()
        }
    }
}
