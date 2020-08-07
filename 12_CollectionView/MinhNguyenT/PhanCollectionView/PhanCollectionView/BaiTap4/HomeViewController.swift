//
//  HomeViewController.swift
//  PhanCollectionView
//
//  Created by MacBook Pro on 8/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - @IBOutlets
    @IBOutlet private weak var table: UITableView!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Peroperties
    var datas: [Data] = []
    var dataHeader: [String] = []
    var position: Int = 0
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
        configTable()
        configCollection()
        updateDataHeader()
    }
    
    // MARK: - Private functions
    private func updateData() {
        for i in 1..<10 {
            datas.append(Data(text: "Hinh\(i)", imageName: "h\(i)"))
        }
    }
    
    private func updateDataHeader() {
        for i in 1..<10 {
            dataHeader.append("h\(i)")
        }
    }
    
    private func configTable() {
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        table.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        table.dataSource = self
        table.delegate = self
    }
    
    private func configCollection() {
        let nib = UINib(nibName: "HeaderCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "HeaderCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: - @IBActions
    @IBAction func backButtonTouchUpInside(_ sender: UIButton) {
        guard position >= 1 else { return }
        position -= 1
        collectionView.scrollToItem(at: IndexPath(item: position, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        if position >= dataHeader.count - 1 {
            position = dataHeader.count - 1
        } else {
            position += 1
        }
        collectionView.scrollToItem(at: IndexPath(item: position, section: 0), at: .centeredHorizontally, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource , UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.backgroundColor = #colorLiteral(red: 0.7808972001, green: 0.9926757216, blue: 1, alpha: 1)
        cell.updateCollectionCell(datas: datas)
        cell.configCollectionCell()
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "#Tag \(section + 1)"
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataHeader.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCollectionViewCell", for: indexPath) as! HeaderCollectionViewCell
        cell.headerImage(image: dataHeader[indexPath.row])
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
