//
//  DetailViewModel.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/17/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class DetailViewModel {
    
    // MARK: - Properties
    private var datas: [DetailModel] = []
    
    // MARK: - Function
    func numberOfSection() -> Int {
        return 1
    }
    
    func numberOfRowInSection(in section: Int)  -> Int {
        return datas.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> DetailCellModel {
        let item = datas[indexPath.row]
        let viewModel = DetailCellModel(item: item)
        return viewModel
    }
    
    func getData() {
        var comments: [DetailModel] = []
        comments.append(DetailModel(name: "Thien Tam", comment: "Co con chim non nho nho", time: " 16 phut truoc"))
        comments.append(DetailModel(name: "Tien Le", comment: "Quan an rat ngon . Nhan vien phuc vu chu dao, do an sach se", time: " 16 phut truoc"))
        comments.append(DetailModel(name: "Trung Le", comment:"Viet Nam vo dich, Viet Nam vo doi, remote chan qua, em yeu anh, anh yeu em", time: " 16 phut truoc"))
        datas = comments
    }
}
