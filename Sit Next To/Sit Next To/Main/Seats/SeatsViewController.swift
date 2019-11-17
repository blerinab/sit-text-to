//
//  SeatsViewController.swift
//  Sit Next To
//
//  Created by Blerina Berisha on 11/14/19.
//  Copyright © 2019 Blerina Berisha. All rights reserved.
//

import UIKit

class SeatsViewController: UIViewController {
    
    // Use to close this view controller.
    var needsNewSeats: (() -> Void)?
    
    var shuffler: Shuffler?
    
    var seatNumbers: [Int]? {
        didSet {
            if isViewLoaded {
                updateSeatsLabel(withNumber: seatNumbers?.count)
                seatsCollectionViewDataSource?.seats = seatNumbers
            }
        }
    }
    
    @IBOutlet private weak var peopleLabel: UILabel!
    @IBOutlet private var collectionView: UICollectionView!
    
    private var seatsCollectionViewDataSource: SeatsCollectionViewDataSource?
    
    private let sectionInsets = UIEdgeInsets(top: 40.0, left: 80.0, bottom: 40.0, right: 80.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateSeatsLabel(withNumber: seatNumbers?.count)
        
        // Data source
        setupCollectionView()

    }
    
    // MARK: - View
    private func setupCollectionView() {
        collectionView.delegate = self
        seatsCollectionViewDataSource = SeatsCollectionViewDataSource()
        seatsCollectionViewDataSource?.seats = seatNumbers
        seatsCollectionViewDataSource?.refresh = { [unowned self] in
            self.collectionView.reloadData()
        }
        
        collectionView.dataSource = seatsCollectionViewDataSource
    }
    
    // MARK: - Randomize
    
    private func shuffleSeats() -> [Int]? {
        guard let seatNumbersCount = seatNumbers?.count else { return nil }
        return shuffler?.shuffledNumbers(withTotalOf: seatNumbersCount)
    }
    
    // MARK: - Views
    
    private func updateSeatsLabel(withNumber number: Int?) {
        if let seats = seatNumbers {
            if seats.count == 0 {
                peopleLabel.text = "0 people"
            } else if seats.count == 1 {
                peopleLabel.text = "1 person"
            } else {
                peopleLabel.text = "\(seats.count) people"
            }
        } else {
            peopleLabel.text = "-"
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func handleNewSeatsAction(_ sender: UIBarButtonItem) {
        needsNewSeats?()
    }
    
    
    @IBAction private func randomizeSeatsAction(_ sender: UIBarButtonItem) {
        seatNumbers = shuffleSeats()
    }
}

extension SeatsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let seatNumbers = seatNumbers else { return CGSize.zero }
        
        let paddingSpace = sectionInsets.left + sectionInsets.right
        var availableWidth = collectionView.frame.width - paddingSpace - 40

        var itemsPerRow: CGFloat = 2

        if seatNumbers.count % 2 != 0 { // If odd number of items
            if indexPath.row == seatNumbers.count - 1 {
                itemsPerRow = 1
                availableWidth = availableWidth + 40
            }
        }
        
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
