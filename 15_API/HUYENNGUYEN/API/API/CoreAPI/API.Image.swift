//
//  API.Image.swift
//  API
//
//  Created by bu on 9/7/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

extension APIManager.Image {
    struct QueryString {
        func hotAudio(limit: Int) -> String {
            return APIManager.Path.baseDomain + APIManager.Path.basePath + APIManager.Path.audioPath + APIManager.Path.audioHot
        }
    }
    
    struct QueryParam { }
        
    static func getHotAudio(limit: Int = 10, completion: @escaping APICompletion<[Audio]>) {
        let urlString = QueryString().hotAudio(limit: limit)
        
        API.shared().request(urlString: urlString) { (result) in
            switch result {
            case .failure(let error):
                //call back
                completion(.failure(error))
            case .success(let data):
                if let data = data {
                    var audios: [Audio] = []
                    
                    let json = data.toJSON()
                    if let feed = json["feed"] as? JSON, let entry = feed["entry"] as? [JSON] {
                        for audio in entry {
                            let audio = Audio(json: audio)
                            audios.append(audio)
                        }
                    }
                    completion(.success(audios))
                } else {
                    completion(.failure(.error("Data is not format.")))
                }
            }
        }
    }
}
