//
//  ClipViewController.swift
//  Streamlabs
//
//  Created by Fernando Gallo on 17/05/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

class ClipViewController: UIViewController {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = UIColor.StreamlabsColor.Gray.DefaultBackground
    }
    
    func configure(clip: Clip) {
        if let thumbnailUrl = clip.thumbnailUrl,
            let url = URL(string: thumbnailUrl) {
            thumbnailImageView.kf.indicatorType = .activity
            thumbnailImageView.kf.setImage(
                with: url,
                placeholder: UIImage(named: "img_clip_placeholder"),
                options: [
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
        }
    }

}
