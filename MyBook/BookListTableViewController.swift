//
//  BookListTableViewController.swift
//  MyBook
//
//  Created by ktds 21 on 2017. 8. 17..
//  Copyright © 2017년 CJ, Inc. All rights reserved.
//

import UIKit
import Foundation

class BookListTableViewController: UITableViewController {
    
    //배열선언 및 생성
    var books:[Book] = Array()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let book1 = Book(title: "맥스",
                         writer: "수컷",
                         publisher: "방배동 서울고등학교 사거리",
                         coverImage: UIImage(named:"dog1")!,
                         price:707144,
                         description: "사람잘따름,귀뒤 검은색 반점, 흰색, 진돗개",
                         url: "https://github.com/jisoo1234/MyBook")
        
        let book2 = Book(title: "호이",
                         writer: "수컷",
                         publisher: "길음동 현대아파트 3단지",
                         coverImage: UIImage(named:"dog2")!,
                         price:245187,
                         description: "한쪽다리를 절음(수술한 흔적)",
                         url: "https://github.com/jisoo1234/MyBook")
        
        let book3 = Book(title: "동동이",
                         writer: "암컷",
                         publisher: "군자동 어린이대공원",
                         coverImage: UIImage(named:"dog3")!,
                         price:865475,
                         description: "등에 갈색 털이 하트모양으로 나있음, 앞니가 빠져있음",
                         url: "https://github.com/jisoo1234/MyBook")
        
        let book4 = Book(title: "마루",
                         writer: "수컷",
                         publisher: "송파구 올림픽공원",
                         coverImage: UIImage(named:"dog4")!,
                         price:774599,
                         description: "앞발톱은 검은색, 뒷발톱은 흰색임",
                         url: "https://github.com/jisoo1234/MyBook")
        
        let book5 = Book(title: "진돌이",
                         writer: "암컷",
                         publisher: "후암동 용산고등학교 사거리",
                         coverImage: UIImage(named:"dog5")!,
                         price:214586,
                         description: "꼬리가 귀보다 짧음, 건치미남, 치아가 많이있음",
                         url: "https://github.com/jisoo1234/MyBook")
        
        
        self.books.append(book1)
        self.books.append(book2)
        self.books.append(book3)
        self.books.append(book4)
        self.books.append(book5)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    //테이블뷰의 섹션갯수
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //섹션의 셀수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return books.count
        //books배열이 갖고있는 아이템갯수 만큼
    }

   //셀 하나씩 만들때마다 이 함수를 타 (셀 객체를 만드는거지)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        if let bookCell = cell as? BookTableViewCell{
             let book = self.books[indexPath.row]
            
            let numFormatter:NumberFormatter = NumberFormatter()
            numFormatter.numberStyle = NumberFormatter.Style.decimal
            
            let price = book.price
            let priceStr = numFormatter.string(from: NSNumber(integerLiteral: price))
            
        
            
            
            bookCell.bookTitleLabel.text = book.title
            bookCell.bookWriterLabel.text = book.writer
            //bookCell.bookPriceLabel.text = String(book.price)
            bookCell.bookPriceLabel.text = priceStr
            bookCell.bookimageView.image = book.coverImage
            return bookCell

        }
        
        /*
        let book = self.books[indexPath.row]
        
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = book.writer
        cell.imageView?.image = book.coverImage
        */
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    //앞 화면 셀에서 터치해서 디테일 화면으로 넘어오는 시점에 타는 함수임
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as? UITableViewCell
        let vc = segue.destination as? BookDetailViewController
        
        guard let selectedCell = cell, let detailVC = vc else{
            return
        }
        
        if let idx = self.tableView.indexPath(for: selectedCell){
        detailVC.book = self.books[idx.row]
        }
        
        
        //if let selCell = cell{
        //let cellIdx = self.tableView.indexPath(for: selCell)
        //print(cellIdx?.row) }//인덱스 몇번타고 디테일로 가는지 콘솔창에서 확인하기 위한용
       
    }
   
}

//BookTableViewCell에 있는 클래스를 여기에 같이 넣어도 돼
class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookimageView: UIImageView!
    

    @IBOutlet weak var bookTitleLabel: UILabel!
    
    @IBOutlet weak var bookWriterLabel: UILabel!
    
    @IBOutlet weak var bookPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

