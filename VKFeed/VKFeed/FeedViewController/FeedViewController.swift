//
//  FeedViewController.swift
//  VKFeed
//
//  Created by BanGips on 3.01.21.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    
        fetcher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else { return }
             feedResponse.items.map { feedItem in
                print(feedItem.date)
            }
        }
    }
    
}
