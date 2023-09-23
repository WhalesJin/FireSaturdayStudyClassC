//
//  ViewController.swift
//  OAuthStudy
//
//  Created by 조호준 on 2023/09/23.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

final class ViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedKakaoLogin(_ sender: Any) {
        // 카카오톡 실행 가능 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                    
                    self.transformKakaoProfile()
                }
            }
        }
    }
    
    private func transformKakaoProfile() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                
                //do something
                let userProfile = user?.kakaoAccount?.profile
                
                self.nicknameLabel.text = userProfile?.nickname

                DispatchQueue.global().async {
                    guard let profileImageUrl = userProfile?.profileImageUrl,
                          let imageData = try? Data(contentsOf: profileImageUrl)
                    else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self.profileImageView.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }
}
