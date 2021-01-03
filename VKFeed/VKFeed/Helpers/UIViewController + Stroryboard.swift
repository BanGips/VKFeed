//
//  UIViewController + Stroryboard.swift
//  VKFeed
//
//  Created by BanGips on 3.01.21.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func loadFromStoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error: No initial ViewController in \(name) storyboard")
        }
    }
}
