//
//  CollectionViewCell.swift
//  Mini Reddit without storyboards
//
//  Created by Alyssa Mae Sta Cruz on 27/09/2017.
//  Copyright © 2017 Alyssa. All rights reserved.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    var post: Post?{
        didSet{
            if let name = post?.name{
                let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: (14))])
                
                attributedText.append(NSAttributedString(string: "\nDecember 12 * San Francisco * ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.rgb(red: 155, green: 161, blue: 171)]))
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 4
                
                attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
                
                let attachment = NSTextAttachment()
                attachment.image = UIImage(named: "dp2")
                attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
                attributedText.append(NSAttributedString(attachment: attachment))
                nameLabel.attributedText = attributedText
            }
            if let contentText = post?.contentText{
                contentTextView.text = contentText
            }
        }
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(Coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dp1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let contentTextView: UITextView = {
        let textView = UITextView()
        //textView.text = "Meanwhile, beast turned to the dark side."
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dp2")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    let likesCommentsLabel: UILabel = {
        let label = UILabel()
        label.text = "400 Likes  10.7K Comments"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.rgb(red: 155, green: 161, blue: 171)
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 226, green: 228, blue: 232)
        return view
    }()
    
    let voteButton = FeedCollectionViewCell.buttonForTitle(title: "Vote", imageName: "like")
    let commentButton = FeedCollectionViewCell.buttonForTitle(title: "Comment", imageName: "like")
    let shareButton = FeedCollectionViewCell.buttonForTitle(title: "Share", imageName: "like")
    
    
    static func buttonForTitle(title: String, imageName: String) -> UIButton{
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.rgb(red: 143, green: 150, blue: 163) , for: .normal)
        //        button.setImage(UIImage(named: imageName), for: .normal)
        //        button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }
    
    
    func setupViews() {
        backgroundColor = UIColor.white
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(contentTextView)
        addSubview(statusImageView)
        addSubview(likesCommentsLabel)
        addSubview(dividerLineView)
        addSubview(voteButton)
        addSubview(commentButton)
        addSubview(shareButton)
        
        
        addConstraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView,nameLabel)
        
        addConstraintsWithFormat(format: "H:|-4-[v0]-4-|", views: contentTextView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: statusImageView)
        
        addConstraintsWithFormat(format: "H:|-12-[v0]|", views: likesCommentsLabel)
        
        addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: dividerLineView)
        
        addConstraintsWithFormat(format: "H:|[v0(v2)][v1(v2)][v2]|", views: voteButton, commentButton, shareButton)
        
        addConstraintsWithFormat(format: "V:|-12-[v0]", views: nameLabel)
        
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]|", views: profileImageView)
        
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]-4-[v1]-4-[v2(200)]-8-[v3(24)]-8-[v4(0.4)][v5(44)]|", views: profileImageView, contentTextView, statusImageView, likesCommentsLabel, dividerLineView, voteButton)
        
        addConstraintsWithFormat(format: "V:[v0(44)]|", views: commentButton)
        
        addConstraintsWithFormat(format: "V:[v0(44)]|", views: shareButton)
        
    }
}

