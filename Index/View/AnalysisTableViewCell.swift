//
//  AnalysisTableViewCell.swift
//  BuuYou
//
//  Created by 牛尧 on 16/5/14.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class AnalysisTableViewCell: UITableViewCell {

    @IBOutlet var CardName: UILabel!
    @IBOutlet var SuccessNumber: UILabel!
    @IBOutlet var Number: UILabel!
    @IBOutlet var SuccessOrder: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
