//
//  ProductTableViewCell.swift
//  23_04_25_MVVM_Demo
//
//  Created by Vishal Jagtap on 02/08/25.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet var productTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
