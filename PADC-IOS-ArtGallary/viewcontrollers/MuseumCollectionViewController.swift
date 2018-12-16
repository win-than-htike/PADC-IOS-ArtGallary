//
//  MuseumCollectionViewController.swift
//  PADC-IOS-ArtGallary
//
//  Created by Zaw Zin Phyo on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

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
            self.gallaryList = data
            self.cvMuseumList.reloadData()
        }, failure: {
            print("Failed to load gallaries")
        })
    }

    func aboutMuseum() {
        let nc = self.storyboard?.instantiateViewController(withIdentifier: "MuseumHistoryViewController") as! UINavigationController
        _ = nc.viewControllers[0] as! MuseumHistoryViewController
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
        cell.gallaryName = self.gallaryList[indexPath.row].gallaryName ?? "default value"
        cell.gallaryImage = self.gallaryList[indexPath.row].gallaryImage ?? "default value"
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellwidth = self.view.frame.width
        return CGSize.init(width: cellwidth, height: cellwidth * 0.7)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        aboutMuseum()
    }
}

