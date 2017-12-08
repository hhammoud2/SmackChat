//
//  AvatarPickerVC.swift
//  SmackChat
//
//  Created by Hammoud Hammoud on 12/8/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController {

    //MARK: - Properties
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "smackBack"), for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        button.tintColor = #colorLiteral(red: 0.2549019608, green: 0.3294117647, blue: 0.7254901961, alpha: 1)
        return button
    }()
    
    let darkLightSegmentedControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["Dark", "Light"])
        segmentControl.tintColor = #colorLiteral(red: 0.3568627451, green: 0.6235294118, blue: 0.7960784314, alpha: 1)
        segmentControl.setTitle("Dark", forSegmentAt: 0)
        segmentControl.setTitle("Light", forSegmentAt: 1)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(changeColor), for: .valueChanged)
        
        return segmentControl
    }()
    
    let avatarImageCollection: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        flowLayout.itemSize = CGSize(width: 75, height: 75)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.register(AvatarPickerCell.self, forCellWithReuseIdentifier: "avatar cell")
        collection.backgroundColor = .white
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        
        return collection
    }()
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        avatarImageCollection.delegate = self
        avatarImageCollection.dataSource = self
        addSubviews()
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        backButton.pin.topLeft().marginTop(32).size(30).marginLeft(10)
        darkLightSegmentedControl.pin.top().hCenter().marginTop(32).height(30).width(125)
        avatarImageCollection.pin.left().right().bottom().below(of: darkLightSegmentedControl).marginTop(20)
    }
    
    //MARK: Helper functions
    func addSubviews() {
        self.view.addSubview(backButton)
        self.view.addSubview(darkLightSegmentedControl)
        self.view.addSubview(avatarImageCollection)
    }
    
    //MARK: Button functions
    @objc func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func changeColor(_ sender: Any) {
        print(darkLightSegmentedControl.selectedSegmentIndex)
    }
}

extension AvatarPickerVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatar cell", for: indexPath) as? AvatarPickerCell {
            return cell
        }
        else {
            return AvatarPickerCell()
        }
    }
    
    
}
