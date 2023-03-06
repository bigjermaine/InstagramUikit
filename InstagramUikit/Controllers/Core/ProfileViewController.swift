//
//  ProfileViewController.swift
//  InstagramUikit
//
//  Created by Apple on 23/02/2023.
//

import UIKit

class ProfileViewController: UIViewController {
  
    private var collectionView:UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureNavigationBar()
        let layout  = UICollectionViewFlowLayout()
        layout.scrollDirection =  .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        let  size = (view.width - 4)/3
        layout.itemSize = CGSize(width:  size , height:   size)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        
        
        collectionView?.register(PhtotoCollectionViewCell.self, forCellWithReuseIdentifier: PhtotoCollectionViewCell.identifier  )
        
        
        collectionView?.register(ProfileInfoPhotoCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileInfoPhotoCollectionReusableView.identifier)
        
        collectionView?.register(ProfileTabCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileTabCollectionReusableView.identifier)
        guard let collectionView = collectionView else {return}
        view.addSubview(collectionView)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    
    func   configureNavigationBar() {
        navigationItem.rightBarButtonItem  =  UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettingButton ))
    }
    @objc private func didTapSettingButton() {
        let vc = SettingsViewController()
        vc.title = "Settings"
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProfileViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhtotoCollectionViewCell.identifier, for: indexPath) as! PhtotoCollectionViewCell
        cell.backgroundColor = .red
        return cell
    }

}
