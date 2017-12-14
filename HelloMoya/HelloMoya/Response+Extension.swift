//
//  Response+Extension.swift
//  HNTS-Consumer
//
//  Created by Adrift on 2017/6/2.
//  Copyright © 2017年 华农天时. All rights reserved.
//

import Foundation
import Moya

public extension Response {
    
    public func mapForObject<T: Codable>(_ type: T.Type, using decoder: JSONDecoder = .init()) throws -> T {
        do {
            let object = try decoder.decode(T.self, from: data)
            return object
        } catch {
            throw CustomError.decode(error)
        }
    }
    
    public func mapForArray<T: Codable>(_ type: T.Type, using decoder: JSONDecoder = .init()) throws -> [T] {
        do {
            let arr = try decoder.decode(Array<T>.self, from: data)
            return arr
        } catch {
            throw CustomError.decode(error)
        }
    }
}
