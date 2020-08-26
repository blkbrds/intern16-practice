//
//  AudioBookViewModel.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/23/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

typealias CompletionData = (Bool, String) -> Void

final class AudioBookViewModel {
    
    // MARK: - Properties
    var audoBook: [AudioBook] = []
    
    // MARK: - Public functions
    func loadAPI(completion: @escaping CompletionData) {
        APIManager.Audio.getAllAudio { (result) in
            switch result {
            case .failure(let error):
                completion(false, error.localizedDescription)
            case .success(let audioResult):
                self.audoBook.append(contentsOf: audioResult.audio)
                completion(true,"")
            }
        }
    }
    
    func numberOfRowInSection() -> Int {
        return audoBook.count
    }
    
    func cellForRowAt(atIndexPath indexPath: IndexPath) -> AudioBookCellViewModel? {
        return AudioBookCellViewModel(title: audoBook[indexPath.row].title, price: audoBook[indexPath.row].price, releaseDate: audoBook[indexPath.row].releaseDate, image: audoBook[indexPath.row].image)
    }
}
