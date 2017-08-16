//
//  MovieCell.swift
//  MyMovieChart
//
//  Created by iamqjin on 2017. 8. 16..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel! // 영화제목
    
    @IBOutlet weak var desc: UILabel! //영화 설명
    
    @IBOutlet weak var opendate: UILabel! //개봉일
    
    @IBOutlet weak var rating: UILabel! //평점
}
