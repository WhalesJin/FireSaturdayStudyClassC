//
//  ViewController.swift
//  2_week6_cache
//
//  Created by Dasan on 2023/08/05.
//

import UIKit

enum ImagePath {
    static let first: String = "https://wallpaperaccess.com/download/europe-4k-1369012"
    static let second: String = "https://wallpaperaccess.com/download/europe-4k-1318341"
}

final class ViewController: UIViewController {
    //private let imageNSCache = NSCache<NSString, UIImage>()
    private let imageURLCache = URLCache.shared
    // ------------------------------------------------------------------------------
    // URLCache.shared의 memoryCapacity: 512,000 bytes
    //                  diskCapacity: 10,000,000 bytes
    //
    // CachedURLResponse의 storagePolicy가 .allowedInMemoryOnly일 때,
    // memoryCapacity: 10, 20 (* 1024 * 1024)일 때는 실패함. 30부터 성공. 31,457,280 bytes
    // 첫번째 data - 1,469,837 bytes
    // 두번째 data - 1,078,478 bytes
    // ------------------------------------------------------------------------------
    //private let imageURLCache = URLCache(memoryCapacity: 30 * 1024 * 1024, diskCapacity: 0)
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureImageView()
    }
    
    @IBAction func touchUpFirstButton(_ sender: Any) {
        loadImage(urlString: ImagePath.first, imageView: firstImageView)
    }
    
    @IBAction func touchUpSecondButton(_ sender: Any) {
        loadImage(urlString: ImagePath.second, imageView: secondImageView)
    }
    
    @IBAction func touchUpImageResetButton(_ sender: Any) {
        resetImage()
    }
    
    @IBAction func touchUpEmptyCacheButton(_ sender: Any) {
        emptyCache()
    }
}

extension ViewController {
    private func configureImageView() {
        firstImageView.backgroundColor = .lightGray
        secondImageView.backgroundColor = .lightGray
        firstImageView.contentMode = .scaleAspectFill
        secondImageView.contentMode = .scaleAspectFill
    }

    private func loadImage(urlString: String, imageView: UIImageView) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
//        if let cachedImage = imageNSCache.object(forKey: urlString as NSString) {
//            imageView.image = cachedImage
//            print("캐시된 데이터가 있습니다.")
//            return
//        }
        
        if let cachedResponse = imageURLCache.cachedResponse(for: request),
           let cachedImage = UIImage(data: cachedResponse.data)
        {
            imageView.image = cachedImage
            print("캐시된 데이터가 있습니다.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                return
            }
            
            DispatchQueue.main.async {
                guard let data = data,
                      let image = UIImage(data: data) else { return }
                //self.imageNSCache.setObject(image, forKey: urlString as NSString)
                let cachedURLResponse = CachedURLResponse(response: response!, data: data, storagePolicy: .allowed)
                self.imageURLCache.storeCachedResponse(cachedURLResponse, for: request)
                print("새로운 이미지를 받아왔습니다.")
                imageView.image = image
            }
        }
        
        task.resume()
    }
    
    private func resetImage() {
        firstImageView.image = nil
        secondImageView.image = nil
        print("이미지를 초기화합니다.")
    }
    
    private func emptyCache() {
        //imageNSCache.removeAllObjects()
        imageURLCache.removeAllCachedResponses()
        print("모든 캐시 데이터를 삭제했습니다.")
    }
}
