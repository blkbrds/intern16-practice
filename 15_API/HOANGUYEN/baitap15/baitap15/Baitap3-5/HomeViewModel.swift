//
//  HomeViewModel.swift
//  baitap15
//
//  Created by NXH on 9/1/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import Foundation

typealias CallBack = (Bool,String, String) -> Void
final class HomeViewModel {
    
    var items: [Items] = []
    
    func loadAPI(nextpageToken: String, keySearch: String, completion: @escaping CallBack) {
        APIManager.VideoPath.nextPageToken = nextpageToken
        APIManager.VideoPath.keySearch = keySearch
        APIManager.Video.getAllVideo { (results) in
            switch results {
            case .failure(let error):
                completion(false, error.localizedDescription, "")
            case .success(let result):
                self.items = result.items
                completion(true, "", result.nextPageToken)
            }
        }
    }
    
    func numberOfRowInSection() -> Int {
        return items.count
    }
    
    func cellForRowAtIndexPath(atIndexPath indexPath: IndexPath) -> CellViewModel? {
        return CellViewModel(title: items[indexPath.row].title ?? "", thumbnail: items[indexPath.row].thumbnailsURL ?? "", channel: items[indexPath.row].channelTitle ?? "", publishedAt: items[indexPath.row].publishedAt ?? "")
    }
}
