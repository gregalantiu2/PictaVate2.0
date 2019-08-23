import UIKit

class ScheduleModel{
    let id: UUID
    var time: String?
    var times: [Date?]
    var image: UIImage?
    
    init(){
        self.times = []
        id = UUID()
    }
}
