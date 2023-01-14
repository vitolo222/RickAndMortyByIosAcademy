//
//  RMCharacterViewController.swift
//  Rick&Morty
//
//  Created by vitalik on 12/23/22.
//

import UIKit

/// Controller to seach and show Characters 
final class RMCharacterViewController: UIViewController, RMCharacterListViewDelagate  {
    
    private let characterListView = RMCharacterListView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Characters"
       setUpView()
     
        }
    
    
    private func setUpView() {
        characterListView.delegate = self
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
        //MARK: - RMCharacterListViewDelagate
    
    func rmCharacterListView(_ characterListView: RMCharacterListView, didSelectCharacter character: RMCharacter) {
        // Open Detail controller for that character
        let viewModel = RMCharacterDetailViewViewModel(character: character)
        let detailVC = RMCharacterDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
