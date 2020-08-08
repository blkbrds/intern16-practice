//
//  HomeViewController.swift
//  BaitapCollectionView
//
//  Created by PCI0001 on 8/6/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var flagImageView: UIImageView!
    @IBOutlet private weak var rightButton: UIButton!
    @IBOutlet private weak var leftButton: UIButton!
    
    // MARK: - Properties
    private var models = [Model]()
    private var imageNumber: Int = 0
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        createData()
    }
    
    // MARK: - Private methods
    private func createData() {
        models.append(Model(text: "Philippin", imageName: "i1"))
        models.append(Model(text: "Cuba", imageName: "i2"))
        models.append(Model(text: "Singapor", imageName: "i3"))
        models.append(Model(text: "Thailand", imageName: "i4"))
        models.append(Model(text: "USA", imageName: "i5"))
        models.append(Model(text: "Philippin", imageName: "i1"))
        models.append(Model(text: "Philippin", imageName: "i2"))
        models.append(Model(text: "Philippin", imageName: "i3"))
        models.append(Model(text: "Philippin", imageName: "i4"))
        models.append(Model(text: "Philippin", imageName: "i5"))
    }
    
    private func imageGallary() {
        switch imageNumber {
        case 1:
            leftButton.isEnabled = false
            flagImageView.image = UIImage(named: "i1")
        case 2:
            rightButton.isEnabled = true
            flagImageView.image = UIImage(named: "i2")
        case 3:
            rightButton.isEnabled = true
            flagImageView.image = UIImage(named: "i3")
        case 4:
            rightButton.isEnabled = true
            flagImageView.image = UIImage(named: "i4")
        default:
            rightButton.isEnabled = false
            leftButton.isEnabled = true
            flagImageView.image = UIImage(named: "i5")
        }
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "Bai4TableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "tableCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: IBActions
    @IBAction private func rightButtonTouchUpInSide(_sender: UIButton) {
        imageNumber += 1
        imageGallary()
    }
    
    @IBAction private func leftButtonTouchUpInSide(_sender: UIButton) {
        imageNumber -= 1
        imageGallary()
    }
}

// MARK: - Extension UITableViewDataSource, Delegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! Bai4TableViewCell
        cell.updateTableView(with: models)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Tag \(section + 1)"
    }
}
