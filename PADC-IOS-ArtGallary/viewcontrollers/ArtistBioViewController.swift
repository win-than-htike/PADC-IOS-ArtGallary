//
//  ArtistBioViewController.swift
//  PADC-IOS-ArtGallary
//
//  Created by Zaw Zin Phyo on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class ArtistBioViewController: UIViewController {

    @IBOutlet weak var cvArtistArtList: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cvArtistArtList.dataSource = self
        self.cvArtistArtList.delegate = self
        
        CellRegsiterUtil.collectionCellRegister(nibName: "ArtCollectionViewCell", collectionView: self.cvArtistArtList)

        // Do any additional setup after loading the view.
    }

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension ArtistBioViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtCollectionViewCell", for: indexPath) as! ArtCollectionViewCell
        return cell
    }
    
}

extension ArtistBioViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellwidth = (self.view.frame.width / 2) - 16
        return CGSize.init(width: cellwidth, height: cellwidth * 1.1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 12, bottom: 5, right: 12)
    }
}
