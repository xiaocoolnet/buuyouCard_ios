//
//  SafeCenterTableViewCell.swift
//  BuuYou
//
//  Created by 牛尧 on 16/4/19.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class SafeCenterTableViewCell: UITableViewCell {

    @IBOutlet var SafeCode: UILabel!
    @IBOutlet var Email: UILabel!
    @IBOutlet var SafePhone: UILabel!
    @IBOutlet var IDcade: UILabel!
    @IBOutlet var FamilyAddress: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
