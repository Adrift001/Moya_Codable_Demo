//
//  ObservableType+Extension.swift
//  HNTS-Consumer
//
//  Created by Adrift on 2017/6/2.
//  Copyright © 2017年 华农天时. All rights reserved.
//

import Foundation
import RxSwift
import Moya

//public extension ObservableType where E == Response {
//
//    public func mapForObject<T: Codable>(_ type: T.Type) -> Observable<T> {
//        return flatMap({ (response) -> Observable<T> in
//            return Observable.just(try response.mapForObject(T.self))
//        })
//    }
//
//    public func mapForArray<T: Codable>(_ type: T.Type) -> Observable<[T]> {
//        return flatMap({ (response) -> Observable<[T]> in
//            return Observable.just(try response.mapForArray(T.self))
//        })
//    }
//}

public extension PrimitiveSequence where E == Response {
    public func mapForObject<T: Codable>(_ type: T.Type) -> Observable<T> {
        return asObservable().flatMap({ (response) -> Observable<T> in
            return Observable.just(try response.mapForObject(T.self))
        })
    }
    
    public func mapForArray<T: Codable>(_ type: T.Type) -> Observable<[T]> {
        return asObservable().flatMap({ (response) -> Observable<[T]> in
            return Observable.just(try response.mapForArray(T.self))
        })
    }
}
