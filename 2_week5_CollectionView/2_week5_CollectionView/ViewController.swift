//
//  ViewController.swift
//  2_week5_CollectionView
//
//  Created by Dasan on 2023/07/29.
//

import UIKit

class ViewController: UIViewController {
    let emojies = ["🔥", "🥰", "🥲", "👍", "👨‍🔬", "🤪", "🐸", "⚾️"]

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collectionView.delegate = self
        collectionView.dataSource = self
        
        guard let width = collectionView.superview?.frame.width else { return }

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: width, height: 200)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.scrollDirection = .horizontal

        collectionView.collectionViewLayout = flowLayout // 애니메이션 없음
        //collectionView.setCollectionViewLayout(flowLayout, animated: true) // 애니메이션 있음
    
        collectionView.isPagingEnabled = false
        collectionView.decelerationRate = .fast
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCell else {
            return CustomCell()
        }
        
        let data = emojies[indexPath.item]
        cell.update(data: data)
        
        return cell
    }
}

//extension ViewController: UICollectionViewDelegate {
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        // item의 사이즈와 item 간의 간격 사이즈를 구해서 하나의 item 크기로 설정.
//        //let layout = emojiCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//
//        //let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
//        let cellWidthIncludingSpacing = scrollView.frame.width + 10
//
//        // targetContentOffset을 이용하여 x좌표가 얼마나 이동했는지 확인
//        // 이동한 x좌표 값과 item의 크기를 비교하여 몇 페이징이 될 것인지 값 설정
//        var offset = targetContentOffset.pointee
//        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
//        var roundedIndex = round(index)
//
//        // scrollView, targetContentOffset의 좌표 값으로 스크롤 방향을 알 수 있다.
//        // index를 반올림하여 사용하면 item의 절반 사이즈만큼 스크롤을 해야 페이징이 된다.
//        // 스크롤로 방향을 체크하여 올림,내림을 사용하면 좀 더 자연스러운 페이징 효과를 낼 수 있다.
//        if scrollView.contentOffset.x > targetContentOffset.pointee.x {
//            roundedIndex = floor(index)
//        } else {
//            roundedIndex = ceil(index)
//        }
//
//        // 위 코드를 통해 페이징 될 좌표값을 targetContentOffset에 대입하면 된다.
//        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
//        targetContentOffset.pointee = offset
//    }
//}

extension ViewController: UICollectionViewDelegateFlowLayout {
    // MARK: - 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    // MARK: - 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    // MARK: - 셀 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        let size = CGSize(width: width, height: height)
        return size
    }
}

class CustomCell: UICollectionViewCell {
    let label = UILabel()
    
    func update(data: String) {
        self.contentView.backgroundColor = .yellow
        //let label = UILabel()
        
        label.text = data
        self.contentView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            //contentView.widthAnchor.constraint(equalToConstan)
        ])
    }
}
