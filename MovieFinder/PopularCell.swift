//
//  PopularCell.swift
//  MovieFinder
//
//  Created by Kyungmo on 2019/09/29.
//  Copyright © 2019 Kyungmo. All rights reserved.
//

import UIKit

class PopularCell: UICollectionViewCell {
    static let cellID = "PopularCell"
    
    @IBOutlet var titleLb: UILabel!
    @IBOutlet var posterIv: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
