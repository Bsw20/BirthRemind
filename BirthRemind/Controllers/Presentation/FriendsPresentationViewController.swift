//
//  FriendsPresentationViewController.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 04.11.2020.
//

import Foundation
import UIKit

protocol FriendsControllerDelegate: class {
    func controllerDidFinish(_ controller: FriendsPresentationViewController)
}

class FriendsPresentationViewController: UIViewController{
    typealias DataSource = UICollectionViewDiffableDataSource<Section, ContactModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, ContactModel>
    
    enum Section: Int, CaseIterable{
        case contacts
        
//        func description(usersCount: Int) -> String {
//            switch self {
//            case .users:
//                return "\(usersCount) people nearby"
//            }
//        }
    }
    private var contacts: [ContactModel]
    init() {
//        self.contacts = [
//            ContactModel(fullName: "Карпунькин Ярослав", birthdayDate: Date(), image: nil),
//            ContactModel(fullName: "Иванов Иван", birthdayDate: Date(), image: nil),
//            ContactModel(fullName: "Удачин Даниил", birthdayDate: Date(), image: nil),
//            ContactModel(fullName: "Янкин Антон", birthdayDate: Date(), image: nil),
//            ContactModel(fullName: "Шпоть Валера", birthdayDate: Date(), image: nil),
//            ContactModel(fullName: "Власюк Александр", birthdayDate: Date(), image: nil),
//            ContactModel(fullName: "Иванов Иван", birthdayDate: Date(), image: nil),
//            ContactModel(fullName: "Удачин Даниил", birthdayDate: Date(), image: nil),
//            ContactModel(fullName: "Янкин Антон", birthdayDate: Date(), image: nil),
//            ContactModel(fullName: "Шпоть Валера", birthdayDate: Date(), image: nil),
//            ContactModel(fullName: "Власюк Александр", birthdayDate: Date(), image: nil)
//        ]
        self.contacts = Test().generateContacts()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal weak var coordinatorDelegate: FriendsControllerDelegate?
    
    var collectionView: UICollectionView!
    var dataSource: DataSource! //TODO: make it lazy
    
    
    var topBarHeight: CGFloat {
        navigationController?.navigationBar.wholeHeight ?? 0.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        makeDataSource()
        reloadData(with: nil)
        setupConstraints()
    }
    


    
    private func setupUI() {
        setupSearchBar()
        setupCollectionView()
        let finishButton = UIBarButtonItem(image: UIImage(systemName: "checkmark"), style: .plain, target: self, action: #selector(finishBButtonTapped ))
        navigationItem.rightBarButtonItem = finishButton
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.register(ContactCell.self, forCellWithReuseIdentifier: ContactCell.reuseId)
        collectionView.delegate = self
        collectionView.backgroundColor = .white
    }
    
    private func setupSearchBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.shadowImage = UIImage()
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
    }
    
    @objc func finishBButtonTapped() {
        print(#function)
        
    }
    private func reloadData(with searchText: String?) {
        let filtred = contacts.filter { (user) -> Bool in
            user.contains(filter: searchText)
        }

        
        var snapshot = Snapshot()
        snapshot.appendSections([.contacts])
        snapshot.appendItems(filtred,toSection: .contacts)
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

//MARK: - DataSource
extension FriendsPresentationViewController {
    private func makeDataSource() {

        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, contact) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContactCell.reuseId, for: indexPath) as! ContactCell//TODO: check ! or ?
            cell.friendsConfigure(contact: contact)
            return cell
        })
    }
}

//MARK: - Layout
extension FriendsPresentationViewController {
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in
            
            guard let section = Section(rawValue: sectionIndex) else {
                fatalError("Unknown section kind")
            }
            
            switch section {
            
            case .contacts:
                return self.createContactsSection()
            }
        }
        return layout
            
    }
    
    private func createContactsSection() -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(70))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        let spacing = CGFloat(15)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 15)
        
        return section
    }
}


extension FriendsPresentationViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        reloadData(with: searchText) //TODO: - Fix cancel button
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        reloadData(with: nil)
    }

}

//MARK: - Constraints
extension FriendsPresentationViewController {
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

//MARK: - Collection View
extension FriendsPresentationViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let contact = dataSource.itemIdentifier(for: indexPath) else  { return } //Получить именно контакт а не ячейку
        
        print(#function)
        let cell = collectionView.cellForItem(at: indexPath) as? ContactCell
        cell?.cellTapped(by: contact)
    }
}




import SwiftUI

struct FriendsPresentationVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = FriendsPresentationViewController()
        
        func makeUIViewController(context: Context) -> some FriendsPresentationViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

