//
//  LoginLogTableViewCell.swift
//  BuuYou
//
//  Created by 牛尧 on 16/4/19.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class LoginLogTableViewCell: UITableViewCell {
    @IBOutlet var LoginAddress: UILabel!
    @IBOutlet var LoginDate: UILabel!
    @IBOutlet var LoginIP: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
