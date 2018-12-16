//
//  MuseumCollectionViewController.swift
//  PADC-IOS-ArtGallary
//
//  Created by Zaw Zin Phyo on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "MuseumCollectionViewCell"

class MuseumCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    @IBOutlet var cvMuseumList: UICollectionView!
    
    var gallaryList: [GallaryVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell classes
        CellRegsiterUtil.collectionCellRegister(nibName: reuseIdentifier, collectionView: self.cvMuseumList)
        getGallaries();
    }
    
    private func getGallaries() {
        DataModel.shared.getGallaries(success: { (data) in
            self.gallaryList.removeAll()
            self.gallaryList = data
            self.cvMuseumList.reloadData()
        }, failure: {
            print("Failed to load gallaries")
        })
    }

    func aboutMuseum(gallery : GallaryVO) {
        let nc = self.storyboard?.instantiateViewController(withIdentifier: "MuseumHistoryViewController") as! UINavigationController
        let vc = nc.viewControllers[0] as! MuseumHistoryViewController
        
        vc.gallery = gallery

        self.present(nc, animated: true, completion: nil)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return gallaryList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MuseumCollectionViewCell
    
        // Configure the cell

        cell.lblGallaryName.text = self.gallaryList[indexPath.row].gallaryName
        cell.imgGallary.sd_setImage(with: URL(string: self.gallaryList[indexPath.row].gallaryImage!), placeholderImage: UIImage(named: "dummy_cell"))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellwidth = self.view.frame.width
        return CGSize.init(width: cellwidth, height: cellwidth * 0.7)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        aboutMuseum(gallery: gallaryList[indexPath.row])
    }
}

