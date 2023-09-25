//
//  GoalCategoryTableViewCell.swift
//  salehere
//
//  Created by Anan Kaewsaart on 21/9/2566 BE.
//

import UIKit

class GoalCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    let identifierCell = "RewardCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        register()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
    
    }
    
    private func register() {
        collectionView.register(UINib(nibName: identifierCell, bundle: nil), forCellWithReuseIdentifier: identifierCell)
    }
    
}

extension GoalCategoryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierCell, for: indexPath) as? RewardCollectionViewCell else {
            fatalError("Failed to dequeue RewardCollectionViewCell")
        }
        cell.background.layer.cornerRadius = 8
        cell.background.layer.borderWidth = 1.5
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout Methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.width - 50) / 3
        let cellHeight = (collectionView.frame.height - 50) / 2
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
