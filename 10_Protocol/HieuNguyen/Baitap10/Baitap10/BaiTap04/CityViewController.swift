//
//  CityViewController.swift
//  Baitap10
//
//  Created by hieungq on 7/12/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

final class CityViewController: UIViewController {

    private var data: [String] = ["An Giang", "Bà Rịa-Vũng Tàu", "Bạc Liêu", "Bắc Kạn", "Bắc Giang", "Bắc Ninh", "Bến Tre", "Bình Dương", "Bình Định", "Bình Phước", "Bình Thuận", "Cà Mau", "Cao Bằng", "Cần Thơ (TP)", "Đà Nẵng (TP)", "Đắk Lắk", "Điện Biên", "Đồng Nai", "Đồng Tháp", "Gia Lai", "Hà Giang", "Hà Nam", "Hà Nội (TP)"]
    @IBOutlet private weak var listCityTextView: UITextView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        fillData(data: data)
    }
    
    @IBAction private func cancelButton(_ sender: Any) {
        fillData(data: data)
        searchBar.text = ""
    }
    
    private func fillData(data: [String]) {
        var listCity:String = ""
        for city in data {
            listCity += "- \(city) \n"
        }
        listCityTextView.text = listCity
    }
    
}

extension CityViewController: UITextFieldDelegate, UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let dataTemp:[String] = data.filter{ $0.contains(searchText)}
        if dataTemp.count == 0 {
            if searchText == "" {
                fillData(data: data)
            } else {
                fillData(data: dataTemp)
            }
        } else {
            fillData(data: dataTemp)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        fillData(data: data)
        searchBar.text = ""
    }    
}
