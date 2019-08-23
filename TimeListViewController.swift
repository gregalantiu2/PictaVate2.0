//
//  TimeListViewController.swift
//  Pictavate2.0
//
//  Created by Greg Tiu on 6/8/19.
//  Copyright © 2019 Greg Tiu. All rights reserved.
//

import UIKit

class TimeListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var objSchedule = ScheduleModel()
    let formatter = DateFormatter()

        
    @IBOutlet weak var dateSelected: UIDatePicker!
    
    @IBOutlet weak var timesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        //Test Data
        let time1String = "05:30 PM"
        let time1Time = formatter.date(from: time1String)
        
        
        objSchedule.times.append(time1Time)
        //objSchedule.times.append("test2")
    }
    
    //Done Button return to main screen
    @IBAction func done(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (objSchedule.times.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        
        if objSchedule.times[indexPath.row] != nil {
            cell.textLabel?.text = formatter.string(from: objSchedule.times[indexPath.row]!)
        }
        
        cell.backgroundColor = UIColor(named: "White")
        return(cell)
    }
    
    //Datepicker View Section
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }
    
    
    @IBAction func saveTime(_ sender: Any) {
        objSchedule.times.append(dateSelected.date)
        dismiss(animated: true, completion: nil)
        
    }
    
}
