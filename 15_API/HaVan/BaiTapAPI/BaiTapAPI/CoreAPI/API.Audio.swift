//
//  API.Audio.swift
//  BaiTapAPI
//
//  Created by NganHa on 8/26/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

extension APIManager.Audio {
    
    struct QuerryString {
        func allAudio(completion: @escaping APICompletion<AudioResult>) -> String {
            return APIManager.PathAudio.base_domain + APIManager.PathAudio.base_path + APIManager.PathAudio.base_query
        }
    }
    
    struct QueryParam {
        
    }
    
    struct AudioResult {
        var audio: [AudioBook] = []
    }
    
    static func getAllAudio(completion: @escaping APICompletion<AudioResult>) {
        let urlString = QuerryString().allAudio(completion: completion)
        API.shared().request(urlString: urlString) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                if let data = data {
                    let json = data.toJSON()
                    guard let feed = json["feed"] as? JSON else { fatalError("can't get feed") }
                    guard let entry = feed["entry"] as? [JSON] else { fatalError("can't get entry") }
                    var audios: [AudioBook] = []
                    for audioBook in entry {
                        let book = AudioBook(json: audioBook)
                        audios.append(book)
                    }
                    completion(.success(AudioResult(audio: audios)))
                } else {
                    completion(.failure(.error("can't get audio, the data has trouble")))
                }
            }
        }
    }
}
