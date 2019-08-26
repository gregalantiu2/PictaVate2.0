//
//  TimeViewCell.swift
//  Pictavate2.0
//
//  Created by Greg Tiu on 8/24/19.
//  Copyright © 2019 Greg Tiu. All rights reserved.
//

import UIKit

class TimeViewCell: UITableViewCell {

    @IBOutlet weak var scheduledTime: UILabel!
    
    func setTime(scheduleTime: ScheduleModel){
        scheduledTime.text = scheduleTime.time
    }
}
