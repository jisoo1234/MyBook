//
//  Book.swift
//  MyBook
//
//  Created by ktds 21 on 2017. 8. 17..
//  Copyright © 2017년 CJ, Inc. All rights reserved.
//

import Foundation
import UIKit

class Book: NSObject, NSCoding {
    var title:String //입력받을때 타이틀을 필수항목으로 하기위해서 옵셔널 처리를 안한거임
    var writer:String?
    var publisher:String?
    var coverImage:UIImage?
    var price:Int?
    var desc:String?
    var url:String?
    
    init(title:String,
         writer:String? ,
         publisher:String? ,
         coverImage:UIImage? ,
         price:Int? ,
         desc:String? ,
         url:String? ) {
        
        self.title = title //이름
        self.writer = writer //성별
        self.publisher = publisher //잃어버린곳
        self.coverImage = coverImage //사진
        self.price = price //연락처
        self.desc = desc //특징
        self.url = url // url
        
    }
    
    //초기화를 여러개 만들수있지
    convenience init(title:String,
         writer:String) {
        //최초 초기화의 것들을(지정초기화) 가져다가 쓰는거야 (convenience~ self init)
        self.init(title:title, writer:writer, publisher:nil, coverImage:nil,
                  price:nil, desc:nil, url:nil)
        
    }
    
    //파일이 인스턴스로 만들어지는거
    required init?(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObject(forKey: "title") as! String
        self.writer = aDecoder.decodeObject(forKey: "writer") as? String
        self.publisher = aDecoder.decodeObject(forKey: "publisher") as? String
        self.coverImage = aDecoder.decodeObject(forKey: "coverImage") as? UIImage
        self.price = aDecoder.decodeObject(forKey: "price") as? Int
        self.desc = aDecoder.decodeObject(forKey: "desc") as? String
        self.url = aDecoder.decodeObject(forKey: "url") as? String
    }
    
    
    //인스턴스가 파일로 만들어지는거
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.writer, forKey: "writer")
        aCoder.encode(self.publisher, forKey: "publisher")
        aCoder.encode(self.coverImage, forKey: "coverImage")
        aCoder.encode(self.price, forKey: "price")
        aCoder.encode(self.desc, forKey: "desc")
        aCoder.encode(self.url, forKey: "url")
        
    }
    
}
