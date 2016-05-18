//
//  InfoTableViewCell.swift
//  BuuYou
//
//  Created by 牛尧 on 16/5/18.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    @IBOutlet var AllOrder: UILabel!

    @IBOutlet var AllMoney: UILabel!
    @IBOutlet var TodayOrder: UILabel!
    @IBOutlet var TodayMoney: UILabel!
    @IBOutlet var YesterdayOrder: UILabel!
    @IBOutlet var YesterdayMoney: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
