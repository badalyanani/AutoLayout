//
//  UserViewController.swift
//  AutoLayoutHomework
//
//  Created by Ani on 10/20/19.
//  Copyright © 2019 Ani. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    var regularConstraints: [NSLayoutConstraint] = []
    var compactConstraints: [NSLayoutConstraint] = []
    var regularRegularConstraints: [NSLayoutConstraint] = []
    
    weak var imageView: UIImageView!
    weak var nameLabel: UILabel!
    weak var surNameLabel: UILabel!
    weak var userView: UIView!
    var user: User?
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        let imageView = UIImageView(frame: .zero)
        let nameLabel = UILabel(frame: .zero)
        let surNameLabel = UILabel(frame: .zero)
        let userView = UIView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        surNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userView.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.view.addSubview(imageView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(surNameLabel)
        self.view.addSubview(userView)
        
        self.compactConstraints = [
            imageView.widthAnchor.constraint(equalToConstant: 200),
          
            imageView.widthAnchor.constraint(greaterThanOrEqualTo: imageView.widthAnchor, multiplier: 0.2),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            surNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            surNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            userView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            userView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 40),
            userView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 20),
            userView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 20),
        ]
        
        
        self.regularConstraints = [
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.widthAnchor.constraint(greaterThanOrEqualTo: imageView.heightAnchor, multiplier: 0.8),
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100),
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            surNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            surNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            userView.topAnchor.constraint(equalTo: surNameLabel.bottomAnchor, constant: 8),
            userView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            userView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            userView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        ]
        
        self.regularRegularConstraints = [
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(greaterThanOrEqualTo: imageView.widthAnchor, multiplier: 0.5),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            surNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            surNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            userView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40),
            userView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 40),
            userView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 20),
            userView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 20),
        ]
        
        self.activateCurrentConstraints()
        self.imageView = imageView
        self.nameLabel = nameLabel
        self.surNameLabel = surNameLabel
        self.userView = userView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = user {
            imageView.image = UIImage(named: user.image)
            nameLabel.text = user.name
            surNameLabel.text = user.surname
        }
        
        userView.backgroundColor = .gray
        self.view.backgroundColor = .white
    }
    
    private func activateCurrentConstraints() {
        NSLayoutConstraint.deactivate(self.compactConstraints + self.regularConstraints + self.regularRegularConstraints)
        
        if self.traitCollection.verticalSizeClass == .regular  && self.traitCollection.horizontalSizeClass == .compact {
            NSLayoutConstraint.activate(self.regularConstraints)
        }
        if self.traitCollection.verticalSizeClass == .compact  {
            NSLayoutConstraint.activate(self.compactConstraints)
        }
        if self.traitCollection.verticalSizeClass == .regular && self.traitCollection.horizontalSizeClass == .regular {
            NSLayoutConstraint.activate(self.regularRegularConstraints)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.activateCurrentConstraints()
    }
}
