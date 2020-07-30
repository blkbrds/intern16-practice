//
//  Message.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/29/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

struct Message {
    
    static var messages: [String] = []
    
    static func getMessage() {
        guard let path = Bundle.main.url(forResource: "Messages", withExtension: ".plist")
            else { return }
        guard let dataMessages = NSArray(contentsOf: path) as? [String] else { return }
        messages = dataMessages
    }
}
