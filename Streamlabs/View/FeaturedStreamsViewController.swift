//
//  FeaturedStreamsViewController.swift
//  Streamlabs
//
//  Created by Fernando Gallo on 17/05/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class FeaturedStreamsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let disposeBag = DisposeBag()
    
    var viewModel: FeaturedStreamsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()
        getStreams()
    }
    
    
    // MARK: - Setup
    
    private func setupView() {
        viewModel = FeaturedStreamsViewModel(twitchProvider: TwitchProvider)
        view.backgroundColor = UIColor.StreamlabsColor.Gray.DefaultBackground
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: String(describing: FeaturedStreamCollectionViewCell.self), bundle: nil),
                                    forCellWithReuseIdentifier: FeaturedStreamCollectionViewCell.cellIdentifier)
    }
    

    // MARK: - API
    
    private func getStreams() {
        viewModel.fetchFeaturedStreams()
            .drive(onNext: { _ in
                self.getUsers()
            })
            .disposed(by: disposeBag)
    }
    
    private func getUsers() {
        viewModel.fetchUsers()
            .drive(onNext: { _ in
                self.collectionView.reloadData()
            })
            .disposed(by: disposeBag)
    }

}


// MARK: - UICollectionViewDataSource and UICollectionViewDelegate

extension FeaturedStreamsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfStreams()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedStreamCollectionViewCell.cellIdentifier,
                                                      for: indexPath) as! FeaturedStreamCollectionViewCell
        let stream = viewModel.streamForItemAt(indexPath: indexPath)
        cell.configure(stream: stream)
        return cell
    }
    
}

extension FeaturedStreamsViewController: UICollectionViewDelegate {
    
}
