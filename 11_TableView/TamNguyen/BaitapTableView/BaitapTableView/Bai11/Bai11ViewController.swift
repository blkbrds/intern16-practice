//
//  Bai11ViewController.swift
//  BaitapTableView
//
//  Created by PCI0001 on 7/31/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai11ViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var poemManager = PoemManager()
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
}
    
    // MARK: - Private methods
    private func loadData() {
        title = "Poem"
        poemManager.getPoem()
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "Bai11CustomTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "Bai11CustomTableViewCell")
        tableView.dataSource = self
    }
}

// MARK: - Extension
extension Bai11ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return poemManager.numberOfSection()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poemManager.numberOfRowInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Bai11CustomTableViewCell", for: indexPath) as! Bai11CustomTableViewCell
        cell.poemForCell = poemManager.viewModelForCell(at: indexPath)
        return cell
    }
}
