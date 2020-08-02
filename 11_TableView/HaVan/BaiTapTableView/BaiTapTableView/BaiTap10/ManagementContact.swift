//
//  ContactInformation.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/30/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import Contacts

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
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointerIfYouWantToStopEnumerating) in
                        
                        print(contact.givenName)
                        print(contact.familyName)
                        print(contact.phoneNumbers.first?.value.stringValue ?? "")
                        self.contactsDictionary[contact.givenName + " " + contact.familyName] = contact.phoneNumbers.first?.value.stringValue ?? ""
                    })
                } catch let err {
                    print("Failed to enumerate contacts:", err)
                }
            } else {
                print("Access denied..")
            }
        }
    }
}

final class Contact {
    var listContacts: [[String: String]] = [[String : String]]()
    
    func arrageContacts(with list: [String]) {
        var newList = [String]()
        for index in list {
            newList.append(index.trimmingCharacters(in: .whitespacesAndNewlines))
        }
    }
}
