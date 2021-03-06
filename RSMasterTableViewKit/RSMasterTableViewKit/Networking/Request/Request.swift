//
//  Request.swift
//  RSMasterTableViewKit
//
//  Copyright (c) 2018 Rushi Sangani
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

/// Request
public protocol Request {
    
    /// Response Type
    associatedtype ResponseType
    
    /// URL - Specify url string
    var url: String { get set }
    
    /// HTTP Method
    var method: HTTPMethod { get set }
    
    /// Requst Headers
    var headers: [String: String]? { get set }
    
    /// Request Parameters
    var parameters: [String: Any]? { get set }
    
    /// Response Keypath - path to the key in json for result i.e. "response/data/", "data"
    var responeKeyPath: String? { get set }
    
    
    //MARK: - Init
    
    init(url: String)
    init(url: String, responeKeyPath: String)
    init(url: String, method: HTTPMethod, headers: [String: String]?, parameters: [String: Any]?, responeKeyPath: String?)
    
    /// execute request
    func execute(completion: Result<ResponseType, ResponseError>)
}

extension Request {
    
    init(url: String) {
        
    }
    
    init(url: String, responeKeyPath: String?) {
        
    }
    
    init(url: String, method: HTTPMethod, headers: [String: String]?, parameters: [String: Any]?, responeKeyPath: String?) {
        
    }
}

