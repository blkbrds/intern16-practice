//
//  SearchViewModel.swift
//  PhanAPI
//
//  Created by MacBook Pro on 8/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

typealias completion = (Bool, String, String) -> Void

final class SearchViewModel {
    var videos: [VideoItem] = []
    
    func loadAPI(searchKey: String, nextPage: String, completion: @escaping completion) {
        APIManager.PathVideo.searchKey = searchKey
        APIManager.PathVideo.nextPage = nextPage
        APIManager.Video.getVideo { (result) in
            switch result {
            case .failure(let error):
                completion(false, error.localizedDescription, "")
            case .success(let musicResult):
                self.videos.append(contentsOf: musicResult.videos)
                completion(true, "succes",musicResult.nextpage)
            }
        }
    }
    
    func cellForRowAt(atIndexPath indexPath: IndexPath) -> SearchCellViewModel? {
        return SearchCellViewModel(titlename: videos[indexPath.row].title!, channel: videos[indexPath.row].channnelId!, imImage: videos[indexPath.row].thumbnails!, publlish: videos[indexPath.row].publishedAt!)
    }
}
