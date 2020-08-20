//
//  HomeDetailViewController.swift
//  PhanMVVM
//
//  Created by MacBook Pro on 8/19/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class HomeDetailViewController: UIViewController {
    
    // MARK: - @IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: DetailViewModel? = DetailViewModel() {
        didSet {
            updateDetail()
        }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSlider()
        configTable()
    }
    
    // MARK: - Private functions
    private func updateDetail() {
        guard let data = viewModel?.data else { return }
        navigationItem.title = data.titleName
    }
    
    private func updateSlider() {
        guard let slider = Bundle.main.loadNibNamed("SliderCollectionReusableView", owner: self, options: nil)?[0] as? SliderCollectionReusableView else { return }
        slider.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 200)
        tableView.tableHeaderView = slider
    }
    
    private func configTable() {
        let des = UINib(nibName: "IntroductionTableViewCell", bundle: .main)
        tableView.register(des, forCellReuseIdentifier: "IntroductionTableViewCell")
        let comment = UINib(nibName: "CommentTableViewCell", bundle: .main)
        tableView.register(comment, forCellReuseIdentifier: "CommentTableViewCell")
        let map = UINib(nibName: "MapTableViewCell", bundle: .main)
        tableView.register(map, forCellReuseIdentifier: "MapTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension HomeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection(section: section) ?? 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections() ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = viewModel?.sectionType(section: indexPath.section)
        switch sectionType {
        case .description:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "IntroductionTableViewCell", for: indexPath) as? IntroductionTableViewCell else { return UITableViewCell() }
            cell.viewModel = viewModel?.getDescription(indexPath: indexPath)
            return cell
        case .map:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MapTableViewCell", for: indexPath) as? MapTableViewCell else { return UITableViewCell() }
            return cell
        case .comment:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? CommentTableViewCell else {return UITableViewCell() }
            cell.viewModel = viewModel?.getComment(indexPath: indexPath)
            return cell
        case .none:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        switch section {
        case 0:
            return UITableView.automaticDimension
        case 1:
            return 200
        case 2:
            return UITableView.automaticDimension
        default:
            return UITableView.automaticDimension
        }
    }
}
