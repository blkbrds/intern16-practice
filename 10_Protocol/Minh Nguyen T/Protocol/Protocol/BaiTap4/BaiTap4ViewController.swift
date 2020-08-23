//
//  BaiTap4ViewController.swift
//  Protocol
//
//  Created by MacBook Pro on 7/25/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap4ViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var valueTextView: UITextView!
    
    // MARK: Properties
    private var dataList: [String] = ["An Giang",
                                      "Bà Rịa - Vũng Tàu",
                                      "Bắc Giang",
                                      "Bắc Kạn",
                                      "Bạc Liêu",
                                      "Bắc Ninh",
                                      "Bến Tre",
                                      "Bình Định",
                                      "Bình Dương",
                                      "Bình Phước",
                                      "Bình Thuận",
                                      "Cà Mau",
                                      "Cao Bằng",
                                      "Cần Thơ",
                                      "Đà Nẵng",
                                      "Đắk Lắk",
                                      "Đắk Nông",
                                      "Điện Biên",
                                      "Đồng Nai",
                                      "Đồng Tháp",
                                      "Gia Lai",
                                      "Hà Giang",
                                      "Hà Nam",
                                      "Hà Tĩnh",
                                      "Hải Phòng",
                                      "Hà Nội",
                                      "Hải Dương",
                                      "Hậu Giang",
                                      "Hòa Bình",
                                      "Hưng Yên",
                                      "Khánh Hòa",
                                      "Kiên Giang",
                                      "Kon Tum",
                                      "Lai Châu",
                                      "Lâm Đồng",
                                      "Lạng Sơn",
                                      "Lào Cai",
                                      "Long An",
                                      "Nam Định",
                                      "Nghệ An",
                                      "Ninh Bình",
                                      "Ninh Thuận",
                                      "Phú Thọ",
                                      "Quảng Bình",
                                      "Quảng Nam",
                                      "Quảng Ngãi",
                                      "Quảng Ninh",
                                      "Quảng Trị",
                                      "Sóc Trăng",
                                      "Sơn La",
                                      "TP HCM",
                                      "Tây Ninh",
                                      "Thái Bình",
                                      "Thái Nguyên",
                                      "Thanh Hóa",
                                      "Thừa Thiên Huế",
                                      "Tiền Giang",
                                      "Trà Vinh",
                                      "Tuyên Quang",
                                      "Vĩnh Long",
                                      "Vĩnh Phúc",
                                      "Yên Bái",
                                      "Phú Yên"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        getData(data: dataList)
    }
    
    // MARK: - Private funtions
    private func getData(data: [String]) {
        var provine: String = ""
        for item in data {
            provine += "-  \(item) \n"
        }
        valueTextView.text = provine
    }
    
    // MARK: - IBActions
    @IBAction private func cancelButtonTouchUpInside(_ sender: UIButton) {
        searchBar.text = ""
        getData(data: dataList)
    }
}

extension BaiTap4ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let newList: [String] = dataList.filter{$0.contains(searchText)}
        if newList.count == 0 {
            if searchText == "" {
                getData(data: dataList)
            } else {
                getData(data: newList)
            }
        } else {
            getData(data: newList)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
