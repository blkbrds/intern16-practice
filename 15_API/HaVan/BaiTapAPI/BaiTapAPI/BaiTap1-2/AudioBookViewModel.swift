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
        let urlString = "https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json"
        Networking.shared().request(with: urlString) { (data, error) in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                if let data = data {
                    let json = data.toJSON()
                    guard let feed = json["feed"] as? JSON else { fatalError("can't get feed") }
                    guard let entry = feed["entry"] as? [JSON] else { fatalError("can't get entry") }
                    for audioBook in entry {
                        let book = AudioBook(json: audioBook)
                        self.audoBook.append(book)
                    }
                    completion(true, "")
                } else {
                    completion(false, "data is error")
                }
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
