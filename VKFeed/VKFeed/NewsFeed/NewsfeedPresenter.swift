//
//  NewsfeedPresenter.swift
//  VKFeed
//
//  Created by BanGips on 4.01.21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
  func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
  weak var viewController: NewsfeedDisplayLogic?
  
  func presentData(response: Newsfeed.Model.Response.ResponseType) {
    
    switch response {
    
    case .some:
        print("some presentor")
    case .presentNewsfeed:
        print("presentNewsfeed presentor")
        viewController?.displayData(viewModel: .displayNewsfeed)
    }
  
  }
  
}
