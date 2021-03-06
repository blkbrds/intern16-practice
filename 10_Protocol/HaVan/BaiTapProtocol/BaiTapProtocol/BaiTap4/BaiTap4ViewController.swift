//
//  BaiTap4ViewController.swift
//  BaiTapProtocol
//
//  Created by NganHa on 7/26/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap4ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tinhThanhTextView: UITextView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var cancelButton: UIButton!
    
    // MARK: - Propeties
    private var translateData: [String] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        transData()
        showData()
        configTextView()
        searchBar.delegate = self
    }
    
    // MARK: - Override functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.resignFirstResponder()
    }
    
    // MARK: - Private functions
    private func transData() {
        for data in TinhThanh.danhSachTinhThanh {
            translateData.append(data.folding(options: .diacriticInsensitive, locale: .current))
        }
    }
    
    private func showData() {
        tinhThanhTextView.text.removeAll()
        for i in 0...translateData.count - 1 {
            tinhThanhTextView.text += "\n - \(translateData[i])"
        }
    }
    
    private func getResultForTextView(with searchText: String) {
        tinhThanhTextView.text.removeAll()
        for i in 0...translateData.count - 1 {
            if translateData[i].contains(searchText) {
                tinhThanhTextView.text += "\n - \(translateData[i])"
            }
        }
    }
    
    private func configTextView() {
        tinhThanhTextView.font = UIFont(name: "Arial", size: 20)
        tinhThanhTextView.isEditable = false
    }
}

// MARK: - UISearchBarDelegate
extension BaiTap4ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty || searchText.contains(" "){
            showData()
        } else {
            getResultForTextView(with: searchText)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text?.removeAll()
        showData()
    }
}
