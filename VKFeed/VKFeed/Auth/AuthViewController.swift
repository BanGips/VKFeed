//
//  AuthViewController.swift
//  VKFeed
//
//  Created by BanGips on 3.01.21.
//

import UIKit

class AuthViewController: UIViewController {

    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        authService = AuthService()
        authService = AppDelegate.shared().authService
    }
    @IBAction func singInTouch() {
            
        authService.wakeUpSession()
        
    }
    
}
