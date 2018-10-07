//
//  ViewController.swift
//  Rush00
//
//  Created by Hilton MTHIMUNYE on 2018/10/06.
//  Copyright © 2018 Hilton MTHIMUNYE. All rights reserved.
//

import UIKit


class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    
    var massages: [Massage]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        
        cellSize = CGSize(width: self.view.frame.width, height: 100)
        collectionView?.register(MessageCell.self, forCellWithReuseIdentifier: cellId)
        
        setupData()
   
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = massages?.count {
            return count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MessageCell
        
        if let massage = massages?[indexPath.item] {
            cell.massage = massage
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.view.frame.width, height: 100)
        return size
    }
    
}

class MessageCell: BaseCell {
    
    var massage: Massage? {
        didSet {
            nameLabel.text = massage?.friend?.name
            
            if let profileImageName = massage?.friend?.profileImageName {
                profileImageView.image = UIImage(named: profileImageName);
            }
            
            massageLabel.text = massage?.text
            
            if let date = massage?.date {
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "h:mm a"
                
                timelabel.text = dateFormatter.string(from: date as Date)
            }
        }
    }
    
    // Creating an image view profile
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 34
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    // line divider
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    // Name of the user
    let nameLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Hilton Mthimunye"
        lable.font = UIFont.systemFont(ofSize: 18)
        return lable
    }()
    
    // text massage label
    let massageLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Your friend has sent youa massage and something else..."
        lable.textColor = UIColor.darkGray
        lable.font = UIFont.systemFont(ofSize: 13)
        return lable
    }()
    
    // Time label
    let timelabel: UILabel = {
        let lable = UILabel()
        lable.text = "11:47 pm"
        lable.font = UIFont.systemFont(ofSize: 18)
        lable.textAlignment = .right
        return lable
    }()
    
    // read massage image view
    let hasReadImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override func setupViews() {
//        self.backgroundColor = UIColor.blue
        
        // adding subviews to the controller
        addSubview(profileImageView)
        addSubview(dividerLineView)
        
        setupContainerView()
        
        // Load an image icon for the profile pic 
        profileImageView.image = #imageLiteral(resourceName: "icon")
        hasReadImageView.image = #imageLiteral(resourceName: "icon")

        // vertical alignment | pxls frm left edge [center (size)]
        // Contraints for the profile image
        addConstraintsWithFormat(format: "H:|-12-[v0(68)]|", views: profileImageView)
        addConstraintsWithFormat(format: "V:[v0(68)]", views: profileImageView)
        
        addConstraints([NSLayoutConstraint(item: profileImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)])
        
        // Contraints for the line divider
        addConstraintsWithFormat(format: "H:|-82-[v0]|", views: dividerLineView)
        addConstraintsWithFormat(format: "V:[v0(1)]|", views: dividerLineView)
        
    }
    
    private func setupContainerView() {
        let containerView = UIView()
//        containerView.backgroundColor = UIColor.red
        addSubview(containerView)
        
        addConstraintsWithFormat(format: "H:|-90-[v0]|", views: containerView)
        addConstraintsWithFormat(format: "V:[v0(50)]", views: containerView)
        addConstraints([NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)])
        
        // adding the user name label on the text massage container
        containerView.addSubview(nameLabel)
        containerView.addSubview(massageLabel)
        containerView.addSubview(timelabel)
        containerView.addSubview(hasReadImageView)
        
        // Constrants for the user name and text massage label
        containerView.addConstraintsWithFormat(format: "H:|[v0]|", views: nameLabel)
        
        containerView.addConstraintsWithFormat(format: "V:|[v0][v1(24)]|", views: nameLabel, massageLabel)
       
        containerView.addConstraintsWithFormat(format: "H:|[v0]-8-[v1(20)]-12-|", views: massageLabel, hasReadImageView)
        
        containerView.addConstraintsWithFormat(format: "H:[v0(80)]-10-|", views: timelabel)
        containerView.addConstraintsWithFormat(format: "V:|[v0(24)]", views: timelabel)
        
        containerView.addConstraintsWithFormat(format: "V:[v0(20)]|", views: hasReadImageView)
        
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = UIColor.blue
    }
}

















