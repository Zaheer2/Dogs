//
//  BaseViewController.swift
//  DogsExplorer
//
//  Created by User on 2022-02-02.
//

import UIKit
import Device
import NVActivityIndicatorView

class BaseViewController: UIViewController, NVActivityIndicatorViewable {
    private let fontSize: CGFloat = 20, margin: CGFloat = 5, numberOfLines: CGFloat = 2
    private var cellSize = CGSize()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - ErrorAlert()
    open func showErrorAlert(msg: String) {
        let alert = UIAlertController(title: msg, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .destructive) { _ in }
        alert.addAction(action)
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Navigator()
    public func navigateToVisualsVC(breedName: String) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VisualsViewController") as! VisualsViewController
        vc.str_BreedName = breedName
        self.navigationController?.pushViewController(vc, animated: true)
    }
    public func navigateToPreviewVC(imageURLString: String) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PreviewViewController") as! PreviewViewController
        vc.str_image_url = imageURLString
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - NavigationAppearance()
    open func setUpNavigation(isPreviewVC: Bool) {
        navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(image: UIImage(named: "backBtn"), style: .plain, target: self, action: #selector(popVC))
        navigationItem.rightBarButtonItem = backButton
        
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barStyle = .default
        
        if !isPreviewVC {
            //Set largeTitle
            navigationItem.largeTitleDisplayMode = .automatic
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: (fontSize + margin) * numberOfLines)]
            
            //Set title
            title = Constants.str_Screen_title
        }
    }
    @objc open func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
    open func setMultipleLargeTitle() {
        //Find label
        navigationController?.navigationBar.subviews.forEach({ subview in
            subview.subviews.forEach { subsubview in
                guard let label: UILabel = subsubview as? UILabel else { return }
                //Label settings on direct.
                label.text = title
                label.font = UIFont.systemFont(ofSize: fontSize)
                label.numberOfLines = 0
                label.lineBreakMode = .byWordWrapping
                label.sizeToFit()
            }
        })
    }
    
    //MARK: - DogImagesCellSizing()
    open func getCellSize() -> CGSize {
        switch Device.size() {
        case .screen4Inch: /// iPhone 5, 5s, 5c, SE, iPod Touch 5-6th gen.
            cellSize = CGSize(width: UIScreen.main.bounds.size.width / 3.5, height: 65)

        case .screen4_7Inch: /// iPhone 6, 6s, 7, 8
            cellSize = CGSize(width: UIScreen.main.bounds.size.width / 3.5, height: 65)
           
        case .screen5_5Inch:  /// iPhone 6+, 6s+, 7+, 8+
            cellSize = CGSize(width: UIScreen.main.bounds.size.width / 3.5, height: 65)

        case .screen5_8Inch: /// iPhone X, Xs

            cellSize = CGSize(width: UIScreen.main.bounds.size.width / 3.5, height: 65)

        case .screen6_1Inch:  /// iPhone Xr
            cellSize = CGSize(width: UIScreen.main.bounds.size.width / 3.5, height: 65)

        case .screen6_5Inch: /// iPhone Xs Max, iPhone 11 Pro Max
            cellSize = CGSize(width: UIScreen.main.bounds.size.width / 3.5, height: 65)
        default:
            cellSize = CGSize(width: UIScreen.main.bounds.size.width / 3.5, height: 65)
        }
        return cellSize
    }

}
