//
//  StoryboardInitializable.swift
//  Movies
//
//  Created by aadil khaskheli on 21/03/2022.
//

import Foundation
import UIKit

protocol StoryboardInitializable {
    static var storyboardIdentifier : String {get}
}

extension StoryboardInitializable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: Self.self)
    }
    
    static func initFromStoryboard(name: String) -> Self {
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}
