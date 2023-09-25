//
//  HeaderHomePageTableViewCell.swift
//  salehere
//
//  Created by Anan Kaewsaart on 21/9/2566 BE.
//

import UIKit

class HeaderHomePageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var background: ViewDarkYellow!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var goalsLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var savingLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var newGoalButton: UIButton!
    
    let identifierCell = "GoalCollectionViewCell"
    var clickGoalButton: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        register()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }
    
    private func register() {
        collectionView.register(UINib(nibName: identifierCell, bundle: nil), forCellWithReuseIdentifier: identifierCell)
    }
    
    @IBAction func newGoalButton(_ sender: Any) {
        UIView.animate(withDuration: 0.2, animations: {
            self.newGoalButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { (completed) in
            UIView.animate(withDuration: 0.2, animations: {
                self.newGoalButton.transform = CGAffineTransform.identity
               
            }) { (completed) in
                self.clickGoalButton?()
            }
        }
        
    }
}

extension HeaderHomePageTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierCell, for: indexPath) as? GoalCollectionViewCell else {
            fatalError("Failed to dequeue GoalCollectionViewCell")
        }
    
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout Methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
 
        let cellWidth = (collectionView.frame.width - 24) / 2.4
        let cellHeight = (collectionView.frame.height)

        return CGSize(width: cellWidth, height: cellHeight)
    }
}
