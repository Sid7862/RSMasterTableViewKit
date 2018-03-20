//
//  Constants.swift
//
//  Copyright (c) 2017 Rushi Sangani
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
import UIKit

/// TableView Fetch More Data States
public enum FetchDataStatus {
    case none, started, completed
}

/// UITableViewCellConfiguration
public typealias UITableViewCellConfiguration = ((_ cell: RSTableViewCell, _ dataObject: Any, _ indexPath: IndexPath) -> ())

/// DataSource
public typealias DataSource<T> = [T]

/// FilteredDataSource
public typealias FilteredDataSource<T> = [T]

/// PullToRefresh
public typealias PullToRefreshHandler = () -> ()

/// Infinite Scrolling
public typealias InfiniteScrollingHandler = () -> ()

/// UISearchBarResult
public typealias UISearchBarResult = ((_ searchText: String) -> (FilteredDataSource<Any>))

/// SearchBar CancelButton
public typealias SearchBarCancelButtonAttributes = (title: String, tintColor: UIColor?)

/// SearchBar TintColor
public let defaultSearchBarTintColor  = UIColor(white: 0.9, alpha: 0.9)

/// Strings
public let defaultSearchPlaceHolder   = "Search"
