//
//  SeachViewController.swift
//  BaiTapProtocol
//
//  Created by PCI0004 on 7/30/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class SeachViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var valueTextView: UITextView!

    // MARK: - Properties
    
    private var provinceList: [String] = ["An Giang",
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
        getData(list: provinceList)
    }

    // MARK: - Private Methods
    private func getData(list: [String]) {
        var province: String = ""
        for i in list {
            province += " - \(i) \n"
        }
        valueTextView.text = province
    }
}

extension SeachViewController: UISearchBarDelegate, UITextFieldDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let newList: [String] = provinceList.filter { $0.lowercased().contains(searchText.lowercased()) }
        if newList.count == 0 {
            if searchText == "" {
                getData(list: provinceList)
            } else {
                getData(list: newList)
            }
        } else {
            getData(list: newList)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        getData(list: provinceList)
    }
}
