//import ObjectiveC
///*
// 1. NotificationCenter를 이용하여 addObserver 메서드 호출
// 2. post 메서드 작성
//*/
//
//import Foundation
//
//extension Notification.Name {
//    static let newVideo = "newVideo"
//}
//
//
//// post가 발생하는 객체
//// 영상이 올라가면 post 하도록
//class YouTuber {
//    var subscribedNumber: Int = 200
//    var video: [String] = []
//
//    func addNewVideo() {
//        // post 하는 방법
//        NotificationCenter.default.post(name: Notification.Name("newVideo"), object: nil)        //.post(name: Notification.Name("example"), object: nil, userInfo: [NotificationKey.Key : "Example : "])
//    }
//}
//
//// 구독자
//// 유튜버를 구독하고 있으면서 영상이 올라오면 알 수 있도록
//class Subscriber {
//    var name: String = "serena"
//    // 유튜버를 가지고 있어야함(속성)
//    var subscribedYoutuberNumber: Int = 0
//    var subscribedYoutubers: [String] = []
//
//    init() {
//        NotificationCenter.default.addObserver(self, selector: #selector(goToYoutuber), name: Notification.Name("newVideo"), object: nil)
//    }
//
//    @objc func goToYoutuber() {
//        print("\(self.name)가 새로운 비디오를 보러가요")
//    }
//}
//
//let mint = YouTuber()
//let serena = Subscriber()
//
//mint.addNewVideo()

//----------------------

import Foundation

// 관찰할 수 있는 속성이 있는 클래스 정의
class Youtuber: NSObject {
    @objc dynamic var lastVideo = "NotificationCenter/KVO" // 이걸 지켜봐라
    
    func uploadVideo(_ video: String) {
        self.lastVideo = video
    }
}


// 관찰자 정의
class Subscriber: NSObject {
    @objc var youtuber: Youtuber // 누굴 관찰할건지
    var newVideoAlarm: NSKeyValueObservation?
    

    init(youtuber: Youtuber) {
        self.youtuber = youtuber
        super.init()
        
        self.newVideoAlarm = observe(
            \.youtuber.lastVideo, options: [.old, .new]
        ) { video, change in
            print("새로운 비디오가 업로드 되었습니다 - 제목: \(change.newValue)")
        }
    }
}

let youtuber = Youtuber()
let subscriber = Subscriber(youtuber: youtuber)

youtuber.uploadVideo("Struct/Class")
