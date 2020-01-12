//
//  TimeListViewController.swift
//  Pictavate2.0
//
//  Created by Greg Tiu on 6/8/19.
//  Copyright © 2019 Greg Tiu. All rights reserved.
//

import UIKit

class TimeListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    //var objSchedule = ScheduleModel()
    var scheduleTime: [ScheduleModel] = []
    let formatter = DateFormatter()
    
    @IBOutlet weak var dateSelected: UIDatePicker!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(timeCell.self, forCellReuseIdentifier: String)
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        
        //Test Data
//        let time1String = "05:30 PM"
//        let time1Time = formatter.date(from: time1String)
//
//        let time2String = "06:30 PM"
//        let time2Time = formatter.date(from: time1String)
//
//
//        objSchedule.times.append(time1Time)
//        objSchedule.times.append(time2Time)
    }
    
    //Done Button return to main screen
    @IBAction func done(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (scheduleTime.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView == self.tableView
        {
            let time = scheduleTime[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell") as! TimeViewCell
            
            cell.setTime(scheduleTime: time)
            
            cell.backgroundColor = UIColor(named: "White")
            return(cell)
        }
        
        return UITableViewCell()
    }
    
    //Datepicker View Section
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }
    
    
    @IBAction func saveTime(_ sender: Any) {
        let timeConvert = dateSelected.date
        //let currentDateTime = Date()

        let stringTime = formatter.string(from: timeConvert)
        
        let scheduleModel = ScheduleModel(time: stringTime)
        
        scheduleTime.append(scheduleModel)
        
        let index = IndexPath(row: scheduleTime.count - 1, section: 0)
                
        tableView.beginUpdates()
        tableView.insertRows(at: [index], with: .automatic)
        tableView.endUpdates()
        
    
        dismiss(animated: true, completion: nil)
        
    }
    
}

class timeCell: UITableViewCell{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews{
        //Need to implement
    }
}
