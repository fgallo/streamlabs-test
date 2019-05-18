//
//  UserViewController.swift
//  Streamlabs
//
//  Created by Fernando Gallo on 17/05/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    
    private let minGlowSize: CGFloat = 0.0
    private let maxGlowSize: CGFloat = 80.0
    private let animDuration = 0.3
    private var counter = 1
    private var fontSize: CGFloat = 12
    private var bounce = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    // MARK: - Setup
    
    private func setupView() {
        setupButton()
        userImageView.layer.cornerRadius = userImageView.frame.height/2
        userImageView.clipsToBounds = true
    }
    
    func setupButton() {
        let cornerRadius: CGFloat = starButton.frame.height/2
        
        starButton.layer.cornerRadius = cornerRadius
        starButton.layer.shadowPath = CGPath(roundedRect: starButton.bounds,
                                             cornerWidth: cornerRadius,
                                             cornerHeight: cornerRadius,
                                             transform: nil)
        starButton.layer.shadowColor = UIColor.StreamlabsColor.Orange.Star.cgColor
        starButton.layer.shadowOffset = CGSize.zero
        starButton.layer.shadowRadius = minGlowSize
        starButton.layer.shadowOpacity = 1
        starButton.backgroundColor = .white
    }
    
    
    // MARK: - IBActions
    
    @IBAction func starButtonTapped(_ sender: UIButton) {
        createAnimationLabel(withNumber: counter, withSize: fontSize)
        updateCounterLabel()
        
        if !bounce {
            bounceAnimation()
            bounce = true
        } else {
            glowAnimation()
        }
    }
    
    private func updateCounterLabel() {
        counterLabel.text = "\(counter)"
        counter += 1
        fontSize += 1
    }
    
    
    // MARK: - Animations
    
    private func bounceAnimation() {
        UIView.animate(withDuration: animDuration, animations: {
            self.starButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: { _ in
            UIView.animate(withDuration: self.animDuration, animations: {
                self.starButton.transform = CGAffineTransform.identity
            }, completion: { _ in
                UIView.animate(withDuration: self.animDuration, animations: {
                    self.glowAnimation()
                    self.starButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                }, completion: { _ in
                    UIView.animate(withDuration: self.animDuration, animations: {
                        self.starButton.transform = CGAffineTransform.identity
                    })
                })
            })
        })
    }
    
    private func glowAnimation() {
        let layerAnimation = CABasicAnimation(keyPath: "shadowRadius")
        layerAnimation.fromValue = minGlowSize
        layerAnimation.toValue = maxGlowSize
        layerAnimation.autoreverses = false
        layerAnimation.isAdditive = false
        layerAnimation.duration = CFTimeInterval(animDuration)
        layerAnimation.fillMode = .backwards
        layerAnimation.isRemovedOnCompletion = false
        layerAnimation.repeatCount = 1
        starButton.layer.add(layerAnimation, forKey: "glowingAnimation")
    }
    
    private func createAnimationLabel(withNumber number: Int, withSize size: CGFloat) {
        let label = UILabel(frame: CGRect(origin: .zero,
                                          size: CGSize(width: size*3, height: size*3)))
        label.text = "+\(number)"
        label.textColor = UIColor.random()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: size)
        
        UIGraphicsBeginImageContextWithOptions(label.bounds.size, false, 0)
        label.drawHierarchy(in: label.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let numberImageView = UIImageView(frame: starButton.frame)
        numberImageView.image = image
        view.addSubview(numberImageView)
        
        animate(imageView: numberImageView)
        
        UIView.animate(withDuration: 0.8, animations: {
            numberImageView.alpha = 0.0
        }) { _ in
            numberImageView.removeFromSuperview()
        }
    }
    
    private func animate(imageView: UIImageView) {
        let x1: CGFloat = CGFloat.random(in: starButton.frame.origin.x..<(starButton.frame.origin.x + starButton.frame.size.width))
        let y1: CGFloat = imageView.frame.origin.y
        let x2: CGFloat = x1
        let y2: CGFloat = -300

        let upPath = UIBezierPath()
        upPath.move(to: CGPoint(x: x1, y: y1))
        upPath.addLine(to: CGPoint(x: x2, y: y2))
        
        let pathAnimation = CAKeyframeAnimation(keyPath: "position")
        pathAnimation.duration = 0.8
        pathAnimation.path = upPath.cgPath
        pathAnimation.fillMode = .forwards
        pathAnimation.isRemovedOnCompletion = false
        imageView.layer.add(pathAnimation, forKey: "movingAnimation")
    }

}
