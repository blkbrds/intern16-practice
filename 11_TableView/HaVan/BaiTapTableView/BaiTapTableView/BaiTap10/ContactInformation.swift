//
//  ContactInformation.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/30/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import Contacts



struct ExpandableNames {
    var isExpanded: Bool
    var names: [FavoritableContact]
}

struct FavoritableContact {
    let contact: CNContact
    var hasFavorited: Bool
}

final class ContactInformation {

    static let shared = ContactInformation()

    var contacts: [String: String] = [String: String]()
    
    func readPropertyList() {
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

final class ManagementContact {
    
    var contactsDictionary: [String: String] = [String: String]()
    

    func fetchContacts() {
        print("Attempting to fetch contacts today..")

        let store = CNContactStore()

        store.requestAccess(for: .contacts) { (granted, err) in
            if let err = err {
                print("Failed to request access:", err)
                return
            }

            if granted {
                print("Access granted")

                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])

                do {
                    var favoritableContacts = [FavoritableContact]()

                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointerIfYouWantToStopEnumerating) in

                        print(contact.givenName)
                        print(contact.familyName)
                        print(contact.phoneNumbers.first?.value.stringValue ?? "")

                        favoritableContacts.append(FavoritableContact(contact: contact, hasFavorited: false))
                    })

                    let _ = ExpandableNames(isExpanded: true, names: favoritableContacts)

                } catch let err {
                    print("Failed to enumerate contacts:", err)
                }

            } else {
                print("Access denied..")
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
