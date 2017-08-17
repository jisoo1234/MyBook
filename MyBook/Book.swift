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
    var title:String
    var writer:String
    var publisher:String
    var coverImage:UIImage
    var price:Int
    var description:String
    var url:String
    
    init(title:String,
         writer:String,
         publisher:String,
         coverImage:UIImage,
         price:Int,
         description:String,
         url:String) {
        
        self.title = title //이름
        self.writer = writer //성별
        self.publisher = publisher //잃어버린곳
        self.coverImage = coverImage //사진
        self.price = price //연락처
        self.description = description //특징
        self.url = url // url
        
    }

}
