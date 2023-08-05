//
//  ViewController.swift
//  Cache
//
//  Created by 조호준 on 2023/08/03.
//

import UIKit

enum Image: Int {
    case zero = 0, one
    
    var urlString: String {
        switch self {
        case .zero:
            return "https://wallpaperaccess.com/download/europe-4k-1369012"
        case .one:
            return "https://wallpaperaccess.com/download/europe-4k-1318341"
        }
    }
}

// MARK: - NSCache
//class ViewController: UIViewController {
//    @IBOutlet weak var firstImageView: UIImageView!
//    @IBOutlet weak var secondImageView: UIImageView!
//
//    let imageCache = NSCache<NSString, UIImage>()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    @IBAction func receiveFirstImage(_ sender: Any) {
//        fetchImage(imageNum: Image.zero.rawValue, imageView: firstImageView)
//    }
//
//    @IBAction func receiveSecondImage(_ sender: Any) {
//        fetchImage(imageNum: Image.one.rawValue, imageView: secondImageView)
//    }
//
//    @IBAction func resetImages(_ sender: Any) {
//        firstImageView.image = nil
//        secondImageView.image = nil
//        print("이미지를 초기화합니다.")
//    }
//
//    @IBAction func resetCache(_ sender: Any) {
//        imageCache.removeAllObjects()
//        print("모든 캐시 데이터를 삭제했습니다.")
//    }
//
//    func fetchImage(imageNum: Int, imageView: UIImageView) {
//        // 캐시가 있을 경우 캐시에서 이미지를 받아옴
//        if let image = imageCache.object(forKey: NSString(string: "\(imageNum)")) {
//            imageView.image = image
//            print("캐시된 데이터가 있습니다.")
//        } else {
//            // 캐시가 없을 경우 네트워크 통신을 통해 이미지를 받아온 후 캐시에 저장
//            let url = URL(string: Image.init(rawValue: imageNum)!.urlString)!
//
//            let task = URLSession.shared.dataTask(with: url) { data, response, error in
//                if let error = error {
//                    print("error 오류!", error.localizedDescription)
//                    return
//                }
//
//                guard let httpResponse = response as? HTTPURLResponse,
//                      (200...299).contains(httpResponse.statusCode) else {
//                    print("httpResponse 오류!")
//                    return
//                }
//
//                guard let data = data, let image = UIImage(data: data) else {
//                    print("이미지 변환 실패!")
//                    return
//                }
//
//                // 캐시에 이미지 저장
//                self.imageCache.setObject(image, forKey: NSString(string: "\(imageNum)"))
//
//                DispatchQueue.main.async {
//                    imageView.image = image
//                    print("새로운 이미지를 받아왔습니다.")
//                }
//            }
//
//            task.resume()
//        }
//    }
//}

// MARK: - URLCache
class ViewController: UIViewController {
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!

    let config = URLSessionConfiguration.default
    lazy var session = URLSession(configuration: config)
    var firstRequest: URLRequest?
    var secondRequest: URLRequest?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func receiveFirstImage(_ sender: Any) {
        fetchImage(imageNum: Image.zero.rawValue, imageView: firstImageView)
    }

    @IBAction func receiveSecondImage(_ sender: Any) {
        fetchImage(imageNum: Image.one.rawValue, imageView: secondImageView)
    }

    @IBAction func resetImages(_ sender: Any) {
        firstImageView.image = nil
        secondImageView.image = nil
        print("이미지를 초기화합니다.")
    }

    @IBAction func resetCache(_ sender: Any) {
        config.urlCache?.removeAllCachedResponses()
        print("모든 캐시 데이터를 삭제했습니다.")
    }

    func fetchImage(imageNum: Int, imageView: UIImageView) {
        // 캐시가 있을 경우 캐시에서 이미지를 받아옴
        if let request = (imageNum == 0 ? firstRequest : secondRequest),
           let cachedResponse = config.urlCache?.cachedResponse(for: request) {
            let image = UIImage(data: cachedResponse.data)
            
            imageView.image = image
            print("캐시된 데이터가 있습니다.")
        } else {
            // 캐시가 없을 경우 네트워크 통신을 통해 이미지를 받아온 후 캐시에 저장
            let url = URL(string: Image.init(rawValue: imageNum)!.urlString)!
            let request = URLRequest(url: url)
            
            if imageNum == 0 {
                firstRequest = request
            } else if imageNum == 1 {
                secondRequest = request
            }
            
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("error 오류!", error.localizedDescription)
                    return
                }
                
                guard let response,
                      let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print("httpResponse 오류!")
                    return
                }
                
                guard let data = data, let image = UIImage(data: data) else {
                    print("이미지 변환 실패!")
                    return
                }
                
                // URLCache는 자동으로 되지만 명시적으로 구현 가능
                self.config.urlCache?.storeCachedResponse(CachedURLResponse(response: response, data: data), for: request)
                
                DispatchQueue.main.async {
                    imageView.image = image
                    print("새로운 이미지를 받아왔습니다.")
                }
            }
            
            task.resume()
        }
    }
}
