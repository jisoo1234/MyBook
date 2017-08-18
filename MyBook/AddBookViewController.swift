//
//  AddBookViewController.swift
//  MyBook
//
//  Created by ktds 21 on 2017. 8. 18..
//  Copyright © 2017년 CJ, Inc. All rights reserved.
//

import UIKit
protocol AddBookDelegate {
    func sendNewBook(book:Book)
} //등록화면에서 리스트화면으로 값전달을 위한거임

class AddBookViewController: UIViewController {
    
    
    var delegate:AddBookDelegate?

    @IBAction func save(_ sender: Any) {
       
        
        
        // 타이틀은 저장할때 옵셔널이 아니라 필수값이니까 가드처리
        // 사용자가 입력한 titleTextField의 text값을 가지고와서 값 여부 확인
        // if let으로 쓰는경우 title이 해당 코드블럭 안에서만 사용가능하지만 가드로 처리하면 블럭밖에서도 사용가능
        guard let title = titleTextField.text else {
            
            return
        }
        
        if title == ""{
            
            //nil 인 경우 여기를 실행하지
            let alert = UIAlertController(title: "잠깐", message: "이름을 입력하세요", preferredStyle: .alert)
            
            let closeBtn = UIAlertAction(title: "닫기", style: .cancel, handler: nil)
            alert.addAction(closeBtn)
            self.present(alert, animated: true,completion: nil)
        
        } else {
            let optPrice:Int?
            if let price = priceTextField.text {
                optPrice = Int(price)
            }  else {
                optPrice = nil
            }
            
            let book = Book(title: title,  //타이틀은 필수값이니 무조건 할당이지
                writer: writerTextField.text,
                publisher: publisherTextField.text,
                coverImage: coverImageView.image,
                price: optPrice,
                desc: descriptionTextField.text,
                url: urlTextField.text)
            
            //이전화면에서 delegate라는 객체를 만들었다면 sendNewBook함수 실행
            if let prevVC = delegate{
                prevVC.sendNewBook(book: book)
            }
            
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var writerTextField: UITextField!
    
    @IBOutlet weak var publisherTextField: UITextField!
    
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextView!
    
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// 아래의 UIImagePickerController 사용하려면 아래의 프로토콜을 추가해야해
extension AddBookViewController: UINavigationControllerDelegate,UIImagePickerControllerDelegate{

    // 포토앨범에서 사진 선택했을때 이미지뷰에 띄우는거
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var resultImage:UIImage?
        
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            resultImage = editedImage
            self.coverImageView.image = resultImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    // 포토앨범 선택시 취소할때 함수
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

//이미지 탭 했을때  위에있는 AddBookViewController 클래스에 제스터 프로토콜 추가해서 해도 되지만
// 관리상 이렇게 extension써서 확장해서 하는게 더 편함
extension AddBookViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        //print("탭") //콘솔창 확인용
        
        
        //포토접근할때는 info.plist에서 프라이버시 사용 관련해서 추가해야함
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary  //촬영화면을 보여줄것인지, 앨범을 보여줄것인지
        imagePickerController.allowsEditing = true //사진편집기능 적용할것인지  (확대/축소/위치 등 편집)
        imagePickerController.delegate = self  // delegate한테 할당
        
        self.present(imagePickerController, animated: true, completion: nil)
        
        return true
    }
    
    
}
