//
//  ContactInformation.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/30/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import Contacts

struct ContactInformation {
    
    
    static var contacts: [String: String] = [String: String]()
    
    static func readPropertyList() {
        var propertyListFormat =  PropertyListSerialization.PropertyListFormat.xml
        guard let plistPath: String = Bundle.main.path(forResource: "AddressBook", ofType: "plist") else { return }
        guard let plistXML = FileManager.default.contents(atPath: plistPath) else { return }
        do {
            self.contacts = try PropertyListSerialization.propertyList(from: plistXML, options: .mutableContainersAndLeaves, format: &propertyListFormat) as! [String:String]

        } catch {
            print("Error reading plist: \(error), format: \(propertyListFormat)")
        }
    }
}

class ManagementContact {
    
    var contactsDictionary: [String: String] = [String: String]()
    
    func getContactsFromIphone(){
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, error) in
            if let error = error {
                print("Fail to request access: \(error)")
                return
            }
            if granted {
                print("Access granted")
                let keys = [CNContactGivenNameKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                do {
                    try store.enumerateContacts(with: request) { (contacts, stopPointer) in
                        let name = contacts.givenName + " " + contacts.familyName
                        let phoneNumber = contacts.phoneNumbers.first?.value.stringValue ?? ""
                        self.contactsDictionary[name] = phoneNumber
                    }
                } catch let err {
                    print("Failed to enumarate contacts: \(err)")
                }
            } else {
                return
            }
        }
    }
    
    func saveMyPlist(key: String, value: Any) {
        let fileManager = FileManager.default
        // Tạo đường dẫn file
        let path = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("AddressBook.plist")
        guard let myDict = NSMutableDictionary(contentsOf: path) else {
            // nếu file chưa tồn tại chúng ta sẽ ghi vào file với bộ key/value đầu tiên.
            let myData: NSDictionary = [key: value]
            myData.write(to: path, atomically: true)
            return
        }
        // nếu file đã tồn tại chúng ta sẽ update dữ liệu
        myDict[key] = value
        myDict.write(to: path, atomically: true)
        print(path)
    }
    
    func saveContacts() {
           for contact in contactsDictionary {
               saveMyPlist(key: contact.key, value: contact.value)
           }
    }

    
}
