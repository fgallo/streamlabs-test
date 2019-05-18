//
//  MainViewController.swift
//  Streamlabs
//
//  Created by Fernando Gallo on 17/05/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MainViewController: UIViewController {
    
    @IBOutlet weak var titleContainerView: UIView!
    @IBOutlet weak var clipContainerView: UIView!
    @IBOutlet weak var chatContainerView: UIView!
    @IBOutlet weak var userContainerView: UIView!
    
    private let disposeBag = DisposeBag()
    
    var chatViewController: ChatViewController!
    var clipViewController: ClipViewController!
    var titleViewController: TitleViewController!
    var userViewController: UserViewController!
    
    var viewModel: MainViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTabBar()
        getClips()
    }
    
    
    // MARK: - Setup
    
    private func setupView() {
        viewModel = MainViewModel(twitchProvider: TwitchProvider)
        view.backgroundColor = UIColor.StreamlabsColor.Gray.DefaultBackground
        addViewControllers()
    }
    
    private func setupTabBar() {
        UITabBar.appearance().layer.borderWidth = 0.0
        UITabBar.appearance().clipsToBounds = true
        
        tabBarController?.tabBar.barTintColor = UIColor.StreamlabsColor.Gray.DefaultBackground
        tabBarController?.tabBar.isTranslucent = false
        tabBarController?.tabBar.unselectedItemTintColor = UIColor.StreamlabsColor.Gray.TabBar
        tabBarController?.tabBar.tintColor = UIColor.white
        tabBarController?.selectedIndex = 0
        
        let playItem = (tabBarController?.tabBar.items?[0])! as UITabBarItem
        setupTabBar(item: playItem, icon: "ic_play")
        
        let searchItem = (tabBarController?.tabBar.items?[1])! as UITabBarItem
        setupTabBar(item: searchItem, icon: "ic_search")
        
        let notificationItem = (tabBarController?.tabBar.items?[2])! as UITabBarItem
        setupTabBar(item: notificationItem, icon: "ic_notifications")
        
        let profileItem = (tabBarController?.tabBar.items?[3])! as UITabBarItem
        setupTabBar(item: profileItem, icon: "ic_profile")
    }
    
    private func setupTabBar(item: UITabBarItem, icon: String) {
        item.image = UIImage(named: icon)
        item.title = nil
        item.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
    }
    
    private func addChild(_ childController: UIViewController, containerView: UIView) {
        super.addChild(childController)
        let frame = childController.view.frame
        childController.view.frame = CGRect(x: frame.minX,
                                            y: frame.minY,
                                            width: containerView.frame.width,
                                            height: containerView.frame.height)
        containerView.addSubview(childController.view)
    }
    
    private func addViewControllers() {
        chatViewController = UIStoryboard.main.chatViewController
        chatViewController.viewModel = ChatViewModel()
        addChild(chatViewController, containerView: chatContainerView)
        
        clipViewController = UIStoryboard.main.clipViewController
        addChild(clipViewController, containerView: clipContainerView)
        
        titleViewController = UIStoryboard.main.titleViewController
        addChild(titleViewController, containerView: titleContainerView)
        
        userViewController = UIStoryboard.main.userViewController
        addChild(userViewController, containerView: userContainerView)
    }
    
    
    // MARK: - API
    
    private func getClips() {
        viewModel.fetchClips()
            .drive(onNext: { clips in
                let clip = clips[2]
                self.clipViewController.configure(clip: clip)
                self.titleViewController.configure(clip: clip)
            })
            .disposed(by: disposeBag)
    }

}
