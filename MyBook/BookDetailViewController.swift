//
//  BookDetailViewController.swift
//  MyBook
//
//  Created by ktds 21 on 2017. 8. 17..
//  Copyright © 2017년 CJ, Inc. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    
    //앞 화면에서 전달받을 값
    var book:Book?

    @IBOutlet weak var bookCoverImageView: UIImageView!
    
    
    @IBOutlet weak var bookWriterLabel: UILabel!
    
    
    @IBOutlet weak var bookPublisherLabel: UILabel!
    
    
    @IBOutlet weak var bookPriceLabel: UILabel!
    
    
    
    @IBOutlet weak var bookDescriptionTextView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //앞에 화면에서 값 전달받은걸 newbook에 다시 할당하는거임
        guard let newBook = self.book else{
            return
        }
        self.bookWriterLabel.text = newBook.writer
        self.bookCoverImageView.image = newBook.coverImage
        self.bookPublisherLabel.text = newBook.publisher
        
        if let bookPrice = newBook.price {
            self.bookPriceLabel.text = String(bookPrice)
        } //book class에서 옵셔널 처리했는데 int를 string으로 바꿀때는 if let 으로 써야해
        
        self.bookDescriptionTextView.text = newBook.description
    
        //title 받는거
        self.navigationItem.title = newBook.title
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // 디테일화면에서 url넘기는 화면으로 넘어갈때
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let webVC = segue.destination as? WebViewController{
            webVC.shopURL = self.book?.url
        }
    }
    

}
