//
//  AccountDataTableViewCell.swift
//  BuuYou
//
//  Created by 牛尧 on 16/4/16.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class AccountDataTableViewCell: UITableViewCell {
    
    @IBOutlet var AccountName: UILabel!
    @IBOutlet var BankName: UILabel!
    @IBOutlet var AccountLabel: UILabel!
    @IBOutlet var AccountAddress: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
