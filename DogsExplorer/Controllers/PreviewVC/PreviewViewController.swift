//
//  PreviewViewController.swift
//  DogsKingdom
//
//  Created by User on 2022-02-01.
//

import UIKit

class PreviewViewController: BaseViewController, UIScrollViewDelegate  {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    var str_image_url : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setUpNavigation(isPreviewVC: true)
    }
    func setupUI() {
        scrollView.delegate = self
        imageView.sd_setImage(with: URL(string: str_image_url!), placeholderImage: UIImage(named: "preview_placeholder"))
    }
    
    //MARK: - ScrollView Delegate
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
}
