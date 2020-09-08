//
//  BasicViewController.swift
//  API
//
//  Created by bu on 9/1/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class BasicViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel = BasicViewModel()
    
//    let url = URL(string: "https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
//        downloadJson()
        configTableView()
        loadAPI()
    }
    
//    func downloadJson() {
//        guard let downloadURL = url else { return }
//        URLSession.shared.dataTask(with: downloadURL) { (data, respone, error) in
//            print("Downloaded")
//        }.resume()
//    }
    
    func configTableView() {
        let nib = UINib(nibName: "ImageTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "ImageTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadAPI() {
        viewModel.loadAPI { (done, message) in
            if done {
                self.tableView.reloadData()
            } else {
                print("API ERROR: \(message)")
            }
        }
    }
    
}

extension BasicViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.audios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as? ImageTableViewCell else { return UITableViewCell() }
        let item = viewModel.audios[indexPath.row]
        if let imageURL = item.imageName {
            API.shared().dowloadImage(url: imageURL) { (image) in
                cell.showImageView.image = image
            }
        } else {
            cell.showImageView.image = nil
        }
        return cell
    }
}
extension BasicViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}
