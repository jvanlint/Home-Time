//
//  TramTrackerAPI.swift
//  HomeTime
//
//  Created by Jason van Lint on 5/2/21.
//

import Foundation

class TramTrackerAPI : APIClient {
    let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func fetchTramStopInfo(stop: Int, line: Int, completion: @escaping (Result<TramStopResponse, APIError>) -> Void ) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "ws3.tramtracker.com.au"
        components.path = "/TramTracker/RestService/GetNextPredictedRoutesCollection/\(stop)/\(line)/false"
        components.queryItems = [URLQueryItem(name: "aid", value: "TTIOSJSON"),URLQueryItem(name: "cid", value: "2"), URLQueryItem(name: "tkn", value: UserDefaults.deviceToken)]
        let url = components.url

        var request = URLRequest(url: url!)
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        perform(request: request, completion: parseDecodable(completion: completion))
    }

}

extension TramTrackerAPI {

    // MARK: - TramStop
    struct TramStopResponse: Codable {
        let errorMessage: String?
        let hasError, hasResponse: Bool
        let responseObject: [ResponseObject]
        let timeRequested, timeResponded, webMethodCalled: String
    }

    // MARK: - ResponseObject
    struct ResponseObject: Codable {
        let type: String
        let airConditioned: Bool
        let destination: String
        let displayAC: Bool
        let disruptionMessage: DisruptionMessage
        let hasDisruption, hasSpecialEvent: Bool
        let headBoardRouteNo: String
        let internalRouteNo: Int
        let isLowFloorTram, isTTAvailable: Bool
        let predictedArrivalDateTime, routeNo, specialEventMessage: String
        let tripID, vehicleNo: Int

        enum CodingKeys: String, CodingKey {
            case type = "__type"
            case airConditioned = "AirConditioned"
            case destination = "Destination"
            case displayAC = "DisplayAC"
            case disruptionMessage = "DisruptionMessage"
            case hasDisruption = "HasDisruption"
            case hasSpecialEvent = "HasSpecialEvent"
            case headBoardRouteNo = "HeadBoardRouteNo"
            case internalRouteNo = "InternalRouteNo"
            case isLowFloorTram = "IsLowFloorTram"
            case isTTAvailable = "IsTTAvailable"
            case predictedArrivalDateTime = "PredictedArrivalDateTime"
            case routeNo = "RouteNo"
            case specialEventMessage = "SpecialEventMessage"
            case tripID = "TripID"
            case vehicleNo = "VehicleNo"
        }
    }

    // MARK: - DisruptionMessage
    struct DisruptionMessage: Codable {
        let displayType: String
        let messageCount: Int
        let messages: [Message]

        enum CodingKeys: String, CodingKey {
            case displayType = "DisplayType"
            case messageCount = "MessageCount"
            case messages = "Messages"
        }
    }

    // MARK: - Message
    struct Message: Codable {
        let additionalInfoOnWebsite: Bool
        let infoOnWebSiteCategory, message: String
        let messageID: Int
        let route: String

        enum CodingKeys: String, CodingKey {
            case additionalInfoOnWebsite = "AdditionalInfoOnWebsite"
            case infoOnWebSiteCategory = "InfoOnWebSiteCategory"
            case message = "Message"
            case messageID = "MessageId"
            case route = "Route"
        }
    }
}
