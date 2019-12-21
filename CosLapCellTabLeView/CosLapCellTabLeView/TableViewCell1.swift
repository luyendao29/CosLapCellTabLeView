//
//  TableViewCell1.swift
//  CosLapCellTabLeView
//
//  Created by Boss on 12/22/19.
//  Copyright © 2019 LuyệnĐào. All rights reserved.
//

import UIKit



class TableViewCell1: UITableViewCell {
    
    
    
    var isOpen: Bool = false {
        didSet {
            
        }
    }
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var imageUpdown: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        UIView.animate(withDuration: 0.35) {
            self.imageUpdown.transform = CGAffineTransform(rotationAngle: self.isOpen ? 0 : (45.0 * .pi) / 1.0)
            self.alpha = self.isOpen ? 1 : 0
            self.layoutIfNeeded()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func OnClickAction(_ sender: Any) {
        isOpen = !isOpen
        UIView.animate(withDuration: 0.35) {
            self.imageUpdown.transform = CGAffineTransform(rotationAngle: self.isOpen ? 0 : (45.0 * .pi) / 1.0)
            self.alpha = self.isOpen ? 1 : 0
            self.layoutIfNeeded()
        }
    }
    
}
