//
//  FinanceTableViewCell.swift
//  BuuYou
//
//  Created by 牛尧 on 16/5/18.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class FinanceTableViewCell: UITableViewCell {
    @IBOutlet var TotalBalance: UILabel!
    @IBOutlet var AvailableBalance: UILabel!
    @IBOutlet var UserMoney: UILabel!
    @IBOutlet var RunningMoney: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
