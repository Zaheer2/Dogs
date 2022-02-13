//
//  VisualsViewController.swift
//  DogsKingdom
//
//  Created by User on 2022-02-01.
//

import UIKit
import Alamofire
import SDWebImage

class VisualsViewController: BaseViewController {
    @IBOutlet weak var collectionView_breedImages: UICollectionView!
    var str_BreedName : String?
    var arr_breed_Images : [String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation(isPreviewVC: false)
        setUpCollectionViewFlowLayout()
        getBreedsListRequest()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setMultipleLargeTitle()
    }
    private func setUpCollectionViewFlowLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = self.getCellSize()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 16.0
        layout.minimumInteritemSpacing = 2.0
        
        collectionView_breedImages.setCollectionViewLayout(layout, animated: false)
    }
    //MARK: - Service Call
    private func getBreedsListRequest(){
        if(!CEReachabilityManager.isReachable()){
            self.stopAnimating()
            self.showErrorAlert(msg: Constants.str_NoInternet)
            return
        }
        else {
            self.startAnimating()
        }
        let parameters : Parameters = [ "breedName": self.str_BreedName! ]
        let successClosure: DefaultImagesArrayResultAPISuccessClosure = {
            (result) in
            if (result != nil) {
                if let arr =  result?.message {
                    self.arr_breed_Images = arr
                    self.collectionView_breedImages.reloadData()
                }
                self.stopAnimating()
            }
            else {
                self.stopAnimating()
            }
        }
        
        APIManager.sharedInstance.getBreedVisuals(parameters: parameters, success: successClosure) { (error) in
            print (error)
            self.showErrorAlert(msg: error.localizedDescription)
            self.stopAnimating()
        }
    }
}

extension VisualsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.arr_breed_Images?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.st_cell_DogsImage, for: indexPath) as! DogVisualsCollectionViewCell
        cell.imageView_DogImage.sd_setImage(with: URL(string: self.arr_breed_Images![indexPath.row]), placeholderImage: UIImage(named: "placeholder"))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = arr_breed_Images?[indexPath.row] {
            self.navigateToPreviewVC(imageURLString: url)
        }
        else {
            self.navigateToPreviewVC(imageURLString: Constants.backupImageURL)
        }
    }
}
