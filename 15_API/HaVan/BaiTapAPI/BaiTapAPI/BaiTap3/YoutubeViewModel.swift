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
        
        let urlString = "https://www.googleapis.com/youtube/v3/search?pageToken=" + nextPage + "&part=snippet&maxResults=25&order=relevance&q=" + keyString + "&key=AIzaSyDxoMGIPLA4j4QVtdOuxjrsXGeOhx-RZCI"
        Networking.shared().request(with: urlString) { (data, error) in
            if let error = error {
                completion(false, "" ,error.localizedDescription)
            } else {
                if let data = data {
                    let json = data.toJSON()
                    let nextPageToken = json["nextPageToken"] as? String ?? ""
                    guard let items = json["items"] as? [JSON] else { fatalError("can't get item") }
                    for item in items {
                        let video = Video(json: item)
                        self.videos.append(video)
                    }
                    completion(true,"\(nextPageToken)", "")
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
