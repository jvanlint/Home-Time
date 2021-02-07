//
//  TramTrackerTokenAPI.swift
//  HomeTime
//
//  Created by Jason van Lint on 6/2/21.
//

import Foundation

class TramTrackerTokenAPI : APIClient {
    let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }


    /// Builds the URL and fetches a token from the TramTracker API
    /// - Parameters:
    ///   - completion: The completion handler.
    func fetchDeviceToken(completion: @escaping (Result<TokenResponse, APIError>) -> Void ) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "ws3.tramtracker.com.au"
        components.path = "/TramTracker/RestService/GetDeviceToken"
        components.queryItems = [URLQueryItem(name: "aid", value: "TTIOSJSON"),URLQueryItem(name: "devInfo", value: "HomeTime")]
        let url = components.url

        var request = URLRequest(url: url!)
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        perform(request: request, completion: parseDecodable(completion: completion))
    }
}

extension TramTrackerTokenAPI {

    struct TokenResponse : Decodable {
        let errorMessage: String?
        let hasError, hasResponse: Bool
        let responseObject: [TokenResponseObject]
        let timeRequested, timeResponded, webMethodCalled: String
    }

    // MARK: - ResponseObject
    struct TokenResponseObject: Codable {
        let type, deviceToken: String

        enum CodingKeys: String, CodingKey {
            case type = "__type"
            case deviceToken = "DeviceToken"
        }
    }
}
