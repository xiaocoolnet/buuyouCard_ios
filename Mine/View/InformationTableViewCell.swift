//
//  InformationTableViewCell.swift
//  BuuYou
//
//  Created by 牛尧 on 16/4/16.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class InformationTableViewCell: UITableViewCell {

   @IBOutlet var UseridLabel: UILabel!
   @IBOutlet var NameLabel: UILabel!
   @IBOutlet var Email: UILabel!
   @IBOutlet var PhoneNumber: UILabel!
   @IBOutlet var Tencent: UILabel!
    @IBOutlet var WebAddress: UILabel!
    @IBOutlet var WebName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
