//
//  ViewController.swift
//  CollectionView
//
//  Created by 조호준 on 2023/07/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let emojies = ["🔥", "🥰", "🥲", "👍", "👨‍🔬", "🤪", "🐸", "⚾️"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.itemSize = CGSize(width: width, height: height)
        flowLayout.scrollDirection = .horizontal
        
        collectionView.collectionViewLayout = flowLayout
        collectionView.isPagingEnabled = true
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell

        cell.label.text = emojies[indexPath.row]
        
        return cell
    }
}
