//
//  APIImage.swift
//  BaiTap_api
//
//  Created by Abcd on 8/19/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
extension APIManager.Image {
    struct QueryString {
        func hotMusic(limit: Int) -> String {
            return APIManager.PathBai1.base_domain + APIManager.PathBai1.base_path + APIManager.PathBai1.music_path + APIManager.PathBai1.music_range
        }
    }
    struct QueryParam {}
    
    static func getHotMusic(limit: Int = 10, completion: @escaping APICompletion<[Music]>) {
        let url = QueryString().hotMusic(limit: limit)
        
        API.shared().requestURLString(urlString: url) { (result) in
            switch result {
            case .fail(let error):
                //call back
                completion(.failure(error))
            case .success(let data):
                if let data = data {
                    var musics: [Music] = []
                    
                    let json = data.toJSON()
                    if let feed = json["feed"] as? JSON, let entry = feed["entry"] as? [JSON] {
                        for music in entry {
                            let music = Music(json: music)
                            musics.append(music)
                            print(music)
                        }
                    }
                    completion(.success(musics))
                } else {
                    completion(.failure(.error("Data is not format.")))
                }
            }
        }
    }
}
