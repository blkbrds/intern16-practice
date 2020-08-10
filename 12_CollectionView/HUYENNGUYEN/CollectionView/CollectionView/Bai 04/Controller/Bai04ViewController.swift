//
//  Bai04ViewController.swift
//  CollectionView
//
//  Created by bu on 8/6/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class Bai04ViewController: UIViewController {

    //MARK: - Property
    private let numbers: [[Int]] = [Array(0...5), Array(0...6), Array(0...7), Array(0...8), Array(0...9)]
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
    //MARK: - Function
    private func configCollectionView() {
        let sliderNib = UINib(nibName: "SliderTableViewCell", bundle: Bundle.main)
        tableView.register(sliderNib, forCellReuseIdentifier: "sliderCell")

        let mainNib = UINib(nibName: "MainTableViewCell", bundle: Bundle.main)
        tableView.register(mainNib, forCellReuseIdentifier: "mainCell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

//MARK: - Extension
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
