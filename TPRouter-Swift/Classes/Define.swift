//
//  Define.swift
//  TPRouter-Swift
//
//  Created by Topredator on 2021/8/30.
//

import Foundation

/// Routing state
public enum RouterState: Int {
    case businessError = -1
    case systemError = 0
    case success = 1
}

/// Asynchronous processing
public typealias RouteAsyncHandle = ([String: Any]) -> Void
/// Handle callback asynchronously
public typealias RouteHandleCallbackClosure = (Any?, RouterState, String) -> Void
