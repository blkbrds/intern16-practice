//
//  Baitap1111ViewController.swift
//  baitap11
//
//  Created by NXH on 8/1/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap1111ViewController: UIViewController {
    // MARK: - @IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - properties
    private let textList: [String] = ["Hàng Lâm Trang Anh, known by her stage name Suboi, is a Vietnamese rapper, singer, and songwriter.", " Binz is the largest seaside resort on the German island of Rügen It is situated between the bay of Prorer Wiek and the Schmachter See (a lake) in the southeast of the island. To the north of Binz stretches the Schmale Heide (the narrow heath), a tongue of land which joins the Muttland region of Rügen to the Jasmund peninsula. The land to the south and east of Binz is hilly, reaching a height of over 100 metres above sea level. Binz is famous its charming and well-kept historical resort architecture and the natural scenery, close to the Jasmund National Park and its chalk cliffs.", "915.1k Followers, 84 Following, 626 Posts - See Instagram photos and videos from JustaTee (@justatee)", "ok"]
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - private func
    private func configUI() {
        tableView.dataSource = self
        let nib = UINib(nibName: "CustomCell11TableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "CELL")
    }
}

// MARK: - extension
extension Baitap1111ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! CustomCell11TableViewCell
        cell.contextLabel.text = textList[indexPath.row]
        return cell
    }
    
    
}
