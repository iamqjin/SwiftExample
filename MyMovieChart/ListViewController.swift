//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by iamqjin on 2017. 8. 16..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit
class ListViewController: UITableViewController {
    
    
    //테이블 뷰를 구성할 리스트 데이터
    
    lazy var list : [MovieVO] = {
        var datalist = [MovieVO]()
        
        return datalist
        
    }()
    
    
    override func viewDidLoad() {
        
        //1.호핀API호출을 위한 URI를 생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=1&count=10&genreId=&order=releasedateasc"
        let apiURI : URL! = URL(string: url)
        
        //2.REST API호출
        let apidata = try! Data(contentsOf: apiURI)
        
        //3.데이터 전송 결과 로그 출력
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? ""
        NSLog("API Result=\( log )")
        
        //4.JSON객체를 파싱하여 NSDictionary객체로 받음
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            //5.데이터 구조에 따라 차례대로 캐스팅하며 읽어온다.
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            //6.Iterator 처리(순회처리)를 하면서 API데이터를 MovieVO 객체에 저장한다.
            for row in movie {
                //순회 상수를 NSDictionary타입으로 캐스팅
                let r = row as! NSDictionary
                
                //테이블 뷰 리스트를 구성할 데이터 형식
                let mvo = MovieVO()
                
                //movie 배열의 각 데이터를 mvo 상수의 속성에 대입
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                
                //list 배열에 추가
                self.list.append(mvo)
            }
        } catch {
                
            }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //주어진 행에 맞는 데이터 소스를 읽어온다.
        let row = self.list[indexPath.row]
        
        //테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        //데이터 소스에 저장된 값을 각 아울렛 변수에 할당
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        
        //섬네일 경로를 인자값으로 하는 URL객체를 생성
        let url : URL! = URL(string: row.thumbnail!)
        
        //이미지를 읽어와 Data 객체에 저장
        let imageData = try! Data(contentsOf: url)
        
        //UIImage 객체를 생성하여 아울렛 변수의 image속성에 대입
        cell.thumbnail.image = UIImage(data: imageData)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        NSLog("선택된 행은 \(indexPath.row)")
    }
    
}
