//
//  ChatViewController.swift
//  Streamlabs
//
//  Created by Fernando Gallo on 17/05/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ChatViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0.0, y: tableView.frame.maxY - 28, width: tableView.frame.width, height: 28)
        gradient.colors = [UIColor.StreamlabsColor.Gray.DefaultBackground.withAlphaComponent(0.12).cgColor,
                           UIColor.StreamlabsColor.Gray.DefaultBackground.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradient, above: tableView.layer)
    }
    
    // MARK: - Setup
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: ChatTableViewCell.self), bundle: nil),
                                forCellReuseIdentifier: ChatTableViewCell.cellIdentifier)
    }
    
}

extension ChatViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfMessages()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.cellIdentifier,
                                                 for: indexPath) as! ChatTableViewCell
        let message = viewModel.messageAt(indexPath: indexPath)
        cell.configure(message: message)
        return cell
    }
    
}

extension ChatViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ChatTableViewCell.cellHeight
    }
    
}
