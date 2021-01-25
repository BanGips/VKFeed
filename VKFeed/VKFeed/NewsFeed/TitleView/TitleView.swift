//
//  TitleView.swift
//  VKFeed
//
//  Created by BanGips on 8.01.21.
//

import Foundation
import UIKit

protocol TitleViewModel {
    var photouserString: String? { get }
}

class TitleView: UIView {
    
    private var textField = SearchTextField()
    
    private var avatarView: WebImageView = {
       let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraintsFalse()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraintsFalse()
        
        addSubview(textField)
        addSubview(avatarView)
        makeConstraints()
    
    }
    
    func set(userViewModel: TitleViewModel) {
        avatarView.set(imageURL: userViewModel.photouserString)
    }
    
    private func makeConstraints() {
        avatarView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(4)
            $0.height.width.equalTo(textField.snp.height)
        }
        
        textField.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview().inset(4)
            $0.trailing.equalTo(avatarView.snp.leading).inset(-12)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarView.layer.masksToBounds = true
        avatarView.layer.cornerRadius = avatarView.frame.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
