//
//  Book.swift
//  MyBook
//
//  Created by ktds 21 on 2017. 8. 17..
//  Copyright © 2017년 CJ, Inc. All rights reserved.
//

import Foundation
import UIKit

class Book {
    var title:String //입력받을때 타이틀을 필수항목으로 하기위해서 옵셔널 처리를 안한거임
    var writer:String?
    var publisher:String?
    var coverImage:UIImage?
    var price:Int?
    var description:String?
    var url:String?
    
    init(title:String,
         writer:String? ,
         publisher:String? ,
         coverImage:UIImage? ,
         price:Int? ,
         description:String? ,
         url:String? ) {
        
        self.title = title //이름
        self.writer = writer //성별
        self.publisher = publisher //잃어버린곳
        self.coverImage = coverImage //사진
        self.price = price //연락처
        self.description = description //특징
        self.url = url // url
        
    }
    
    //초기화를 여러개 만들수있지
    convenience init(title:String,
         writer:String) {
        //최초 초기화의 것들을(지정초기화) 가져다가 쓰는거야 (convenience~ self init)
        self.init(title:title, writer:writer, publisher:nil, coverImage:nil,
                  price:nil, description:nil, url:nil)
        
    }
    

}
