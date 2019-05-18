//
//  FeaturedStreamCollectionViewCell.swift
//  Streamlabs
//
//  Created by Fernando Gallo on 17/05/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit
import Kingfisher

class FeaturedStreamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userBackgroundView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let cellIdentifier = "FeaturedStreamCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    
    // MARK: - Setup
    
    private func setupView() {
        userImageView.layer.borderWidth = 3.0
        userImageView.layer.borderColor = UIColor.StreamlabsColor.Gray.DefaultBackground.cgColor
        userImageView.layer.cornerRadius = userImageView.frame.height/2
        userImageView.clipsToBounds = true
        
        userBackgroundView.layer.cornerRadius = userBackgroundView.frame.height/2
        userBackgroundView.clipsToBounds = true
        
        nameLabel.textColor = UIColor.StreamlabsColor.Gray.StreamOnline
        
        
        userBackgroundView.setGradientBackground(colorTop: UIColor.StreamlabsColor.Orange.TopBackground,
                                                 colorBottom: UIColor.StreamlabsColor.Violet.BottomBackground)
        
    }

    func configure(stream: Stream) {
        if let profileUrl = stream.user?.profileImageUrl,
            let url = URL(string: profileUrl) {
            userImageView.kf.indicatorType = .activity
            userImageView.kf.setImage(
                with: url,
                placeholder: UIImage(named: "ic_user_placeholder"),
                options: [
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
        }

        nameLabel.text = stream.userName
    }
    
}
