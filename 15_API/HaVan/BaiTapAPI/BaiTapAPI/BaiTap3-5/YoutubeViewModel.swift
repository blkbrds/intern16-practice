//
//  YoutubeViewModel.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/24/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

typealias YoutubeCallBack = (Bool, _ error: String, _ next: String) -> Void

final class YoutubeViewModel {
    
    // MARK: - Properties
    var items: [Item] = []
    
    // MARK: - Public functions
    func loadAPI(withString keyString: String, nextPage: String, completion: @escaping YoutubeCallBack) {
        APIManager.PathVideo.nextPage = nextPage
        APIManager.PathVideo.keyString = keyString
        APIManager.Video.getAllVideo { (result) in
            switch result {
            case .success(let videoResult):
                self.items = videoResult.items
                let nextPage = videoResult.nextPageToken
                completion(true, "", nextPage)
            case .failure(let error):
                completion(false, error.localizedDescription, "")
            }
        }
    }
    
    func numberOfRowInSection() -> Int {
        return items.count
    }
    
    func cellForRowAt(atIndexPath indexPath: IndexPath) -> YoutubeCellViewModel? {
        return YoutubeCellViewModel(title:  items[indexPath.row].title ?? "", thumbnail:  items[indexPath.row].thumbnail ?? "", channel:  items[indexPath.row].channel ?? "", publishedAt:  items[indexPath.row].publishedAt ?? "")
    }
}
