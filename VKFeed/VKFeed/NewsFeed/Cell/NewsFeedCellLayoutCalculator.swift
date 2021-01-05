//
//  NewsFeedCellLayoutCalculator.swift
//  VKFeed
//
//  Created by BanGips on 5.01.21.
//

import Foundation
import UIKit

struct Sizes: FeedCellSizes {
    var postLabelFrame: CGRect
    var ataachmentFrame: CGRect
}

protocol FeedCellLayoutCalculatorProtocol {
     func sizes(post: String?, photoAttachment: FeedCellPhotoAttachmentViewModel?) -> FeedCellSizes
}

final class FeedCellLayoutCalculator: FeedCellLayoutCalculatorProtocol {
    
    
    private let screenWidth: CGFloat
    
    init(screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidth = screenWidth
    }
    
    func sizes(post: String?, photoAttachment: FeedCellPhotoAttachmentViewModel?) -> FeedCellSizes {

        return Sizes(postLabelFrame: CGRect.zero, ataachmentFrame: CGRect.zero)
    }
}
