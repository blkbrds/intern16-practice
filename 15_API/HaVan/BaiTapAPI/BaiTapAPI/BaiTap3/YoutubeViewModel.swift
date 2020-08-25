//
//  YoutubeViewModel.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/24/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

typealias YoutubeCallBack = (Bool, String, String) -> Void

final class YoutubeViewModel {
    
    var videos: [Video] = []
    
    func loadAPI(withString keyString: String, nextPage: String, completion: @escaping YoutubeCallBack) {
        
        let urlString = "https://www.googleapis.com/youtube/v3/search?pageToken=" + nextPage + "&part=snippet&maxResults=5&order=relevance&q=" + keyString + "&key=AIzaSyDHrM8IShRVy_9vkMZy7Rmkq47GT31-RXA"
        Networking.shared().request(with: urlString) { (data, error) in
            if let error = error {
                completion(false, "" ,error.localizedDescription)
            } else {
                if let data = data {
                    let json = data.toJSON()
                    if let _ = json["error"] as? JSON {
                        completion(false,"","limit request")
                    } else {
                        let nextPageToken = json["nextPageToken"] as? String ?? ""
                        guard let items = json["items"] as? [JSON] else { fatalError("can't get item") }
                        for item in items {
                            let video = Video(json: item)
                            self.videos.append(video)
                        }
                        completion(true,"\(nextPageToken)", "")
                    }
                } else {
                    completion(false,"","data is error")
                }
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
