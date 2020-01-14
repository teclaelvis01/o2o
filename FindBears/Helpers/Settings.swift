//
//  Config.swift
//  FindBears
//
//  Created by Elvis Reyes on 13/01/2020.
//  Copyright © 2020 Elvis Reyes. All rights reserved.
//

import UIKit
import Foundation

struct Config {

    struct Api {
        static let serverUrl = "https://api.punkapi.com/v2"
        
    }
}

class Settings {
    
    func serverUrl() -> URL? {
        guard let url = URL(string: Config.Api.serverUrl) else { return nil }
        return url
    }
}


