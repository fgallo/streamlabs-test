//
//  UIStoryboard.swift
//  Streamlabs
//
//  Created by Fernando Gallo on 17/05/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    @nonobjc static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    var chatViewController: ChatViewController {
        guard let viewController =
            UIStoryboard.main.instantiateViewController(withIdentifier: "ChatViewController") as? ChatViewController else {
                fatalError("ChatViewController couldn't be found in Storyboard file")
        }
        return viewController
    }
    
    var clipViewController: ClipViewController {
        guard let viewController =
            UIStoryboard.main.instantiateViewController(withIdentifier: "ClipViewController") as? ClipViewController else {
                fatalError("ClipViewController couldn't be found in Storyboard file")
        }
        return viewController
    }
    
    var titleViewController: TitleViewController {
        guard let viewController =
            UIStoryboard.main.instantiateViewController(withIdentifier: "TitleViewController") as? TitleViewController else {
                fatalError("TitleViewController couldn't be found in Storyboard file")
        }
        return viewController
    }
    
    var userViewController: UserViewController {
        guard let viewController =
            UIStoryboard.main.instantiateViewController(withIdentifier: "UserViewController") as? UserViewController else {
                fatalError("UserViewController couldn't be found in Storyboard file")
        }
        return viewController
    }
    
}
