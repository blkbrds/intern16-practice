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
                        self.contactsDictionary[contact.givenName + contact.familyName] = contact.phoneNumbers.first?.value.stringValue ?? ""
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
    
    var sectionCharacter: Set<Character> = Set<Character>()
    var sectionIndex =  [Character]()
    
    func transContacts(with contacts: [String]) -> [[String]] {
        var tempList: [[String]] = [[String]]()
        let newContact = contacts.sorted { $0 < $1 }
        var new = [String]()
        // trim the leading space of each contact and append it into a new array
        // then, add the first letter of each contact into a set
        for contact in newContact {
            let temp = contact.trimmingCharacters(in: .whitespacesAndNewlines)
            new.append(temp)
            if let character = temp.first {
                sectionCharacter.insert(character)
            }
        }
        // sort that set
        sectionIndex = sectionCharacter.sorted(by: {$0 < $1})
        // each character in that set, create a array to save contacts have the same first character
        // then, add all arrays into a array
        for character in sectionIndex {
            var temp: [String] = []
            for contact in new {
                if contact.first == character {
                    temp.append(contact)
                }
            }
            tempList.append(temp)
            temp = [String]()
        }
        return tempList
    }
}
