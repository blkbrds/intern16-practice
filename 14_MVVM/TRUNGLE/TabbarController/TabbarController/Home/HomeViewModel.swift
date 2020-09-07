//
//  HomeViewModel.swift
//  TabbarController
//
//  Created by Abcd on 8/18/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
final class HomeViewModel {
    
    //MARK: - Properties:
    static var shared = HomeViewModel()
    var datas: [DataManager] = []
    let images: [String] = ["pic1","pic2","pic3","pic4","pic5","pic6"]
    var coffeList: [DataManager] = [DataManager(name: "The Coffe House", image: "pic1", address: "123 Nguyễn Văn Linh", distance: "2km", rate: "8/10", favorite: true),DataManager(name: "Highland", image: "pic2", address: "213 Trần Phú", distance: "1km", rate: "8/10", favorite: false),DataManager(name: "abc", image: "pic3", address: "128 Ngô Quyền", distance: "3km", rate: "9/10", favorite: false),DataManager(name: "sinhvien", image: "pic4", address: "128 Phạm Phú Thứ", distance: "5km", rate: "7/10", favorite: false),DataManager(name: "Học SInh", image: "pic5", address: "977 Ngũ Hành Sơn", distance: "6km", rate: "6/10", favorite: false),DataManager(name: "Phụ Huynh", image: "pic6", address: "12 Lê Đại Hành", distance: "10km", rate: "8/10", favorite: true)]
   
    //MARK: - Function
    func changeState(postion: Int, favorite: Bool) {
        HomeViewModel.shared.coffeList[postion].favorite = favorite
    }
    
    func numberOfRowInSection() -> Int {
        return HomeViewModel.shared.coffeList.count
    }
    
    func getHomeCellViewModel(at indexPath: IndexPath) -> HomeCellViewModel? {
        guard 0 <= indexPath.row && indexPath.row < HomeViewModel.shared.coffeList.count else {
            return nil
        }
        return HomeCellViewModel(name: HomeViewModel.shared.coffeList[indexPath.row].name, image: HomeViewModel.shared.coffeList[indexPath.row].image, rate: HomeViewModel.shared.coffeList[indexPath.row].rate, address: HomeViewModel.shared.coffeList[indexPath.row].address, distance: HomeViewModel.shared.coffeList[indexPath.row].distance, favorite: HomeViewModel.shared.coffeList[indexPath.row].favorite)
    }
}
