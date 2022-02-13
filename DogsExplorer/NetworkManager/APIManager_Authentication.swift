
import UIKit
import Alamofire

extension APIManager{
    
    //MARK: - Get Breeds List
    func getAllBreeds(success:@escaping DefaultArrayResultAPISuccessClosure,
                      failure:@escaping DefaultAPIFailureClosure){
        authenticationManagerAPI.getAllBreedsNameReq(success: success, failure: failure)
    }

    //MARK: - Get Breed Visuals
    func getBreedVisuals(parameters: Parameters,
                      success:@escaping DefaultImagesArrayResultAPISuccessClosure,
                      failure:@escaping DefaultAPIFailureClosure){
        authenticationManagerAPI.getBreedsVisualsReq(parameter: parameters, success: success, failure: failure)
    }
//
//    //MARK: - Get Image
//    func getBreedImages(parameters: Parameters,
//                      success:@escaping DefaultArrayResultAPISuccessClosure,
//                      failure:@escaping DefaultAPIFailureClosure){
//        authenticationManagerAPI.getAllEvents(parameters: parameters,success:success,failure:failure)
//    }
}
