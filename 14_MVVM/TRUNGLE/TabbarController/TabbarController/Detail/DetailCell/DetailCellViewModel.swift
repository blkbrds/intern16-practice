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
    var dataCellDetail: DataCellDetail = DataCellDetail()
    
    //MARK: - Init
    init(dataCellDetail: DataCellDetail = DataCellDetail()) {
        self.dataCellDetail = dataCellDetail
    }
}
