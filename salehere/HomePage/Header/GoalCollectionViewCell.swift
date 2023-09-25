//
//  GoalCollectionViewCell.swift
//  salehere
//
//  Created by Anan Kaewsaart on 21/9/2566 BE.
//

import UIKit

class GoalCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var feelingLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var moneySavedLabel: UILabel!
    @IBOutlet weak var moneyToSaveLabel: UILabel!
    @IBOutlet weak var progressVew: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        background.layer.cornerRadius = 12
        background.layer.borderWidth = 1.2
        moneySavedLabel.textColor = UIColor.red
        setupHappy()
    }
    
    func configure() {}
    
    private func setupHappy() {
        background.layer.borderColor = UIColor.green.cgColor
        feelingLabel.textColor = UIColor.green
    }
    
    private func setupUnHappy() {
        background.layer.borderColor = UIColor.red.cgColor
        feelingLabel.textColor = UIColor.red
    }
}
