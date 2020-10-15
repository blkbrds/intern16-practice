//
//  Baitap4ViewController.swift
//  Baitap10Protocol
//
//  Created by MBA0245P on 10/15/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap4ViewController: UIViewController {
    
    let data = ProvinceList()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var dataTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTextView.isEditable = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        listData(list: data.provinceList)
    }
    
    func listData(list: [String]) {
        dataTextView.text?.removeAll()
        for province in list {
            dataTextView.text += "- \(province)\n"
        }
    }

    @IBAction func cancelButtonTouchUpInside(_ sender: UIButton) {
        searchBar.resignFirstResponder()
        searchBar.text?.removeAll()
        listData(list: data.provinceList)
    }
}

extension Baitap4ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty || searchText.trimmingCharacters(in: .whitespaces) == "" {
            listData(list: data.provinceList)
        } else {
            var newData : [String] = []
            for province in data.provinceList {
                let provinceLower = province.lowercased()
                let searchValueLower = searchText.lowercased()
                if provinceLower.contains(searchValueLower) {
                    newData.append(province)
                }
            }
            listData(list: newData)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text?.removeAll()
        listData(list: data.provinceList)
    }
}
