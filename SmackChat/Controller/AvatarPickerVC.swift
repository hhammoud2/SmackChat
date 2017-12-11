//
//  AvatarPickerVC.swift
//  SmackChat
//
//  Created by Hammoud Hammoud on 12/8/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController {

    // MARK: - Properties
    
    var avatarType = AvatarType.dark
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "smackBack"), for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        button.tintColor = smackPurple
        return button
    }()
    
    let darkLightSegmentedControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["Dark", "Light"])
        segmentControl.tintColor = smackBlue
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
    // MARK: - Life Cycle
    
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
    
    // MARK: Helper functions
    func addSubviews() {
        self.view.addSubview(backButton)
        self.view.addSubview(darkLightSegmentedControl)
        self.view.addSubview(avatarImageCollection)
    }
    
    // MARK: Button functions
    @objc func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func changeColor(_ sender: Any) {
        if darkLightSegmentedControl.selectedSegmentIndex == 0 {
            avatarType = AvatarType.dark
        }
        else if darkLightSegmentedControl.selectedSegmentIndex == 1 {
            avatarType = AvatarType.light
        }
        avatarImageCollection.reloadData()
    }
}

extension AvatarPickerVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatar cell", for: indexPath) as? AvatarPickerCell {
            cell.configureCell(index: indexPath.item, type: avatarType)
            return cell
        }
        else {
            return AvatarPickerCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var numOfColumns: CGFloat = 3
        if UIScreen.main.bounds.width > 320 {
            numOfColumns = 4
        }
        
        let spaceBetweenCells: CGFloat = 10
        let padding: CGFloat = 40
        let cellDimension = ((collectionView.bounds.width - padding) - (numOfColumns - 1) * spaceBetweenCells)/numOfColumns
        
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarType == .dark {
            UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
        }
        else {
            UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
