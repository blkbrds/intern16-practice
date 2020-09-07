//
//  DetailViewModel.swift
//  TabbarController
//
//  Created by Abcd on 8/18/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
import MapKit
import UIKit
final class DetailViewModel {
    
    // MARK: - Properties
    var dataDetail: [DataDetail] = []
    let images: [String] = ["pic1", "pic2", "pic3", "pic4", "pic5","pic6"]
    
    // MARK: - Function
    func numberOfSections() -> Int {
        return 2
    }
    
    func numberOfRowInSection() -> Int {
        return dataDetail.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> DetailCellViewModel {
        let item = dataDetail[indexPath.row]
        let viewModel = DetailCellViewModel(dataDetail: item)
        return viewModel
    }
    
    func getDataDetail() {
        let data1 = DataDetail(name: "Trung1", image: "avatar", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is si", time: "3 days ago")
        let data2 = DataDetail(name: "Trung2", image: "avatar", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is si", time: "1 days ago")
        dataDetail.append(contentsOf: [data1, data2])
    }
}

