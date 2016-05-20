//
//  TotalTableViewCell.swift
//  BuuYou
//
//  Created by 牛尧 on 16/5/19.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class TotalTableViewCell: UITableViewCell {
    
    @IBOutlet var CardName: UILabel!
    @IBOutlet var OrderMoney: UILabel!
    @IBOutlet var Time: UILabel!
    @IBOutlet var TansactionMoney: UILabel!
    @IBOutlet var DividedMoney: UILabel!
       override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
