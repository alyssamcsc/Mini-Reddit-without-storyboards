//
//  ViewController.swift
//  Mini Reddit without storyboards
//
//  Created by Alyssa Mae Sta Cruz on 26/09/2017.
//  Copyright © 2017 Alyssa. All rights reserved.
//

import UIKit

let cellId = "cellId"

class Post {
    var name: String?
    var contentText:String?
}

var posts = [Post]()
class FeedCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let postAlyssa = Post()
        postAlyssa.name = "Alyssa Mae Sta Cruz"
        postAlyssa.contentText = "Look at the iPhone 8. So nice!"
        
        let postAnita = Post()
        postAnita.name = "Anita la Puebla"
        postAnita.contentText = "Short stories are some of the first pieces of literature that children become acquainted with in their lives. However, as we age, sometimes we forget what these stories are about, their key elements or the ways that they continue to shape our lives as we grow."
        
        posts = [postAlyssa, postAnita]
        
        
        navigationItem.title = "Reddit"
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView?.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let feedCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as!  FeedCollectionViewCell
        feedCell.post = posts[indexPath.item]
       
        return feedCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let contentText = posts[indexPath.item].contentText{
            let rect = NSString(string: contentText).boundingRect(with: CGSize(width: view.frame.width, height: 100), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes:[NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: (14))], context: nil)
            
            let knownHeight: CGFloat = 8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 44
            return CGSize(width: view.frame.width, height: rect.height + knownHeight + 24)
        }
        return CGSize(width: view.frame.width, height: 500)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView?.collectionViewLayout.invalidateLayout()
    }

}



extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue:blue/255, alpha: 1)
    }
}


extension UIView{
    
    func addConstraintsWithFormat(format:String, views:UIView...) {
        var viewsDictionary = [String: UIView]()
        for(index, view) in views.enumerated(){
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

