//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by iamqjin on 2017. 8. 16..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit
class ListViewController: UITableViewController {
    
    
    //튜플 아이템으로 구성된 데이터 세트
    
    var dataset = [("다크나이트","영웅물에 철학에 음악까지 더해져 예술이 되다","2008-09-04",8.95),
                   ("호우시절","때를 알고 내리는 좋은 비","2009-10-08",7.31),
                   ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07",9.19)
    ]
    
    
    //테이블 뷰를 구성할 리스트 데이터
    
    lazy var list : [MovieVO] = {
        var datalist = [MovieVO]()
        
        for(title, desc, opendata, rating) in self.dataset {
            let mvo = MovieVO()
            
            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendata
            mvo.rating = rating
            
            datalist.append(mvo)
        }
        
        return datalist
        
    }()
    
    
    override func viewDidLoad() {
        //전부 삭제
    }
    
}
