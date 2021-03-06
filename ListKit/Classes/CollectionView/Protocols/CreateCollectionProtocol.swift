//
//  CreateCollectionProtocol.swift
//
//  Created by Alexander Shoshiashvili on 25/02/2018.
//  Copyright © 2018 Alexander Shoshiashvili. All rights reserved.
//

import UIKit

// MARK: - CreateCollectionProtocol

public protocol CreateCollectionProtocol: SetupCollectionProtocol {
  func createAndSetupCollectionView(with collectionViewLayout: UICollectionViewLayout)
}

extension CreateCollectionProtocol where Self: BaseAnimatedCollectionViewController {
    public func createAndSetupCollectionView(with collectionViewLayout: UICollectionViewLayout) {
        collectionView = CollectionView(frame: view.frame, collectionViewLayout: collectionViewLayout)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        if #available(iOS 11.0, *) {
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        view.sendSubviewToBack(collectionView)
        setupCollectionView()
    }
}
