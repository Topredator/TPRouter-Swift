//
//  Router.swift
//  TPRouter-Swift
//
//  Created by Topredator on 2021/8/30.
//

import Foundation

public class Router {
    public static let shared = Router()
    private var routeMatcheDic = [String: Matcher]()
    
    // MARK:  ------------- Public method --------------------
    /// Register route
    public func register(_ url: String, closure: @escaping RouteAsyncHandle) {
        guard url.count > 0 else {
            debugPrint("⚠️   Please register a valid route !!!")
            return
        }
        if let _ = routeMatcheDic[url] {
            debugPrint("⚠️   The route has been registered. Check the route address.")
            return
        }
        routeMatcheDic[url] = Matcher(url, closure: closure)
    }
    
    /// Use Route
    /// - Parameters:
    ///   - url: route address
    ///   - parameters: route parameters
    ///   - closure: handle callback closure
    public func use(_ url: String,
                    parameters: [String: Any]? = nil,
                    closure: RouteHandleCallbackClosure? = nil) {
        guard url.count > 0 else {
            closure?(nil, .businessError, "Please enter a valid routing address.")
            return
        }
        for route in routeMatcheDic.keys {
            let matcher = routeMatcheDic[route]!
            if let request = matcher.createRequest(url, originalParams: parameters) {
                guard let closure = closure else {
                    matcher.handleClosure(request.allParams)
                    return
                }
                closure(matcher.handleClosure(request.allParams), .success, "success")
                return
            }
        }
        closure?(nil, .systemError, "The route is not registered or regular mismatch.")
    }
}
