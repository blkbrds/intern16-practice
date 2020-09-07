//
//  DetailCellViewModel.swift
//  TabbarController
//
//  Created by Abcd on 8/18/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
final class DetailCellViewModel {
    
    //MARK: - Properties
    var dataDetail: DataDetail = DataDetail()
    
    //MARK: - Init
    init(dataDetail: DataDetail = DataDetail()) {
        self.dataDetail = dataDetail
    }
}
