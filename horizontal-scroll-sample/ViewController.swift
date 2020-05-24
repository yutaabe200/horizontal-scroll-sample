//
//  ViewController.swift
//  horizontal-scroll-sample
//
//  Created by Yuta Abe on 2020/05/25.
//  Copyright © 2020 Yuta Abe. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView
                .register(
                    UINib(nibName: "CollectionViewCell", bundle: nil),
                    forCellWithReuseIdentifier: "CollectionViewCell"
            )
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
            collectionView.collectionViewLayout = flowLayout
            collectionView.decelerationRate = .fast
        }
    }
    
    private lazy var flowLayout = FlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

// MARK: UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: self.collectionView.bounds.width * 0.7,
            height: self.collectionView.bounds.height * 0.7
        )
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.flowLayout.prepareForPaging()
    }
    
}

// MARK: UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CollectionViewCell =
            self.collectionView.dequeueReusableCell(
                withReuseIdentifier: "CollectionViewCell",
                for: indexPath
            ) as? CollectionViewCell
            else { return  UICollectionViewCell() }
        return cell
    }
    
}
