//
//  MasterViewModel.swift
//  API
//
//  Created by bu on 9/9/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

class MasterViewModel {
    var youtubes: [Youtube] = []
    var nextPage: String?
    
    func loadAPI(completion: @escaping Completion) {
        APIManager.Youtube.getHotYoutube(pageToken: nextPage, keyword: "lactroi") { (result) in
            switch result {
            case .success(let data):
                self.youtubes.append(contentsOf: data.youtubes)
                self.nextPage = data.nextPage
                completion(true, "")
            case .failure(let error):
                completion(false, error.localizedDescription)
            }
        }
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        return youtubes.count
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> YoutubeTableViewCellViewModel? {
        let item = youtubes[indexPath.row]
        return YoutubeTableViewCellViewModel(youtube: item)
    }
}
