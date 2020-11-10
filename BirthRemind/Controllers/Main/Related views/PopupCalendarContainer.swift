//
//  PopupCalendarContainer.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 06.11.2020.
//

import Foundation
import UIKit
import FSCalendar

class PopupCalendarContainer: UIView {
    var calendar: FSCalendar = FSCalendar(frame: .zero)
    public var isActive = false
    private var control = UIControl(frame: .zero)
    weak var delegate: MainAppViewController?
    
    init() {
        super.init(frame: CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height) )
        setupCalendar()
        setupConstraints()
        isUserInteractionEnabled = true
        backgroundColor = UIColor.lightGray
        backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8274509804, blue: 0.8274509804, alpha: 0.5)
        control.backgroundColor = .clear

        control.addTarget(self, action: #selector(controlTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func controlTapped() {
        print("control tapped")
        delegate?.hidePopup()
    }
    
    func setupCalendar() {
        let calendarColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        calendar.calendarHeaderView.backgroundColor =  calendarColor
        calendar.calendarWeekdayView.backgroundColor = calendarColor
        calendar.appearance.selectionColor = #colorLiteral(red: 0.003921568627, green: 0.5725490196, blue: 0.9333333333, alpha: 1)
        calendar.appearance.todayColor = .yellow
        calendar.backgroundColor = calendarColor
        calendar.appearance.titleDefaultColor = .black
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.weekdayTextColor = .black
        calendar.scope =  .month
        //TODO: Download fonts
        
        calendar.select(Date())
        
        calendar.calendarHeaderView.calendar.locale = Locale(identifier: "ru_RU")
        calendar.calendarWeekdayView.calendar.locale = Locale(identifier: "ru_RU")
        //calendar.calend.calendar.locale = Locale(identifier: "ru_RU")
        
        calendar.appearance.headerDateFormat = "LLLL, YYYY"
        calendar.appearance.titleFont = UIFont.boldSystemFont(ofSize: 16)
        calendar.appearance.weekdayFont = UIFont.boldSystemFont(ofSize: 14)
        calendar.appearance.headerTitleFont =  UIFont.boldSystemFont(ofSize: 18)
//        calendar.appearance.color = .white
        calendar.layer.masksToBounds = true
        calendar.layer.cornerRadius = 13
    }
}

extension PopupCalendarContainer {
    private func setupConstraints() {
        calendar.translatesAutoresizingMaskIntoConstraints = false
        control.translatesAutoresizingMaskIntoConstraints = false
        addSubview(calendar)
        addSubview(control)
        NSLayoutConstraint.activate([
            calendar.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3),
            calendar.leadingAnchor.constraint(equalTo: leadingAnchor),
            calendar.trailingAnchor.constraint(equalTo: trailingAnchor),
            calendar.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            control.topAnchor.constraint(equalTo: topAnchor),
            control.leadingAnchor.constraint(equalTo: leadingAnchor),
            control.trailingAnchor.constraint(equalTo: trailingAnchor),
            control.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIScreen.main.bounds.height / 3)
        ])
    }
}
