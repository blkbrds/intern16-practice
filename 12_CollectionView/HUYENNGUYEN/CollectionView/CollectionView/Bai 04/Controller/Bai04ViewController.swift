//
//  Bai04ViewController.swift
//  CollectionView
//
//  Created by bu on 8/6/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class Bai04ViewController: UIViewController {

    private let numbers: [[Int]] = [Array(0...5), Array(0...6), Array(0...7), Array(0...8), Array(0...9)]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
    private func configCollectionView() {
        let sliderNib = UINib(nibName: "SliderTableViewCell", bundle: Bundle.main)
        tableView.register(sliderNib, forCellReuseIdentifier: "sliderCell")

        let mainNib = UINib(nibName: "MainTableViewCell", bundle: Bundle.main)
        tableView.register(mainNib, forCellReuseIdentifier: "mainCell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension Bai04ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        }
        return "#Tag \(section)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sliderCell", for: indexPath) as? SliderTableViewCell else {
                    return SliderTableViewCell()
                }
            cell.numbersOfSlider = numbers[0]
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as? MainTableViewCell else {
                    return MainTableViewCell()
                }
            cell.numbersOfMain = numbers[indexPath.section]
            return cell
        }
    }
}

//extension Bai04ViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: scrollCollectionView.frame.width / 2.5, height: scrollCollectionView.frame.width / 2)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScrollCollectionViewCell", for: indexPath) as? ScrollCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//        cell.backgroundColor = #colorLiteral(red: 0.9433692893, green: 0.7936577309, blue: 0.7139778097, alpha: 1)
//        return cell
//    }
//}
