//
//  Bai3ViewModel.swift
//  BaiTap_api
//
//  Created by Abcd on 8/24/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation

typealias CallBack = (Bool,String, String) -> Void
final class Bai3ViewModel {
    
    var videosYouTube: [VideosYouTube] = []
    
    func loadAPI(nextPageToken: String, searchKey: String, completion: @escaping CallBack) {
        APIManager.PathYoutube.nextPageToken = nextPageToken
        APIManager.PathYoutube.searchKey = searchKey
        APIManager.Video.getAllVideo { (results) in
            switch results {
            case .failure(let error):
                completion(false, error.localizedDescription, "")
            case .success(let result):
                self.videosYouTube = result.videosYoutube
                completion(true, "", result.nextPageToken)
            }
        }
    }
    
    func numberOfRowInSection() -> Int {
        return videosYouTube.count
    }
    
    func cellForRowAtIndexPath(atIndexPath indexPath: IndexPath) -> VideoTableCellViewModel? {
        return VideoTableCellViewModel(thumnails: videosYouTube[indexPath.row].thumnails ?? "", channelTitle: videosYouTube[indexPath.row].channelTitle ?? "", publishedAt: videosYouTube[indexPath.row].publishedAt ?? "", title: videosYouTube[indexPath.row].title ?? "")
    }
}
