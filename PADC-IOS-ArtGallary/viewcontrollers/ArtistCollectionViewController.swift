//
//  ArtistCollectionViewController.swift
//  PADC-IOS-ArtGallary
//
//  Created by Zaw Zin Phyo on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ArtistCellCollectionViewCell"

class ArtistCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var cvArtistList: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cvArtistList.dataSource = self
        self.cvArtistList.delegate = self
        
        CellRegsiterUtil.collectionCellRegister(nibName: reuseIdentifier, collectionView: self.cvArtistList)
    }
    
    func artistBio() {
        let nc = self.storyboard?.instantiateViewController(withIdentifier: "ArtistBioViewController") as! UINavigationController
        _ = nc.viewControllers[0] as! ArtistBioViewController
        self.present(nc, animated: true, completion: nil)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        artistBio()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (self.view.frame.width / 2 ) - 20
        return CGSize.init(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
    
}
