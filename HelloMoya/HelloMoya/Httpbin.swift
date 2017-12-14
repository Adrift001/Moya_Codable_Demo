//
//  API.swift
//  HelloMoya
//
//  Created by Adrift on 2017/12/14.
//  Copyright © 2017年 Adrift. All rights reserved.
//

import Foundation
import Moya

enum Httpbin {
    case ip
}

extension Httpbin: TargetType {
    var baseURL: URL {
        return URL(string: "http://www.httpbin.org/")!
    }
    
    var path: String {
        switch self {
        case .ip:
            return "ip"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var validate: Bool {
        return false
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
