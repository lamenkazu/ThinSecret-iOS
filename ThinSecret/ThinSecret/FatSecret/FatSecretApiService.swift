import OAuthSwift
import Foundation

class FatSecretApiService {
    private static let BASE_URL = "https://platform.fatsecret.com/rest/server.api"
    private static let CONSUMER_KEY = "2025ae264c714fd780759b99204d576f"
    private static let CONSUMER_SECRET = "2b98c335db38495dba65b6396bc66069"
    
    static func searchFoods(query: String, completion: @escaping (Result<String, Error>) -> Void) {
        let url = BASE_URL + "?method=foods.search&search_expression=\(query)"
        let oauthSwift = OAuth1Swift(
            consumerKey: CONSUMER_KEY,
            consumerSecret: CONSUMER_SECRET,
            requestTokenUrl: "REQUEST_TOKEN_URL",
            authorizeUrl: "AUTHORIZE_URL",
            accessTokenUrl: "ACCESS_TOKEN_URL"
        )
        
        oauthSwift.client.get(url) { result in
            switch result {
            case .success(let response):
                if let stringResponse = response.string {
                    completion(.success(stringResponse))
                } else {
                    completion(.failure(NSError(domain: "Invalid response data", code: 0, userInfo: nil)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func getFoodDetails(foodId: String, completion: @escaping (Result<String, Error>) -> Void) {
        let url = BASE_URL + "?method=food.get&food_id=\(foodId)"
        let oauthSwift = OAuth1Swift(
            consumerKey: CONSUMER_KEY,
            consumerSecret: CONSUMER_SECRET,
            requestTokenUrl: "REQUEST_TOKEN_URL",
            authorizeUrl: "AUTHORIZE_URL",
            accessTokenUrl: "ACCESS_TOKEN_URL"
        )
        
        oauthSwift.client.get(url) { result in
            switch result {
            case .success(let response):
                if let stringResponse = response.string {
                    completion(.success(stringResponse))
                } else {
                    completion(.failure(NSError(domain: "Invalid response data", code: 0, userInfo: nil)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
