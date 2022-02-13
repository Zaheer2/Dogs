//
//  DogsListViewController.swift
//  DogsKingdom
//
//  Created by User on 2022-02-01.
//

import UIKit
import Foundation

@propertyWrapper class Capitalizer {
    var wrappedValue: String {
        didSet{
            wrappedValue = wrappedValue.capitalized
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}

class DogsListViewController: BaseViewController {
    @IBOutlet weak var tableView_BreedsList: UITableView!
    var arr_breeds : [String: [String]] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        getBreedsListRequest()
        setUpNavigation(isPreviewVC: false)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.rightBarButtonItem = nil
        setMultipleLargeTitle()
    }
    private func tableViewSetup() {
        if #available(iOS 11.0, *) {
            tableView_BreedsList.estimatedRowHeight = UITableView.automaticDimension
        } else {
            tableView_BreedsList.estimatedRowHeight = 200
        }
        self.tableView_BreedsList.tableFooterView = UIView()
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
        let successClosure: DefaultArrayResultAPISuccessClosure = {
            (result) in
            if (result != nil) {
                if let arr =  result?.message {
                    self.arr_breeds = arr
                    self.tableView_BreedsList.reloadData()
                }
                self.stopAnimating()
            }
            else {
                self.stopAnimating()
            }
        }
        
        APIManager.sharedInstance.getAllBreeds(success: successClosure) { (error) in
            print (error)
            self.showErrorAlert(msg: error.localizedDescription)
            self.stopAnimating()
        }
    }
}

extension DogsListViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr_breeds.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.str_cell_BreedName, for: indexPath) as! BreedNameTableViewCell
        cell.label_BreedName.text = getbreed(index: indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigateToVisualsVC(breedName: getbreed(index: indexPath.row))
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    func getbreed(index: Int) -> String{
        let position = arr_breeds.index(arr_breeds.startIndex, offsetBy: index)
        @Capitalizer var breedName = arr_breeds.keys[position]
        return breedName
    }
}
