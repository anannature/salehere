//
//  RewardCollectionViewCell.swift
//  salehere
//
//  Created by Anan Kaewsaart on 21/9/2566 BE.
//

import UIKit

class RewardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var background: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        background.layer.borderWidth = 1.0
        background.layer.borderColor = UIColor.red.cgColor
    }

}
