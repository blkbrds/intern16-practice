//
//  BaiTap4ViewController.swift
//  TableView
//
//  Created by MacBook Pro on 7/28/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class BaiTap4ViewController: UIViewController {
    
    @IBOutlet private weak var myTable: UITableView!
    private var arrData: [[String]] = [[]]
    private var arrFood: [String] = []
    private var arrAnimal: [String] = []
    private var arrHome: [String] = []
    private var titleSection: [String] = ["F","A","I"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    func configTableView() {
        title = "SECTIONS"
        let nib = UINib(nibName: "CusTomUITableViewCell", bundle: .main)
        getData()
        //myTable.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        myTable.register(nib, forCellReuseIdentifier: "cell")
        myTable.dataSource = self
        myTable.delegate = self
    }
    
    func getData() {
        if let path = Bundle.main.path(forResource: "ListData", ofType: "plist") {
            if let arr = NSArray(contentsOfFile: path) {
                for i in 0...arr.count - 1 {
                    if i < 2 {
                        arrFood.append(arr[i] as! String)
                    } else if i >= 2 && i <= 8 {
                        arrAnimal.append(arr[i] as! String)
                    } else {
                        arrHome.append(arr[i] as! String)
                    }
                }
                arrData = [arrFood,arrAnimal,arrHome]
            }
        }
    }
}

extension BaiTap4ViewController: UITableViewDataSource , UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //                cell.textLabel?.text = arrData[indexPath.section][indexPath.row]
        //                let label = ListNameLabel()
        //                label.frame = CGRect(x: 40, y: 70, width: 50, height: 20)
        //               cell.addSubview(label)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CusTomUITableViewCell
        cell.configCell(image: UIImage(named: "ga"), namelb: arrData[indexPath.section][indexPath.row], titlelb: "sub title", index: indexPath.row)
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Food"
        case 1: return "Animal"
        default:
            return "Items"
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return titleSection
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension BaiTap4ViewController: CusTomUITableViewCellDelegate {
    func getNameObject(_ controller: CusTomUITableViewCell, needsPerform action: CusTomUITableViewCell.Action) {
        switch action {
        case .getNameObject(nameObject: let nameObject, index: let index):
            print("\(nameObject)  : \(index)")
        }
    }
}
