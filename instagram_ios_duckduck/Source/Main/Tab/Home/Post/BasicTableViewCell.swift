//
//  BasicTableViewCell.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/11.
//

import UIKit

class BasicTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    
    static let identifier = "BasicTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell(text: String){
        cellTitle.text = text
    }
}
