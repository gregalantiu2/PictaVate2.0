//
//  TimeListViewController.swift
//  Pictavate2.0
//
//  Created by Greg Tiu on 6/8/19.
//  Copyright © 2019 Greg Tiu. All rights reserved.
//

import UIKit

class TimeListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var objectSchedule = ScheduleModel(time: "test1")    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Done Button return to main screen
    @IBAction func done(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (objectSchedule.times.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = objectSchedule.times[indexPath.row]
        cell.backgroundColor = UIColor(named: "White")
        return(cell)
    }
    
    //Datepicker View Section
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }
    
}
