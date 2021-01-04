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
    lazy var dateFormatter: DateFormatter = {
        let dt = DateFormatter()
        dt.locale = Locale(identifier: "ru_RU")
        dt.dateFormat = "d MMM 'в' HH:mm"
        return dt
    }()
    
    func presentData(response: Newsfeed.Model.Response.ResponseType) {
        
        switch response {
        case .presentNewsfeed(let feed):
            

            let cells = feed.items.map { cellViewModel(from: $0, profile: feed.profiles, groups: feed.groups) }
            
            let feedViewModel = FeedViewModel(cells: cells)
            viewController?.displayData(viewModel: .displayNewsfeed(feedViewModel: feedViewModel))
        }
        
    }
    
    private func cellViewModel(from feedItem: FeedItem, profile: [Profile], groups: [Group]) -> FeedViewModel.Cell {
        let profile = self.profile(for: feedItem.sourceId, profile: profile, groups: groups)
        let date = Date(timeIntervalSince1970: feedItem.date)
        let dateTitle = dateFormatter.string(from: date)
        
        return FeedViewModel.Cell(iconUrlString: profile.photo,
                                  name: profile.name,
                                  date: dateTitle,
                                  text: feedItem.text,
                                  likes: String(feedItem.likes?.count ?? 0),
                                  comments: String(feedItem.comments?.count ?? 0),
                                  shares: String(feedItem.reposts?.count ?? 0),
                                  views: String(feedItem.views?.count ?? 0))
    }
    
    private func profile(for sourseId: Int, profile: [Profile], groups: [Group]) -> ProfileRepresentable {
        
        let profileOrGroups: [ProfileRepresentable] = sourseId >= 0 ? profile : groups
        let normalSourseId = sourseId >= 0 ? sourseId : -sourseId
        let profileRepresentable = profileOrGroups.first { $0.id == normalSourseId }
        
        return profileRepresentable!
    }
}
