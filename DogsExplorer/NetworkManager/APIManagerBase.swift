


import UIKit
import Alamofire

enum Route: String {
    case EndPoint_DogBreeds = "https://dog.ceo/api/breeds/list/all"
    case EndPoint_ImagesByBreedName = "https://dog.ceo/api/breed/%/images"
}

class APIManagerBase: NSObject {
    func getBreedsNameRequestWith(route: URL,
                        success:@escaping DefaultArrayResultAPISuccessClosure,
                        failure:@escaping DefaultAPIFailureClosure){
        
        AF.request(route, method: .get).responseDecodable(of: BreedsList.self)  {
            response in
            switch response.result {
            case .success :
                let dataResponse : BreedsList? = response.value
                if dataResponse != nil {
                    success(dataResponse)
                }
                else {
                    break
                }
            case .failure :
                break
            }
        }
    }
    func getBreedsVisualsRequestWith(route: URL,
                        success:@escaping DefaultImagesArrayResultAPISuccessClosure,
                        failure:@escaping DefaultAPIFailureClosure){
        
        AF.request(route, method: .get).responseDecodable(of: BreedVisuals.self)  {
            response in
            switch response.result {
            case .success :
                let dataResponse : BreedVisuals? = response.value
                if dataResponse != nil {
                    success(dataResponse)
                }
                else { break }
            case .failure :
                break
            }
        }
    }

    func GETURLfor(route:String) -> URL?{
        
        if let components: NSURLComponents = NSURLComponents(string: (route)){
            return components.url! as URL
        }
        
        
        return nil
        
    }
}


