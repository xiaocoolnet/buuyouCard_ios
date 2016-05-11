//
//  OrdersTableViewCell.swift
//  BuuYou
//
//  Created by 牛尧 on 16/5/10.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {
    
    @IBOutlet var CardName: UILabel!
    @IBOutlet var PayStatus: UILabel!
    @IBOutlet var CardNumber: UILabel!
    @IBOutlet var PayTime: UILabel!
    @IBOutlet var OrderMoney: UILabel!
    @IBOutlet var Realmoney: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
