//
//  API.swift
//  FindBears
//
//  Created by Elvis Reyes on 13/01/2020.
//  Copyright © 2020 Elvis Reyes. All rights reserved.
//

import Foundation
import Moya
enum API {
    case searchBears(parameters: [String: Any])
}

extension API: TargetType {
    
    var baseURL: URL {
        guard let url = Settings().serverUrl() else { fatalError("can´t get URL") }
        return url
    }
    
    var headers: [String: String]? {
        switch self {
        case .searchBears:
            return  nil        }
    }
    
    var path: String {
        switch self {
        case .searchBears:
            return "/beers"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .searchBears(let parameters):
            return parameters
        }
    }
    
    var task: Task {
        switch self {
        case .searchBears(let parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var sampleData: Data {
        return Data()
    }
    
}
