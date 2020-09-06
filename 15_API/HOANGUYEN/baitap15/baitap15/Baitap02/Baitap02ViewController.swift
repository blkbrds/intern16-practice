//
//  Baitap02ViewController.swift
//  baitap15
//
//  Created by NXH on 8/18/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

typealias CallbackAPI = ([Entry]) -> Void
final class Baitap02ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var entryList: [Entry] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        showDataAPI(completion: {(temp) in
            DispatchQueue.main.async {
                self.entryList = temp
                self.tableView.reloadData()
            }
        })
        configTableView()
    }
    
    // MARK: - Private func
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
    }
    
    private func loadImageFromAPI(path: String) -> UIImage {
        guard let url = URL(string: path) else { return UIImage() }
        do {
            let data =  try Data(contentsOf: url)
            if let image =  UIImage(data: data) {
                return image
            }
            
        } catch {
            print("loading image error")
        }
        return UIImage()
    }
    private func convertToJSON( from data: Data) -> [String: Any] {
        var json: [String: Any] = [:]
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                json = jsonObj
            }
        } catch {
            print("JSON Casting ERROR")
        }
        return json
    }
    
    private func showDataAPI(completion: @escaping CallbackAPI) {
        var tempArray: [Entry] = []
        guard let url = URL(string: "https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json") else { return }
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, respond, err) in
            guard let data = data else { return }
            guard let feed = (self.convertToJSON(from: data)["feed"] as? [String: Any]), let entry = (feed["entry"]) as? [Any] else { return }
            for value in entry {
                if let dic = value as? [String: Any] {
                    if let name = dic["im:name"] as? [String: Any], let images = dic["im:image"] as? [Any], let image = images.first as? [String: Any] {
                        if let name = name["label"] , let imageName = image["label"], let entryName = name as? String, let entryImage = imageName as? String {
                            tempArray.append(Entry(name: entryName, image: entryImage))
                        }
                    }
                }
            }
            completion(tempArray)
        }
        task.resume()
    }
}

// MARK: - UITableViewDataSource
extension Baitap02ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = entryList[indexPath.row].imName
        cell.imageView?.image = loadImageFromAPI(path: entryList[indexPath.row].imImage)
        return cell
    }
}
