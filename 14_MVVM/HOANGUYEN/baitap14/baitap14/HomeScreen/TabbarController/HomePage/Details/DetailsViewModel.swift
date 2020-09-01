//
//  DetailsViewModel.swift
//  baitap14
//
//  Created by NXH on 8/21/20.
//  Copyright © 2020 NXH. All rights reserved.
//
import Foundation

final class DetailsViewModel {
    private(set) var index: Int
    private(set) var coffeeShop: CoffeeShop
    
    init(coffeeShop: CoffeeShop, index: Int) {
        self.index = index
        self.coffeeShop = coffeeShop
    }
    
    func getNumberImages() -> Int {
        return 5
    }
    
    func getCell(atIndexPath indexPath: IndexPath) -> CommentTableViewViewModel? {
        guard let comment = coffeeShop.comment else { return nil }
        return CommentTableViewViewModel(index: indexPath.row, cellViewModel: CommentTableViewCellViewModel(content: comment[indexPath.row]))
    }
}
