//
//  ViewController.swift
//  CollectionView
//
//  Created by Whales on 2023/07/30.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout {

    let emojies = ["🤩", "🐬", "🐳", "🐋", "🐯", "🦕", "🐢", "🦎", "🐾", "🦦", "🌟", "🧩", "🎲"]
    
    let emojiCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .init(x: 16, y: 50, width: 500, height: 100), collectionViewLayout: flowLayout)
        flowLayout.scrollDirection = .horizontal
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(emojiCollectionView)
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            emojiCollectionView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            emojiCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            emojiCollectionView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            emojiCollectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        self.emojiCollectionView.delegate = self
        self.emojiCollectionView.dataSource = self
        
        emojiCollectionView.register(CustomCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    

}

// MARK: - 실험2
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CustomCell
        
        cell.configureCell()
        cell.emojiLabel.text = emojies[indexPath.row]
        
        NSLayoutConstraint.activate([
            cell.widthAnchor.constraint(equalToConstant: emojiCollectionView.frame.width),
            cell.heightAnchor.constraint(equalToConstant: emojiCollectionView.frame.height)
        ])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSizeMake(emojiCollectionView.frame.width, emojiCollectionView.frame.height)
    }
}
