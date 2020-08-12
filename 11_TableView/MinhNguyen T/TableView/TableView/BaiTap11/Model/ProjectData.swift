//
//  ProjectData.swift
//  TableView
//
//  Created by MacBook Pro on 7/31/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

struct ProjectData {
    
    static var projectData: [String] = []
    static func getData() {
        if let path = Bundle.main.path(forResource: "Project", ofType: "plist"){
            if let myDict = NSArray(contentsOfFile: path){
                projectData = myDict as! [String]
            }
        }
    }
}
