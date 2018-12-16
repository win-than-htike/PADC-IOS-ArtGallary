//
//  ArtCollectionViewController.swift
//  PADC-IOS-ArtGallary
//
//  Created by Zaw Zin Phyo on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "ArtCollectionViewCell"

class ArtCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    @IBOutlet var cvArt: UICollectionView!
    
    private var artList: [ArtVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cvArt.delegate = self
        self.cvArt.dataSource = self
        
        CellRegsiterUtil.collectionCellRegister(nibName: reuseIdentifier, collectionView: self.cvArt)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadArts()
    }

    func clickDetail(art: ArtVO) {
        let nv = self.storyboard?.instantiateViewController(withIdentifier: "ArtDetailViewController") as! UINavigationController
        let cv = nv.viewControllers[0] as! ArtDetailViewController
        cv.art = art
        
        self.present(nv, animated: true, completion: nil)
    }
    
    func loadArts() {
        DataModel.shared.loadArts(success: { (arts) in
            self.artList.removeAll()
            self.artList = arts as! [ArtVO]
            self.cvArt.reloadData()
            print("ArtListCount --> \(self.artList.count)")
            
        }) { (err) in
            print(err)
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return artList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCollectionViewCell
    
        // Configure the cell
        if artList.count > 0 {
            cell.ivArt.sd_setImage(with: URL(string: artList[indexPath.row].artImage), placeholderImage: UIImage(named: "dummy_cell"))
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (self.view.frame.width / 2) - 10
        return CGSize.init(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 7, left: 8, bottom: 5, right: 8)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        clickDetail(art: self.artList[indexPath.row])
    }
}
