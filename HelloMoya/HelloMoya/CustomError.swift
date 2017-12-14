//
//  MoyaError+Extension.swift
//  HNTS
//
//  Created by Adrift on 2017/4/19.
//  Copyright © 2017年 华农天时. All rights reserved.
//

import Foundation
import Moya

public enum CustomError: LocalizedError {
    case custom(Response)
    case decode(Swift.Error)
}

extension CustomError {
    public var errorDescription: String? {
        switch self {
            case .custom(let response):
                //because our server two style error, one is `{"msg": "password is incorrent"}`, another is `missing parameters`, so i must solve two types error.🙂
                do {
                    let decoder = JSONDecoder()
                    let error = try decoder.decode(ErrorModel.self, from: response.data)
                    return error.msg
                } catch {
                    let msg = String(data: response.data, encoding: String.Encoding.utf8)!
                    return msg
                }
            case .decode(let error):
                //decode error
                return error.localizedDescription
        }
    }
}

