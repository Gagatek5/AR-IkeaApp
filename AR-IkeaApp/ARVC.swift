//
//  ARVC.swift
//  AR-IkeaApp
//
//  Created by Tom on 07/01/2018.
//  Copyright © 2018 Tom. All rights reserved.
//

import UIKit
import ARKit

class ARVC: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {

    let arrayOfItem : [String] = ["cup", "vase", "boxing", "table"]
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    @IBOutlet weak var scaneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scaneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.scaneView.session.run(configuration)
        self.itemsCollectionView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfItem.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Items", for: indexPath) as! itemCell
        cell.itemLabel.text = self.arrayOfItem[indexPath.row]
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.green
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.orange
    }

}

