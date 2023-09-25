//
//  RewardViewController.swift
//  salehere
//
//  Created by Anan Kaewsaart on 20/9/2566 BE.
//

import UIKit

class RewardViewController: UIViewController {

    @IBOutlet weak var backgroundView: ViewDarkYellow!
    @IBOutlet weak var collectionView: UICollectionView!

    let identifierCell = "RewardCollectionViewCell"
    var viewModel: RewardViewModelProtocol = RewardViewModel()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        collectionView.register(UINib(nibName: identifierCell, bundle: nil), forCellWithReuseIdentifier: identifierCell)
    }
    
    private func setupView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout

        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 20
    }
}

extension RewardViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.output.itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierCell, for: indexPath) as? RewardCollectionViewCell else {
            fatalError("Failed to dequeue RewardCollectionViewCell")
        }
    
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout Methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
 
        let cellWidth = (collectionView.frame.width - 24) / 3
        return CGSize(width: cellWidth, height: cellWidth)
    }
}
