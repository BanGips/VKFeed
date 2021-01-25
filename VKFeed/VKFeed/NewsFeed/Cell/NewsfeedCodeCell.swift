//
//  NewsfeedCodeCell.swift
//  VKFeed
//
//  Created by BanGips on 5.01.21.
//

import Foundation
import UIKit
import SnapKit

typealias RevealPostCompletion = (NewsfeedCodeCell) -> Void

final class NewsfeedCodeCell: UITableViewCell {
    
    static let reuseId = "NewsfeedCodeCell"
    
    var revealPost: RevealPostCompletion?
    
    // layer 1
    let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraintsFalse()
        view.backgroundColor = .white
        return view
    }()
    
    // layer 2
    let topView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraintsFalse()
        return view
    }()
    
    let postLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Constants.postLabelFont
        label.textColor = .black
        return label
    }()
    
    let moreTextButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentVerticalAlignment = .center
        button.setTitle("Показать полностью", for: .normal)
        return button
    }()
    
    let postImageView: WebImageView = {
        let imageView = WebImageView()
        return imageView
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        return view
    }()
    
    // layer 3
    
    let iconImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraintsFalse()
        return imageView
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraintsFalse()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraintsFalse()
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    // layer 3 bottomView
    
    let likesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraintsFalse()
        return view
    }()
    
    let commentsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraintsFalse()
        return view
    }()
    
    let sharesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraintsFalse()
        return view
    }()
    
    let viewsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraintsFalse()
        return view
    }()
    
    // layer 4 on bottom view
    
    let likesImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraintsFalse()
        imageView.image = #imageLiteral(resourceName: "like")
        return imageView
    }()
    
    let commentsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraintsFalse()
        imageView.image = #imageLiteral(resourceName: "comment")
        return imageView
    }()
    
    let sharesImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraintsFalse()
        imageView.image = #imageLiteral(resourceName: "share")
        return imageView
    }()
    
    let viewsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraintsFalse()
        imageView.image = #imageLiteral(resourceName: "eye")
        return imageView
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraintsFalse()
        label.textColor = #colorLiteral(red: 0.3267062306, green: 0.3267062306, blue: 0.3267062306, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.lineBreakMode = .byClipping
        return label
    }()
    
    let commentsLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraintsFalse()
           label.textColor = #colorLiteral(red: 0.3267062306, green: 0.3267062306, blue: 0.3267062306, alpha: 1)
           label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
           label.lineBreakMode = .byClipping
           return label
       }()
    
    let sharesLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraintsFalse()
           label.textColor = #colorLiteral(red: 0.3267062306, green: 0.3267062306, blue: 0.3267062306, alpha: 1)
           label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
           label.lineBreakMode = .byClipping
           return label
       }()
    
    let viewsLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraintsFalse()
           label.textColor = #colorLiteral(red: 0.3267062306, green: 0.3267062306, blue: 0.3267062306, alpha: 1)
           label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
           label.lineBreakMode = .byClipping
           return label
       }()
    
    override func prepareForReuse() {
           iconImageView.set(imageURL: nil)
           postImageView.set(imageURL: nil)
       }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        overlayFirstLayer()
        overlaySecondLayer()
        overlayThirdLayerOnTopView()
        overlayThirdLayerOnBottomView()
        overlayFourthLayerOnBottomView()
        
        moreTextButton.addTarget(self, action: #selector(moreTextButtonTouch), for: .touchUpInside)
        
        iconImageView.layer.cornerRadius = Constants.topViewHeight / 2
        iconImageView.clipsToBounds = true
        
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
        
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    @objc func moreTextButtonTouch() {
        revealPost?(self)
    }
    
    func set(viewModel: FeedCellViewModel) {
        print(viewModel.iconUrlString)
        iconImageView.set(imageURL: viewModel.iconUrlString)
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        postLabel.text = viewModel.text
        likesLabel.text = viewModel.likes
        commentsLabel.text = viewModel.comments
        sharesLabel.text = viewModel.shares
        viewsLabel.text = viewModel.views
        
        postImageView.frame = viewModel.sizes.ataachmentFrame
        postLabel.frame = viewModel.sizes.postLabelFrame
        bottomView.frame = viewModel.sizes.bottomViewFrame
        moreTextButton.frame = viewModel.sizes.moreTextButtonFrame
        
        if let photoAttachment = viewModel.photoAttachment {
            postImageView.set(imageURL: photoAttachment.photoUrlString)
            postImageView.isHidden = false
        } else {
            postImageView.isHidden = true
        }
    }
    
    private func overlayFirstLayer() {
        addSubview(cardView)

        //card view constraints
        cardView.snp.makeConstraints { $0.trailing.leading.top.bottom.equalTo(Constants.cardInsets) }
    }
    
    private func overlaySecondLayer() {
        cardView.addSubview(topView)
        cardView.addSubview(postLabel)
        cardView.addSubview(moreTextButton)
        cardView.addSubview(postImageView)
        cardView.addSubview(bottomView)
        
        // topView constraints
        topView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.top.equalToSuperview().inset(6)
            $0.height.equalTo(Constants.topViewHeight)
        }
    }
    
    private func overlayThirdLayerOnTopView() {
        topView.addSubview(iconImageView)
        topView.addSubview(nameLabel)
        topView.addSubview(dateLabel)
        
        // iconImageView constraints
        
        iconImageView.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.height.width.equalTo(Constants.topViewHeight)
        }
        
        // nameLabel constraints
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(2)
            $0.leading.equalTo(iconImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(Constants.topViewHeight / 2 - 2)
        }
        
        // dateLabel constraints
        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(2)
            $0.height.equalTo(14)
        }
        
    }
    
    private func overlayThirdLayerOnBottomView() {
        bottomView.addSubview(likesView)
        bottomView.addSubview(commentsView)
        bottomView.addSubview(sharesView)
        bottomView.addSubview(viewsView)
        
        // likes view
        
        likesView.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.height.equalTo(Constants.bottomViewViewHeight)
            $0.width.equalTo(Constants.bottomViewViewWidth)
        }
        
        commentsView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(likesView.snp.trailing)
            $0.height.equalTo(Constants.bottomViewViewHeight)
            $0.width.equalTo(Constants.bottomViewViewWidth)
        }
        
        sharesView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(commentsView.snp.trailing)
            $0.height.equalTo(Constants.bottomViewViewHeight)
            $0.width.equalTo(Constants.bottomViewViewWidth)
        }
        
        viewsView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(Constants.bottomViewViewHeight)
            $0.width.equalTo(Constants.bottomViewViewWidth)
        }
    }
    
    private func overlayFourthLayerOnBottomView() {
        likesView.addSubview(likesImage)
        likesView.addSubview(likesLabel)
        
        commentsView.addSubview(commentsImage)
        commentsView.addSubview(commentsLabel)
        
        sharesView.addSubview(sharesImage)
        sharesView.addSubview(sharesLabel)
        
        viewsView.addSubview(viewsImage)
        viewsView.addSubview(viewsLabel)
        
        helpInFourthLayer(view: likesView, imageView: likesImage, label: likesLabel)
        helpInFourthLayer(view: commentsView, imageView: commentsImage, label: commentsLabel)
        helpInFourthLayer(view: sharesView, imageView: sharesImage, label: sharesLabel)
        helpInFourthLayer(view: viewsView, imageView: viewsImage, label: viewsLabel)
    }
    
    private func helpInFourthLayer(view: UIView, imageView: UIImageView, label: UILabel) {
        imageView.snp.makeConstraints {
            $0.centerY.equalTo(view.snp.centerY)
            $0.leading.equalTo(view.snp.leading).inset(10)
            $0.width.height.equalTo(Constants.bottomViewViewsIconSize)
        }
        
        label.snp.makeConstraints {
            $0.centerY.equalTo(view.snp.centerY)
            $0.leading.equalTo(imageView.snp.trailing).offset(4)
            $0.trailing.equalTo(view.snp.trailing)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
