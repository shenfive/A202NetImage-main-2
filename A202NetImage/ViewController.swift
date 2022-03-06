//
//  ViewController.swift
//  A202NetImage
//
//  Created by 申潤五 on 2022/2/20.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var theImageView: UIImageView!
    
    @IBOutlet weak var content: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        theImageView.layer.borderColor = UIColor.red.cgColor
        theImageView.layer.borderWidth = 3
        theImageView.layer.cornerRadius = theImageView.bounds.width / 2
        theImageView.clipsToBounds = true
        
        content.clipsToBounds = false
        content.layer.cornerRadius = content.bounds.width / 2
        content.layer.shadowColor = UIColor.gray.cgColor
        content.layer.shadowRadius = 20         //陰影
        content.layer.shadowOpacity = 0.6;
        content.layer.shadowColor = UIColor.gray.cgColor
        content.layer.shadowOffset = CGSize(width: 10, height: 10)

        
        
        

        
        let apiModel = APIModel.share

        apiModel.queryRandomUserAlamofire { data, respError in
            if respError != nil {
                print(respError?.localizedDescription)
            }else{
                let respData = data as? Data ?? Data()
                
                let dataString = String(decoding:respData, as: UTF8.self)
                print(dataString)
            }
        }
        
        
        let path = "https://attach.setn.com/newsimages/2019/12/28/2328596-PH.jpg"
        let url = URL(string: path)!

        
        theImageView.sd_setImage(with: url, completed: nil)
        
        
        
    }


}
