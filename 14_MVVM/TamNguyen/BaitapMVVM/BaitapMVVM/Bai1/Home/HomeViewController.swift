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
    @IBOutlet private weak var cafeImageView: UIImageView!
    @IBOutlet private weak var leftButton: UIButton!
    @IBOutlet private weak var rightButton: UIButton!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    // MARK: - Properties
    private var numberImage: Int = 1

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configPageControl()
        configUI()
}
    
    // MARK: - Private methods
    private func configTableView() {
        title = "Home"
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "tableCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configPageControl() {
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
    }
    
    private func configUI() {
        let collectionButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-menu-50.png"), style: .plain, target: self, action: #selector(switchButtonTouchUpInside))
        navigationItem.rightBarButtonItem = collectionButton
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
    
    @objc private func switchButtonTouchUpInside() {
        let vc = Home2ViewController()
        navigationController?.pushViewController(vc, animated: true)
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

// MARK: - Extension UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as? HomeTableViewCell else { return HomeTableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
}
