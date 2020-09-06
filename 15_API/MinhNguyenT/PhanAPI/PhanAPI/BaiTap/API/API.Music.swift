//
//  API.Music.swift
//  PhanAPI
//
//  Created by MacBook Pro on 8/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

extension APIManager.Music {
    struct QueryString {
        func hotMusic( completion: @escaping APICompletion<MusicResult>) -> String {
            return APIManager.Path.base_domain + APIManager.Path.base_path + APIManager.Path.music_path
        }
    }
    
    struct QueryParam {
    }
    
    struct MusicResult {
        var musics: [Music]
    }
    
    static func getHotMusic(completion: @escaping APICompletion<MusicResult>) {
        let urlString = QueryString().hotMusic(completion: completion)
        API.shared().request(urlString: urlString) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                if let data = data {
                    let json = data.toJSON()
                    guard let feed = json["feed"] as? JSON else {completion(.failure(.error("don't get value")))
                        return
                    }
                    guard let results = feed["entry"] as? [JSON] else {fatalError("error")}
                    var musics: [Music] = []
                    for item in results {
                        let music = Music(json: item)
                        musics.append(music)
                    }
                    completion(.success(MusicResult(musics: musics)))
                } else {
                    completion(.failure(.error("Data is not format.")))
                }
            }
        }
    }
}
