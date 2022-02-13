

import UIKit
import Alamofire

class AuthenticationAPIManager: APIManagerBase {
    //MARK: - Get Breeds List
    func getAllBreedsNameReq(success:@escaping DefaultArrayResultAPISuccessClosure,
                      failure:@escaping DefaultAPIFailureClosure){
        
        let route: URL = GETURLfor(route: Route.EndPoint_DogBreeds.rawValue)!
        self.getBreedsNameRequestWith(route: route, success: success, failure: failure)
    }
    
    
    //MARK: - Get Breed Visuals
    func getBreedsVisualsReq(parameter: Parameters, success:@escaping DefaultImagesArrayResultAPISuccessClosure,
                      failure:@escaping DefaultAPIFailureClosure){
        let url = Route.EndPoint_ImagesByBreedName.rawValue.replacingOccurrences(of: "%", with: parameter["breedName"] as! String)
        let route: URL = GETURLfor(route: url)! 
        self.getBreedsVisualsRequestWith(route: route, success: success, failure: failure)
    }

    //MARK: - Get Image
    
}
