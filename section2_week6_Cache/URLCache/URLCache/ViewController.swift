//
//  ViewController.swift
//  URLCache
//
//  Created by Whales on 2023/08/05.
//

import UIKit

enum Image: Int {
    case one = 1, two
    
    var urlString: String {
        switch self {
        case .one:
            return "https://wallpaperaccess.com/download/europe-4k-1369012"
        case .two:
            return "https://wallpaperaccess.com/download/europe-4k-1318341"
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var firstImageButton: UIButton!
    @IBOutlet weak var secondImageButton: UIButton!
    @IBOutlet weak var resetImageButton: UIButton!
    @IBOutlet weak var emptyCacheButton: UIButton!
    
    let cache = URLCache.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureUI()
    }

    func configureUI() {
        firstImageView.backgroundColor = .systemGray4
        secondImageView.backgroundColor = .systemGray4
    }
    
    @IBAction func tappedFirstImageButton(_ sender: UIButton) {
        let imageNumber: Int
        let imageView: UIImageView
        
        switch sender {
        case firstImageButton:
            imageNumber = 1
            imageView = firstImageView
        case secondImageButton:
            imageNumber = 2
            imageView = secondImageView
        default:
            imageNumber = 0
            imageView = UIImageView()
        }
        
        // 1
        let urlString = Image.init(rawValue: imageNumber)!.urlString
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        // 캐시데이터 있으면 캐시데이터 전달
        // cachedResponse: 지정된 URL 요청에 대한 캐시에 캐시된 URL 응답을 반환합니다.
        if (self.cache.cachedResponse(for: request) != nil) {
            // 캐시에서 가져옴?
            DispatchQueue.global(qos: .userInitiated).async {
                if let data = self.cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageView.image = image
                        imageView.contentMode = .scaleAspectFill
                    }
                }
            }
        } else {
            // 2
            let task = URLSession.shared.dataTask(with: url) /* 4 */{ data, response, error in
                if let error = error {
                    print("error 오류!", error.localizedDescription)
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print("httpResponse 오류!")
                    return
                }
                
                guard let data = data, let image = UIImage(data: data) else {
                    print("이미지 변환 실패!")
                    return
                }
                
                // 캐시에 저장
                let cachedData = CachedURLResponse(response: response!, data: data)
                self.cache.storeCachedResponse(cachedData, for: request)
                
                DispatchQueue.main.async {
                    print("새로운 이미지를 받아왔습니다.")
                    imageView.image = image
                    imageView.contentMode = .scaleAspectFill
                }
            }
            // 3
            task.resume()
        }
    }
    
    @IBAction func tappedResetImageButton(_ sender: Any) {
        print("이미지를 초기화합니다.")
        firstImageView.image = nil
        secondImageView.image = nil
    }
    
    @IBAction func tappedEmptyCacheButton(_ sender: Any) {
        print("모든 캐시 데이터를 삭제했습니다.")
        cache.removeAllCachedResponses()
    }
}

