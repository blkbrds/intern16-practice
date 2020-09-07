//
//  Bai4ViewController.swift
//  CollectionView
//
//  Created by Abcd on 8/7/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai4ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
   // MARK: - Properties
        private let datas: [[Int]] = [Array(0...5), Array(0...10), Array(0...14), Array(0...8), Array(0...6)]
        
        // MARK: - Override
        override func viewDidLoad() {
            super.viewDidLoad()
            let nib = UINib(nibName: "SliderTableViewCell", bundle: Bundle.main)
            tableView.register(nib, forCellReuseIdentifier: "SliderCell")
            let nib2 = UINib(nibName: "Bai4TableViewCell", bundle: Bundle.main)
            tableView.register(nib2, forCellReuseIdentifier: "TagCell")
            tableView.dataSource = self
            tableView.delegate = self
        }
    }

    // MARK: - UITableViewDataSource, UITableViewDelegate
    extension Bai4ViewController: UITableViewDataSource, UITableViewDelegate {
        func numberOfSections(in tableView: UITableView) -> Int {
            return datas.count
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            if section == 0 {
                return nil
            }
            return "#Tag \(section)"
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SliderCell", for: indexPath) as! SliderTableViewCell
                cell.dataSliders = datas[0]
                return cell
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "TagCell", for: indexPath) as! Bai4TableViewCell
            cell.dataTags = datas[indexPath.section]
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return indexPath.section == 0 ? 300 : 100
        }
    }

