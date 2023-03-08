//
//  ProfileViewController.swift
//  InstagramUikit
//
//  Created by Apple on 23/02/2023.
//

import UIKit

class ProfileViewController: UIViewController {
  
    private var collectionView:UICollectionView?
    private var userPosts = [PostModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureNavigationBar()
        let layout  = UICollectionViewFlowLayout()
        layout.scrollDirection =  .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let  size = (view.width - 4)/3
        layout.itemSize = CGSize(width:  size , height:   size )
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        
        collectionView?.register(ProfileInfoPhotoCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileInfoPhotoCollectionReusableView.identifier)
        
        collectionView?.register(ProfileTabCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileTabCollectionReusableView.identifier)
        
        
        collectionView?.register(PhtotoCollectionViewCell.self, forCellWithReuseIdentifier: PhtotoCollectionViewCell.identifier  )
        
      
        
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

extension  ProfileViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,ProfileInfoPhotoCollectionReusableViewDelegate,ProfileTabCollectionReusableViewDelegate{
    func didTapGridButtonTab() {
        //
    }
    
    func didTaggedButtonTab() {
        //
    }
    
    func profileHeaderDidTapPostButton(_ header: ProfileInfoPhotoCollectionReusableView) {
        collectionView?.scrollToItem(at: IndexPath(row:0, section: 1), at: .top, animated: true)
    }
    
    func profileFollowersDidTapPostButton(_ header: ProfileInfoPhotoCollectionReusableView) {
        
        var mockdata = [UserRelationship]()
        for x in  1..<12 {
            mockdata.append(UserRelationship(username: "jermae", name: "eee", type: x % 2 == 0 ? .not_following : .following))
        }
        let vc = ListViewController(data: mockdata)
        vc.title = "Follwers"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func profileFollowingDidTapPostButton(_ header: ProfileInfoPhotoCollectionReusableView) {
        var mockdata = [UserRelationship]()
        for x in  1..<12 {
            mockdata.append(UserRelationship(username: "jermae", name: "eee", type:  x % 2 == 0 ? .following:.not_following))
        }
        let vc = ListViewController(data: mockdata)
        vc.title = "Follwers"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func profileEditTapPostButton(_ header: ProfileInfoPhotoCollectionReusableView) {
        let vc = EdityProfileViewController()
        vc.title = "Follwing"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
           return 0
        }
        
        return 30
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
     //   let model = userposts[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhtotoCollectionViewCell.identifier, for: indexPath) as! PhtotoCollectionViewCell
       // cell.configure(withmodel: <#T##PostModel#>)
        cell.configure(debug: "mouse")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {return
           UICollectionReusableView()
        }
        
        if indexPath.section == 1 {
          
            let profileHeader = collectionView.dequeueReusableSupplementaryView(ofKind:  kind, withReuseIdentifier: ProfileTabCollectionReusableView.identifier, for: indexPath) as! ProfileTabCollectionReusableView
               profileHeader.delegate = self 
            return profileHeader
        }
        let header = collectionView.dequeueReusableSupplementaryView(ofKind:  kind, withReuseIdentifier: ProfileInfoPhotoCollectionReusableView.identifier, for: indexPath) as! ProfileInfoPhotoCollectionReusableView
        header.delegate = self
        return header
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: collectionView.width, height:collectionView.height/3)
        }
      
         return CGSize(width: collectionView.width, height:50)
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
//        let vc =  PostViewController(model: nil)
//        vc.navigationItem.largeTitleDisplayMode = .never
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
