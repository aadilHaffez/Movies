//
//  Date.swift
//  Movies
//
//  Created by aadil khaskheli on 21/03/2022.
//

import Foundation

extension String {
    
    func getYearFromDate() -> String? {
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-mm-dd"
        guard let date = df.date(from: self) else {return nil}
        df.dateFormat = "yyyy"
        return df.string(from: date)
        
    }
}
