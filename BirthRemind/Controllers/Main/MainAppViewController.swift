//
//  MainAppViewController.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 05.11.2020.
//

import Foundation
import UIKit
import FSCalendar

class MainAppViewController: UIViewController {
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, ContactModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, ContactModel>
    
    var sections: [Section]
    var calendarView: PopupCalendarContainer = PopupCalendarContainer()
    var currentYear: String
    
    init() {
        currentYear = "\(Calendar.current.dateComponents([.year], from: Date()).year!)"
        let contacts = Test().generateContacts()
        sections = Section.generateSections(from: contacts)
        super.init(nibName: nil, bundle: nil)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var collectionView: UICollectionView!
    var dataSource: DataSource? //TODO: make it lazy
    var topBarHeight: CGFloat {
        navigationController?.navigationBar.wholeHeight ?? 0.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        makeDataSource()
        reloadData(with: nil)
        setupCalendar()
        setupConstraints()
        calendarView.delegate = self
    }
    private func setupCalendar() {
        calendarView.calendar.delegate = self
        calendarView.calendar.dataSource = self
        calendarView.calendar.register(FSCalendarCell.self, forCellReuseIdentifier: "usualCell")
        calendarView.tag = 100
    }
    
    
    private func setupUI() {
        setupSearchBar()
        setupCollectionView()
        let calendarButton = UIBarButtonItem(image: UIImage(systemName: "calendar"), style: .plain, target: self, action: #selector(calendarButtonTapped))
        navigationItem.rightBarButtonItem = calendarButton
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.title = "Дни рождения"
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @objc func calendarButtonTapped() {
        print(#function)
        if calendarView.isActive{
            hidePopup()
        } else {
            showPopup()
        }

        
    }
    internal func hidePopup() {
        print("removing")
        let screenSize = UIScreen.main.bounds.size

        UIView.animate(withDuration: 0.5,
                         delay: 0, usingSpringWithDamping: 1.0,
                         initialSpringVelocity: 1.0,
                         options: .curveEaseInOut, animations: {
                            self.calendarView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.calendarView.frame.height)
          }, completion: nil)
        calendarView.isActive = false
    }
    private func showPopup() {
        let screenSize = UIScreen.main.bounds.size
        view.addSubview(calendarView)
        UIView.animate(withDuration: 0.5,
                         delay: 0, usingSpringWithDamping: 1.0,
                         initialSpringVelocity: 1.0,
                         options: .curveEaseInOut, animations: {
                            self.calendarView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: self.calendarView.frame.height)
          }, completion: nil)
        calendarView.isActive = true
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds,collectionViewLayout: createCompositionalLayout())
        collectionView.register(SectionHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderReusableView.reuseId)
        
//        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.register(ContactCell.self, forCellWithReuseIdentifier: ContactCell.reuseId)
        collectionView.delegate = self
        collectionView.backgroundColor = .white
//        collectionView.allowsMultipleSelection = true
        

    }
    
    private func reloadData(with searchText: String?) {
        var filtred: [Section] = []
        sections.forEach { (section) in
            print("-------------------------------- ")
            if let filtredSection = section.contains(filter: searchText) {
                filtred.append(filtredSection)
            }
            print("-------------------------------- ")
        }

        
        var snapshot = Snapshot()
        snapshot.appendSections(filtred)
        filtred.forEach { (section) in
            snapshot.appendItems(section.contacts, toSection: section)
        }
        if let dataSource = dataSource {
            dataSource.apply(snapshot, animatingDifferences: true)
        } else {
            //MARK: - show error message
        }

    }
    
    private func setupSearchBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.shadowImage?.withTintColor(.blue)
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        navigationItem.searchController?.searchBar.backgroundColor = .white
        
    }
    
    
}
//MARK: - DataSource
extension MainAppViewController {
    private func makeDataSource() {

        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, contact) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContactCell.reuseId, for: indexPath) as! ContactCell//TODO: check ! or ?
            cell.mainConfigure(contact: contact)
            print("-----------------------")
            print("config \(contact.fullName)")
            print("index path \(indexPath)")
            print("-----------------------")
            return cell
        })
        dataSource?.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard kind == UICollectionView.elementKindSectionHeader else {
                return nil
            }
            let section = self.dataSource?.snapshot().sectionIdentifiers[indexPath.section]
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                       withReuseIdentifier: SectionHeaderReusableView.reuseId,
                                                                       for: indexPath) as? SectionHeaderReusableView
            if section?.title == "Unspecified" {
                view?.titleLabel.text = " \(String(describing: section!.title))      "
            }
            else {view?.titleLabel.text = " \(String(describing: section!.title)), \(self.currentYear)      "
            }
            return view
        }
    }
}
//MARK: - Layout
extension MainAppViewController {
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in
            
            let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(70))
            let item = NSCollectionLayoutItem(layoutSize: size)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            
            let spacing = CGFloat(15)
            section.interGroupSpacing = spacing
            section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 15)
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(25))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            section.boundarySupplementaryItems = [sectionHeader]
            
            return section
        }
        return layout
            
    }
    
}

extension MainAppViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(#function)
        reloadData(with: searchText) //TODO: - Fix cancel button
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        reloadData(with: nil)
    }

}

//MARK: - Collection View
extension MainAppViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
        print(indexPath)
        guard let contact = dataSource?.itemIdentifier(for: indexPath) else {
          return
        }
        let cell = collectionView.cellForItem(at: indexPath) as! ContactCell
        cell.cellTapped(by: contact)
    }
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        print(#function)
//        print(indexPath)
//        let cell = collectionView.cellForItem(at: indexPath) as! ContactCell
//        cell.cellTapped()
//    }
}

//MARK: - Calendar
extension MainAppViewController: FSCalendarDelegate {
    
}
extension MainAppViewController: FSCalendarDataSource {
    
}

//MARK: - Constraints
extension MainAppViewController {
    private func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: navigationController?.navigationBar.wholeHeight ?? 0)

        ])
    }
}

//MARK: - SwiftUI
import SwiftUI

struct MainAppVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = MainAppViewController()
        
        func makeUIViewController(context: Context) -> some MainAppViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}


