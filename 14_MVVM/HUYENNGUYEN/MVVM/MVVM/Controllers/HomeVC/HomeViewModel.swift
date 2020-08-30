//
//  HomeViewModel.swift
//  MVVM
//
//  Created by bu on 8/24/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class  HomeViewModel {
    
    private(set) var sliderImages: [UIImage?] = []
    private(set) var listCoffee: [DataManager] = []
    
    func numberOfRowInSection() -> Int {
        return listCoffee.count
    }

    func viewModelForItem(at indexPath: IndexPath) -> ListCellViewModel? {
        guard listCoffee.count > indexPath.row else { return nil }
        let coffee = listCoffee[indexPath.row]
        return ListCellViewModel(datas: coffee)
    }
    
    func getImages() {
        let images = Datas.listCoffee()
        for name in images {
            let image = UIImage(named: "\(name)")
            sliderImages.append(image)
        }
    }
    
    func getListCoffee() {
        listCoffee = Datas.listCoffee()
    }
    
    func changeFavorite(at indexPath: IndexPath, isFavorite: Bool) {
        listCoffee[indexPath.row].isFavorite = !isFavorite
    }
    
    func getCoffeeAt(_ indexPath: IndexPath) -> Information? {
        let data = Datas.coffeeInformation()
        guard data.count > indexPath.row else { return nil }
        return data[indexPath.row]
    }
    
//    func getValueForCell(at indexPath: IndexPath) -> HomeCellModel {
//        let viewModel = listData[indexPath.row]
//        return viewModel
//    }
  
}
