//
//  FeedViewController.swift
//  VKFeed
//
//  Created by BanGips on 3.01.21.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let network = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        network.getFeed()
    }
    
}
