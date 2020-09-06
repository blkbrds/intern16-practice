//
//  HomeViewModel.swift
//  PhanAPI
//
//  Created by MacBook Pro on 8/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

typealias Completion = (Bool, String) -> Void

final class HomeViewModel {
    
    // MARK: - Peroperties
    var musics: [Music] = []
    
    // MARK : - Public functions
    func loadAPI(completion: @escaping Completion) {
        APIManager.Music.getHotMusic { (result) in
            switch result {
            case .failure(let error):
                completion(false, error.localizedDescription)
                
            case .success(let musicResult):
                self.musics.append(contentsOf: musicResult.musics)
                completion(true, "")
            }
        }
    }

    func cellForRowAt(atIndexPath indexPath: IndexPath) -> HomeCellViewModel? {
        return HomeCellViewModel(titlename: musics[indexPath.row].name, price: musics[indexPath.row].price, imImage: musics[indexPath.row].thumbnailImage, releaseDate: musics[indexPath.row].releaseDate)
    }
}
