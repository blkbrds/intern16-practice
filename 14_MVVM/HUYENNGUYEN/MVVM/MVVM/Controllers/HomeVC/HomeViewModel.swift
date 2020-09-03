//
//  HomeViewModel.swift
//  MVVM
//
//  Created by bu on 8/24/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

final class HomeViewModel {
    
    // MARK: - Properties
    private(set) var sliderImages: [Slider] = []
    private(set) var listCoffee: [DataManager] = []
    
    // MARK: - Function
    func numberOfRows(inSection section: Int) -> Int {
        return listCoffee.count
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> HomeCollectionViewCellViewModel? {
        guard listCoffee.count > indexPath.row else { return nil }
        let coffee = listCoffee[indexPath.row]
        return HomeCollectionViewCellViewModel(data: coffee)
    }
    
    func viewModelForSlider(at indexPath: IndexPath) -> SliderViewModel? {
        guard sliderImages.count > indexPath.row else { return nil }
        let slideImage = sliderImages[indexPath.row]
        return SliderViewModel(sliderImages: slideImage)
    }
    
    func getImages() {
        sliderImages = Data.sliderImage()
    }
    
    func getListCoffee() {
        listCoffee = Data.listCoffee()
    }
    
    func changeFavorite(at indexPath: IndexPath, isFavorite: Bool) {
        listCoffee[indexPath.row].isFavorite = !isFavorite
    }
    
    func getCoffeeAt(_ indexPath: IndexPath) -> Information? {
        let data = Data.coffeeInformation()
        guard data.count > indexPath.row else { return nil }
        return data[indexPath.row]
    }
}
