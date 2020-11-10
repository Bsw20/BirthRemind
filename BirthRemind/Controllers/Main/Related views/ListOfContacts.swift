//
//  ListOfContacts.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 05.11.2020.
//

import Foundation

class Test {
    private  var df: DateFormatter = {
      var df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy"
        return df
    }()
    
    func generateContacts() -> [ContactModel] {
        let contactsList: [ContactModel] = [
            ContactModel(fullName: "Карпунькин Ярослав", birthdayDate: df.date(from: "1-1-2018"), image: nil),
            ContactModel(fullName: "Иванов Иван", birthdayDate: df.date(from: "17-1-2018"), image: nil),
            ContactModel(fullName: "Удачин Даниил", birthdayDate: df.date(from: "16-1-2018"), image: nil),
            ContactModel(fullName: "Янкин Антон", birthdayDate: df.date(from: "28-2-2018"), image: nil),
            ContactModel(fullName: "Шпоть Валера", birthdayDate: df.date(from: " 31-3-2018"), image: nil),
            ContactModel(fullName: "Власюк Александр", birthdayDate: df.date(from: "1-4-2018"), image: nil),
            ContactModel(fullName: "Иванов Алексей", birthdayDate: df.date(from: "1-5-2018"), image: nil),
            ContactModel(fullName: "Удачин Дмитрий", birthdayDate: df.date(from: "15-5-2018"), image: nil),
            ContactModel(fullName: "Янкин Коля", birthdayDate: df.date(from: "1-6-2018"), image: nil),
            ContactModel(fullName: "Шпоть Владислав", birthdayDate: df.date(from: "16-6-2018"), image: nil),
            ContactModel(fullName: "Власюк Валера", birthdayDate: df.date(from: "31-12-2018"), image: nil),
            ContactModel(fullName: "Шпоть Андрей", birthdayDate: df.date(from: "0"), image: nil),
            ContactModel(fullName: "Власюк Иван", birthdayDate: df.date(from: "0"), image: nil),
            ContactModel(fullName: "Власюк Антон", birthdayDate: df.date(from: "0"), image: nil),
            ContactModel(fullName: "Карпунькин Ярослав", birthdayDate: df.date(from: "1-1-2018"), image: nil),
            ContactModel(fullName: "Иванов Иван", birthdayDate: df.date(from: "17-1-2018"), image: nil),
            ContactModel(fullName: "Удачин Даниил", birthdayDate: df.date(from: "16-1-2018"), image: nil),
            ContactModel(fullName: "Янкин Антон", birthdayDate: df.date(from: "28-2-2018"), image: nil),
            ContactModel(fullName: "Шпоть Валера", birthdayDate: df.date(from: " 31-3-2018"), image: nil),
            ContactModel(fullName: "Власюк Александр", birthdayDate: df.date(from: "1-4-2018"), image: nil),
            ContactModel(fullName: "Иванов Алексей", birthdayDate: df.date(from: "1-5-2018"), image: nil),
            ContactModel(fullName: "Удачин Дмитрий", birthdayDate: df.date(from: "15-5-2018"), image: nil),
            ContactModel(fullName: "Янкин Коля", birthdayDate: df.date(from: "1-6-2018"), image: nil),
            ContactModel(fullName: "Шпоть Владислав", birthdayDate: df.date(from: "16-6-2018"), image: nil),
            ContactModel(fullName: "Власюк Валера", birthdayDate: df.date(from: "31-12-2018"), image: nil),
            ContactModel(fullName: "Шпоть Андрей", birthdayDate: df.date(from: "0"), image: nil),
            ContactModel(fullName: "Власюк Иван", birthdayDate: df.date(from: "0"), image: nil),
            ContactModel(fullName: "Власюк Антон", birthdayDate: df.date(from: "0"), image: nil),
        ]
        return contactsList
    }

}

