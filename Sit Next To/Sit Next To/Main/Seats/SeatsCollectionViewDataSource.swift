//
//  SeatsCollectionViewDataSource.swift
//  Sit Next To
//
//  Created by Blerina Berisha on 11/14/19.
//  Copyright © 2019 Blerina Berisha. All rights reserved.
//

import UIKit

class SeatsCollectionViewDataSource: NSObject, UICollectionViewDataSource {

    var refresh: (() -> Void)?
    
    var seats: [Int]? {
        didSet {
            refresh?()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seats?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SeatCollectionViewCell.self), for: indexPath) as! SeatCollectionViewCell
        cell.number = seats?[indexPath.row] ?? 0
        return cell
    }
}
