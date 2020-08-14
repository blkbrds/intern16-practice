//
//  BaiTap4ViewController.swift
//  BaiTapCollectionView
//
//  Created by NganHa on 8/5/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap4ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var slideView: UIView!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configSlideView()
    }
    
    // MARK: - Private functions
    private func configTableView() {
        let nib = UINib(nibName: "CustomTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "reusableCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configSlideView() {
        guard let slide = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as? SlideView else { return }
        // when we set slide.frame = slideView.frame, the Y origin slide be down a little bit (about 50)
        slide.frame = CGRect(x: 0, y: 0, width: slideView.bounds.width, height: slideView.bounds.height)
        slideView.addSubview(slide)
    }
}

// MARK: - UITableViewDataSource
extension BaiTap4ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as? CustomTableViewCell else { fatalError("Can't load CustomTableViewCell") }
        cell.backgroundColor = .lightGray
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "#Tag \(section + 1)"
    }
}

// MARK: - UITableViewDelegate
extension BaiTap4ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
