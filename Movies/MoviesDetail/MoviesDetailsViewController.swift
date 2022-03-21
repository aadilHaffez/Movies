//
//  MoviesDetailsViewController.swift
//  Movies
//
//  Created by aadil khaskheli on 21/03/2022.
//

import Foundation
import UIKit

class MoviesDetailsViewController : UIViewController, MoviesDetailsViewProtocol {
    var presenter: MoviesDetailsPresenterProtocol?
    
    
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var dateLbl : UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
    func setNavigationTitle(title: String) {
        self.title = title
    }
    
    func setupMovies(title: String, description: String, date : String) {
        DispatchQueue.main.async {
            self.titleLbl.text = title
            self.descriptionTextView.text = description
            self.dateLbl.text = date.getYearFromDate()
        }
    }
    
    func loadImage(url: String) {
        self.bannerImage.downloaded(from: url)
    }
    
    
}
extension MoviesDetailsViewController : StoryboardInitializable {}
