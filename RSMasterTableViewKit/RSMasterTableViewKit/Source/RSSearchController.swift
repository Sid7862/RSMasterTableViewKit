//
//  RSTableViewSearchBar.swift
//  RSMasterTableViewKit
//
//  Created by Rushi Sangani on 19/03/18.
//  Copyright © 2018 Rushi Sangani. All rights reserved.
//

import UIKit

/// SearchBarAttributes
open class SearchBarAttributes {

    // MARK: - Properties
    
    // placeHolder text & color
    public var attributedPlaceHolder: NSAttributedString = NSAttributedString(string: defaultSearchPlaceHolder, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
    
    // cancel button
    public var cancelButtonTitle: String = searchBarCancelButtonTitle
    
    // background color
    public var backgroundColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6)
    
    // text color
    public var textColor: UIColor = UIColor.white
    
    // search & clear icons color
    public var iconsColor: UIColor = UIColor.white
    
    // tint color or cancel button color
    public var tintColor: UIColor = UIColor.white
    
    // init
    public init(){}
}

/// RSSearchController
open class RSSearchController: NSObject {
    
    /// searchController
    lazy var searchController: UISearchController = {
    
        let searchViewController = UISearchController(searchResultsController: nil)
        return searchViewController
    }()
    
    /// to execute on search event
    var didSearch: ((String) -> ())?
    
    /// Search String
    var searchString: String = ""
    
    /// SearchBar Attributes
    lazy var searchBarAttributes: SearchBarAttributes = {
        return SearchBarAttributes()
    }()
    
    // MARK: - Init
    public init(viewController: UIViewController, tableView: UITableView) {
        super.init()
        
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.placeholder = defaultSearchPlaceHolder
        searchController.obscuresBackgroundDuringPresentation = false
        viewController.definesPresentationContext = true
        
        if #available(iOS 11.0, *) {
            viewController.navigationItem.searchController = searchController
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }
        
        // set attributes
        searchController.searchBar.tintColor = viewController.navigationController?.navigationBar.tintColor
        setSearchBarAttributes()
    }
    
    /// search text handler
    func searchForText(text: String?) {
        searchString = text ?? ""
        
        if let search = didSearch {
            search(searchString)
        }
    }
}

// MARK: - UISearchResultsUpdating
extension RSSearchController: UISearchResultsUpdating, UISearchControllerDelegate {
    
    public func updateSearchResults(for searchController: UISearchController) {
        searchForText(text: searchController.searchBar.text)
    }
    
    public func willPresentSearchController(_ searchController: UISearchController) {
        setSearchBarAttributes()
    }
}

// MARK: - Customization
extension RSSearchController {
    
    /// set search bar customization attributes
    func setSearchBarAttributes() {
        
        searchController.searchBar.tintColor = searchBarAttributes.tintColor
        
        // cancel button
        setCancelButtonTItle(searchBarAttributes.cancelButtonTitle)
        
        // textField
        if let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            
            textField.attributedPlaceholder = searchBarAttributes.attributedPlaceHolder
            textField.textColor = searchBarAttributes.textColor
            
            if let backgroundview = textField.subviews.first {
                backgroundview.backgroundColor = searchBarAttributes.backgroundColor
                backgroundview.layer.cornerRadius = 10;
                backgroundview.clipsToBounds = true;
            }
            
            // search Image
            if let searchImageView = textField.leftView as? UIImageView, let img = searchImageView.image {
                
                let templateImage = img.withRenderingMode(.alwaysTemplate)
                searchImageView.tintColor = searchBarAttributes.iconsColor
                searchImageView.image = templateImage
            }
            
            // clear button
            if let clearButton = textField.value(forKey: "clearButton") as? UIButton {
                clearButton.setImage(clearButton.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)
                clearButton.tintColor = searchBarAttributes.iconsColor
            }
        }
    }
    
    /// set cancel button attributes
    func setCancelButtonTItle(_ title: String) {
        guard let firstSubView = searchController.searchBar.subviews.first else { return }
        for view in firstSubView.subviews {
            if let cancelButton = view as? UIButton {
                cancelButton.setTitle(title, for: .normal)
                break
            }
        }
    }
}
