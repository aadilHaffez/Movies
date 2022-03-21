//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by aadil khaskheli on 21/03/2022.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageview_news: UIImageView!
    @IBOutlet weak var label_title: UILabel!
    @IBOutlet weak var label_date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell(news: Movie) {
        

        DispatchQueue.main.async {
            self.label_title.text = news.title
//            self.label_by.text = news.byline
            self.label_date.text = news.release_date?.getYearFromDate()
        }
        
        //Check count to avoid crash - index out of bound
        if let media = news.poster_path,
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(media)")  {
                    self.imageview_news.downloaded(from: url)
        }
    }
    
}
