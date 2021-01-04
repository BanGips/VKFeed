//
//  NewsfeedModels.swift
//  VKFeed
//
//  Created by BanGips on 4.01.21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Newsfeed {
   
  enum Model {
    struct Request {
      enum RequestType {
        case some
        case getFeed
      }
    }
    struct Response {
      enum ResponseType {
        case some
        case presentNewsfeed
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case some
        case displayNewsfeed
      }
    }
  }
  
}
