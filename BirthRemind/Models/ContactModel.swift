//
//  ContactModel.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 04.11.2020.
//

import Foundation
import UIKit

class ContactModel: Hashable { //MARK: - раньше это была структура, мб переделать
    init(fullName: String, birthdayDate: Date?, image: Data?){
        self.fullName = fullName
        self.birthdayDate = birthdayDate
        dateFormatter.locale = .current
        dateFormatter.setLocalizedDateFormatFromTemplate("MMM d, yyyy")
        self.profileImageData = image //TODO: If nil use default image
        id = UUID()
    }
    var id: UUID
    private var dateFormatter = DateFormatter()
    private var profileImageData: Data?
    
    var birthdayDate: Date?
    var fullName: String
    
    
    var stringBirthdayDate: String{
        if let date = birthdayDate{
            return dateFormatter.string(from: date)
        }
        return "Unspecified"
    }
    
    
    var age: String {
        if let birthday = birthdayDate{
            let calender = Calendar.current

            let dateComponent = calender.dateComponents([.year, .month, .day], from:
            birthday, to: Date())
            let age = dateComponent.year
            if let age = age{
                return "\(age + 1) years old" //TODO: Check it (+1 or no)-
            }
        }

        return "" //TODO
    }
    
    var profileImage: UIImage {
        if let data = profileImageData, let image =  UIImage(data: data){
            return image
        }
        return UIImage(systemName: "person.circle.fill")!
    }
    
    var isSelected = false
    public func changeState() {
        self.isSelected = !isSelected
    }
    
    func hash(into hasher: inout Hasher) {
      // 2
      hasher.combine(id)
    }

    static func == (lhs: ContactModel, rhs: ContactModel) -> Bool {
      lhs.id == rhs.id
    }
    
    func contains(filter: String?) -> Bool {
        guard let filter = filter else { return true }
        
        if filter.isEmpty {
            return true
        }
        
        let lowercasedFilter = filter.lowercased()
        return fullName.lowercased().contains(lowercasedFilter)
    }
    
    

    
    
}
