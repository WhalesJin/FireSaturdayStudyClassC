import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout {

    let emojies = ["🤩", "🐬", "🐳", "🐋", "🐯", "🦕", "🐢", "🦎", "🐾", "🦦", "🌟", "🧩", "🎲"]
    
    @IBOutlet weak var emojiCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emojiCollectionView.delegate = self
        self.emojiCollectionView.dataSource = self
        
        emojiCollectionView!.register(CustomCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CustomCell
        cell.configureCell()
        cell.emojiLabel.text = emojies[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSizeMake(70, 80)
    }
}
