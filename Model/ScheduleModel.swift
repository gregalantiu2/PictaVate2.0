import UIKit

class ScheduleModel{
    let id: UUID
    var time: String
    var times: [String]
    var image: UIImage?
    
    init(time: String){
        self.time = time
        self.times = []
        times.append(time)
        id = UUID()
    }
}
