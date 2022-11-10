//
//  PostContentCollectionViewCell.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/11.
//

import UIKit

class PostContentCollectionViewCell: UICollectionViewCell, UITextViewDelegate {
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentTextView: UITextView!
    
    static let identifier = "PostContentCollectionViewCell"
    let textViewPlaceHolder = "문구 입력..."
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initPlaceHolder ()
    }
    func initPlaceHolder(){
        contentTextView.text = textViewPlaceHolder
        contentTextView.textColor = .lightGray
        contentTextView.delegate = self
    }
    func setCell(image: UIImage){
        contentImageView.image = image
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .lightGray
        }
    }
}
