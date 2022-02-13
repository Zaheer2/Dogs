
import UIKit

typealias DefaultAPIFailureClosure = (NSError) -> Void
typealias DefaultArrayResultAPISuccessClosure = (BreedsList?) -> Void
typealias DefaultImagesArrayResultAPISuccessClosure = (BreedVisuals?) -> Void

protocol APIErrorHandler {
    func handleErrorFromResponse(response: Dictionary<String,AnyObject>)
    func handleErrorFromERror(error:NSError)
}


class APIManager: NSObject {
    static let sharedInstance = APIManager()
    let authenticationManagerAPI = AuthenticationAPIManager()
}
