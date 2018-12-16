//
//  ArtDetailViewController.swift
//  PADC-IOS-ArtGallary
//
//  Created by Zaw Zin Phyo on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class ArtDetailViewController: UIViewController {

    @IBOutlet weak var cvRelatedArtList: UICollectionView!
    @IBOutlet weak var ivFullScreen: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cvRelatedArtList.dataSource = self
        self.cvRelatedArtList.delegate = self

        CellRegsiterUtil.collectionCellRegister(nibName: "ArtCollectionViewCell", collectionView: self.cvRelatedArtList)
        ivFullScreen.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onClickFullScreen))
        ivFullScreen.addGestureRecognizer(recognizer)
    }
    
    @IBAction func clickFavorite(_ sender: Any) {
        
    }
    
    @IBAction func clickBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func onClickFullScreen() {
        let fullViewController = self.storyboard?.instantiateViewController(withIdentifier: "FullScreenViewController") as! FullScreenViewController
        self.present(fullViewController, animated: true, completion: nil)
    }
    
}

extension ArtDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtCollectionViewCell", for: indexPath) as! ArtCollectionViewCell
        
        // Configure the cell
        
        return cell
    }
    
}

extension ArtDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (self.view.frame.width / 2.1) - 16
        return CGSize.init(width: cellWidth, height: cellWidth * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 12, bottom: 5, right: 12)
    }
}
