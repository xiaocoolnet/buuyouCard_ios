//
//  MineTableViewCell.swift
//  BuuYou
//
//  Created by 牛尧 on 16/4/15.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class MineTableViewCell: UITableViewCell {
    @IBOutlet var HeadPhoto: UIImageView!

    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var IDLabel: UILabel!
    @IBOutlet var Secretkey: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
