//
//  Section.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 05.11.2020.
//

import Foundation
import UIKit


class Section: Hashable, CustomStringConvertible {

    
    var id = UUID()
    
    var title: String
    var contacts: [ContactModel]
    
    init(title: String, contacts: [ContactModel]) {
      self.title = title
      self.contacts = contacts
    }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(id)
    }
    
    static func == (lhs: Section, rhs: Section) -> Bool {
      lhs.id == rhs.id
    }
    
    var description: String {
        var string = title + "\n"
        for contact in contacts {
            string += contact.fullName + " " + contact.stringBirthdayDate + "\n"
        }
        return string
    }
    public func contains(filter: String?) -> Section? {
        guard let filter = filter else {
            return self
        }
        
        let newSection = Section(title: self.title, contacts: [])
        newSection.contacts = contacts.filter { (user) -> Bool in
//            print(user.fullName)
//            print("search text \()")
            return user.contains(filter: filter)
        }
        if newSection.contacts.count > 0 {
            return newSection
        }
        return nil

    }
    
    static func generateSections(from contacts: [ContactModel]) -> [Section] { //MARK: - recode + may be return nil
        var allSections: [Section?] = Array(repeating: nil, count: 13)
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL"
        let calendar = Calendar.current
//        _ = Section(title: "check", contacts: [contacts[0]])
        for contact in contacts {
            
            if let bd = contact.birthdayDate {
                let monthNumber = calendar.dateComponents([.month], from: bd).month! //MARK: - CHECK for !
                if let contactSection = allSections[monthNumber-1] {
                    contactSection.contacts.append(contact)
                } else {
                    let title = formatter.string(from: bd)
                    let contactSection = Section(title: title, contacts: [contact])
                    allSections[monthNumber-1] = contactSection
                }
            } else {
                if let contactSection = allSections[12] {
                    contactSection.contacts.append(contact)
                } else {
                    let contactSection = Section(title: contact.stringBirthdayDate, contacts: [contact])
                    allSections[12] = contactSection
                }
            }
        }
        var final: [Section] = []
        for sect in allSections {
            if let section = sect, section.title == "Unspecified" {
                final.append(section)
                continue
            }
            if let sect = sect {
                sect.contacts.sort { (first, second) -> Bool in
                    first.birthdayDate! <= second.birthdayDate!
                }
                final.append(sect)
            }
        }
        for sect in final {
            print(sect)
        }
        return final
    }
}
