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
    
    var videos: [Video] = []
    
    func loadAPI(withString keyString: String, nextPage: String, completion: @escaping YoutubeCallBack) {
        APIManager.PathVideo.nextPage = nextPage
        APIManager.PathVideo.keyString = keyString
        APIManager.Video.getAllVideo { (result) in
            switch result {
            case .success(let videoResult):
                self.videos.append(contentsOf: videoResult.videos)
                completion(true, "", videoResult.nextPage)
            case .failure(let error):
                completion(false, error.localizedDescription, "")
            }
        }
    }
    
    func numberOfRowInSection() -> Int {
        return videos.count
    }
    
    func cellForRowAt(atIndexPath indexPath: IndexPath) -> YoutubeCellViewModel? {
        return YoutubeCellViewModel(title: videos[indexPath.row].title, thumbnail: videos[indexPath.row].thumbnail, channel: videos[indexPath.row].channel, publishedAt: videos[indexPath.row].publishedAt)
    }
}
