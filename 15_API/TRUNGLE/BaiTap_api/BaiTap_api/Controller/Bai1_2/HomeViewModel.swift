//
//  HomeViewModel.swift
//  BaiTap_api
//
//  Created by Abcd on 8/19/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
typealias CompletionData = (Bool, String) -> Void

final class HomeViewModel {
    
    // MARK: - Properties
    var music: [Music] = []
    
    // MARK: - Public functions
    func loadAPI(completion: @escaping CompletionData) {
        APIManager.Image.getHotMusic { (result) in
            switch result {
            case .failure(let error):
                completion(false, error.localizedDescription)
            case .success(let musicResult):
                self.music.append(contentsOf: musicResult)
                completion(true,"")
                print(musicResult)
            }
        }
    }
    
    func numberOfRowInSection() -> Int {
        return music.count
    }
    
    func cellForRowAt(atIndexPath indexPath: IndexPath) -> Bai2CellViewModel? {
        return Bai2CellViewModel(artist: music[indexPath.row].artist, image: music[indexPath.row].image, name: music[indexPath.row].name, price: music[indexPath.row].price)
    }
}
