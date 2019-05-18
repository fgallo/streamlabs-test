//
//  TitleViewController.swift
//  Streamlabs
//
//  Created by Fernando Gallo on 17/05/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {
    
    @IBOutlet weak var favoriteView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewCountLabel: UILabel!
    @IBOutlet weak var creatorNameLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    

    // MARK: - Setup
    
    private func setupView() {
        favoriteView.layer.cornerRadius = 4.0
        view.backgroundColor = UIColor.StreamlabsColor.Gray.DefaultBackground
    }
    
    func configure(clip: Clip) {
        titleLabel.text = clip.title
        creatorNameLabel.text = "Jinjuh" // clip.creatorName
        
        if let date = clip.createdAtDate() {
            createdAtLabel.text = "clipped \(date.getElapsedInterval())"
        } else {
            createdAtLabel.text = ""
        }

        viewCountLabel.text = "\(clip.viewCount?.formatIntToString() ?? "0") views"
    }
    
}
