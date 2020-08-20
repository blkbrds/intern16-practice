//
//  HomeViewModel.swift
//  PhanMVVM
//
//  Created by MacBook Pro on 8/14/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

final class HomeViewModel {
    
    // MARK: - Peroperties
    private(set) var myData: [Data] = []
    
    // MARK:- Public functions
    func getMyData() {
        for i in 0..<coffeeData.count {
            myData.append(coffeeData[i])
        }
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return myData.count
    }
    
    func getHomeTableCellModel(atIndexPath indexPath: IndexPath) -> HomeDetailViewModel? {
        guard 0 <= indexPath.row && indexPath.row < myData.count else { return nil }
        return HomeDetailViewModel(data: myData[indexPath.row])
    }
    
    func changeLikeButton(index: Int, islike: Bool) {
        guard index <= myData.count else { return }
        myData[index].isLike = islike
    }
    
    func detailView(indexPath: IndexPath) -> DetailViewModel {
        let data = myData[indexPath.row]
        return DetailViewModel(data: data)
    }
}

var coffeeData: [Data] = [
    Data(titleName: "High Land Cofee", imageName: "cf1", address: "21 Nguyễn Văn Linh", rating: 4, distance: 3, description: " Lorem Ipsum is simply dummy textIpsum is simply dummy textIpsum is simply dummy textIpsum is simply dummy textIpsum is simply dummy textIpsum is simply dummy textIpsum is simply dummy textIpsum is simply dummy textIpsum is simply dummy textIpsum is simply dummy textIpsum is simply dummy textIpsum is simply dummy textIpsum is simply dummy textIpsum is simply dummy textIpsum is simply dummy textIpsum is simply dummy textIpsum is simply dummy textIpsum is simply dummy textIpsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book.", isLike : true, avartar: "avartar", nameuser: "T minh", dayago: "2 day ago", comment: ["Lorem Ipsum is simply dummy text ofthe printing and typesetting industry.Lorem Ipsum"]),
    Data(titleName: "High Land Cofee", imageName: "cf3", address: "21 Nguyễn Văn Linh", rating: 4, distance: 3, description: " Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book.", isLike : false, avartar: "avartar", nameuser: "T minh", dayago: "2 day ago", comment: ["Lorem Ipsum is simply dummy text ofthe printing and typesetting industry.Lorem Ipsum"]),
    Data(titleName: "High Land Cofee", imageName: "cf4", address: "21 Nguyễn Văn Linh", rating: 4, distance: 3, description: " Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book.", isLike : true, avartar: "avartar", nameuser: "T minh", dayago: "2 day ago", comment: ["Lorem Ipsum is simply dummy text ofthe printing and typesetting industry.Lorem Ipsum"]),
    Data(titleName: "High Land Cofee", imageName: "cf1", address: "21 Nguyễn Văn Linh", rating: 4, distance: 3, description: " Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book.", isLike : true, avartar: "avartar", nameuser: "T minh", dayago: "2 day ago", comment: ["Lorem Ipsum is simply dummy text ofthe printing and typesetting industry.Lorem Ipsum"]),
    Data(titleName: "High Land Cofee", imageName: "cf2", address: "21 Nguyễn Văn Linh", rating: 4, distance: 3, description: " Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book.", isLike : true, avartar: "avartar", nameuser: "T minh", dayago: "2 day ago", comment: ["Lorem Ipsum is simply dummy text ofthe printing and typesetting industry.Lorem Ipsum"]),
    Data(titleName: "High Land Cofee", imageName: "cf3", address: "21 Nguyễn Văn Linh", rating: 4, distance: 3, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book.", isLike : false, avartar: "avartar", nameuser: "T minh", dayago: "2 day ago", comment: ["Lorem Ipsum is simply dummy text ofthe printing and typesetting industry.Lorem Ipsum"]),
    Data(titleName: "High Land Cofee", imageName: "cf1", address: "21 Nguyễn Văn Linh", rating: 4, distance: 3, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book.", isLike : true, avartar: "avartar", nameuser: "T minh", dayago: "2 day ago", comment:[ "Lorem Ipsum is simply dummy text ofthe printing and typesetting industry.Lorem Ipsum"]),
    Data(titleName: "High Land Cofee", imageName: "cf5", address: "21 Nguyễn Văn Linh", rating: 4, distance: 3, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book.", isLike : true, avartar: "avartar", nameuser: "T minh", dayago: "2 day ago", comment: ["Lorem Ipsum is simply dummy text ofthe printing and typesetting industry.Lorem Ipsum"]),
    Data(titleName: "High Land Cofee", imageName: "cf1", address: "21 Nguyễn Văn Linh", rating: 4, distance: 3, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book.", isLike : true, avartar: "avartar", nameuser: "T minh", dayago: "2 day ago", comment: ["Lorem Ipsum is simply dummy text ofthe printing and typesetting industry.Lorem Ipsum"]),
    Data(titleName: "High Land Cofee", imageName: "cf2", address: "21 Nguyễn Văn Linh", rating: 4, distance: 3, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book.", isLike : true, avartar: "avartar", nameuser: "T minh", dayago: "2 day ago", comment: ["Lorem Ipsum is simply dummy text ofthe printing and typesetting industry.Lorem Ipsum","Lorem Ipsum is simply dummy text ofthe printing and typesetting industry.Lorem Ipsum","Lorem Ipsum is simply dummy text ofthe printing and typesetting industry.Lorem Ipsum"])]
