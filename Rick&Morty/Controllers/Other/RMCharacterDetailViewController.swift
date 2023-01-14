//
//  RMCharacterDetailViewController.swift
//  Rick&Morty
//
//  Created by vitalik on 12/31/22.
//

import UIKit

/// Controller to show info about single Character
final class RMCharacterDetailViewController: UIViewController {
    private let viewModel: RMCharacterDetailViewViewModel
    
    
    
    //MARK: - Init
    private let detailView: RMCharacterDetailView

    init(viewModel: RMCharacterDetailViewViewModel) {
        self.viewModel = viewModel
        self.detailView  = RMCharacterDetailView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil,
                   bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
        view.addSubview(detailView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(didTapShare))
        addConstrains()
        detailView.collectionView?.delegate = self
        detailView.collectionView?.dataSource = self
    }
    
    
    private func fetchCharactersInfo() {
        
    }
    
    
    @objc
    private  func didTapShare() {
        // share character info
    }
    
    private func addConstrains() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
   
}

    //MARK: - CollectionView
extension RMCharacterDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

            let sectionType = viewModel.sections[section]
        switch sectionType {
        case .photo:
            return 1
        case .information(viewModel:  let viewModel):
            return viewModel.count
        case .episodes(viewModel:  let viewModel):
            return viewModel.count
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = viewModel.sections[indexPath.section]
    switch sectionType {
    case .photo(let viewModel):
       guard let cell = collectionView.dequeueReusableCell(
            
        withReuseIdentifier: RMCharacterPhotoCollectionViewCell.cellIdentifier,
        for: indexPath) as? RMCharacterPhotoCollectionViewCell else {
                fatalError()
            }
        cell.configure(with: viewModel)
        cell.backgroundColor = .red
     
        return cell
    case .information(let viewModels):
        guard let cell = collectionView.dequeueReusableCell(
             
         withReuseIdentifier: RMCharacterInfoCollectionViewCell.cellIdentifier,
             for: indexPath) as? RMCharacterInfoCollectionViewCell else {
                 fatalError()
             }
        cell.configure(with: viewModels[indexPath.row])
         return cell
    case .episodes( let viewModels):
        guard let cell = collectionView.dequeueReusableCell(
             
         withReuseIdentifier: RMCharacterEpisodeCollectionViewCell.cellIdentifier,
             for: indexPath) as? RMCharacterEpisodeCollectionViewCell else {
                 fatalError()
             }
        
        let viewModel = viewModels[indexPath.row]
        cell.configure(with: viewModel)
        return cell
    }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionType = viewModel.sections[indexPath.section]
    switch sectionType {
    case .photo, .information:
        break
    
    case .episodes:
      
        let episodes = self.viewModel.episodes
        let selection = episodes[indexPath.row]
        let vc = RMEpisodeDetailViewController(url: URL(string: selection))
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    }
}
