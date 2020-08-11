//
//  Baitap1004ViewController.swift
//  baitap10
//
//  Created by NXH on 7/23/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap1004ViewController: UIViewController {
    
    // MARK: - @IBOutlet
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var provinceTextView: UITextView!
    
    // MARK: - Properties
    private let datas: [String] = ["An Giang", "Bà Rịa – Vũng Tàu", "Bắc Giang", "Bắc Kạn", "Bạc Liêu", "Bắc Ninh", "Bến Tre", "Bình Định", "Bình Dương", "Bình Phước", "Bình Thuận", "Cà Mau", "Cần Thơ", "Cao Bằng", "Đà Nẵng", "Đắk Lắk", "Đắk Nông", "Điện Biên", "Đồng Nai", "Đồng Tháp", "Gia Lai", "Hà Giang", "Hà Nam", "Hà Nội", "Hà Tĩnh", "Hải Dương", "Hải Phòng", "Hậu Giang", "Hòa Bình", "Hưng Yên", "Khánh Hòa", "Kiên Giang", "Kon Tum", "Lai Châu", "Lâm Đồng", "Lạng Sơn", "Lào Cai", "Long An", "Nam Định", "Nghệ An", "Ninh Bình", "Ninh Thuận", "Phú Thọ", "Phú Yên", "Quảng Bình", "Quảng Nam", "Quảng Ngãi", "Quảng Ninh", "Quảng Trị", "Sóc Trăng", "Sơn La", "Tây Ninh", "Thái Bình", "Thái Nguyên", "Thanh Hóa", "Thừa Thiên Huế", "Tiền Giang", "Thành phố Hồ Chí Minh", "Trà Vinh", "Tuyên Quang", "Vĩnh Long", "Vĩnh Phúc", "Yên Bái"]
    private var translateDatas: [String] = []
    private var provincesString: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        provinceTextView.isEditable = false
        searchBar.delegate = self
        configUI()
        transData()
    }
    
    // MARK: - Private Function
    
    private func transData() {
        for data in datas {
            translateDatas.append(data.folding(options: .diacriticInsensitive, locale: .current).uppercased())
        }
    }
    
    private func configUI() {
        for index in datas {
            provinceTextView.text = provinceTextView.text + "\n - " + index
        }
        provincesString = provinceTextView.text
    }
    
    // MARK: -@IBAction
    @IBAction private func cancelButtonTouchUpInside(_ sender: UIButton) {
        provinceTextView.text = provincesString
        searchBar.text = ""
    }
}

extension Baitap1004ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text else {
            return
        }
        if text == "" {
            provinceTextView.text = provincesString
            return
        }
        provinceTextView.text = ""
        for (index, data) in translateDatas.enumerated() {
            if data.contains(text.uppercased()) {
                provinceTextView.text = provinceTextView.text + "\n - " + datas[index]
            }
        }
    }
}
