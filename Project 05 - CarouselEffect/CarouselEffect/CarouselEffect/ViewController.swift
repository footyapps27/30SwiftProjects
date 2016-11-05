//
//  ViewController.swift
//  CarouselEffect
//
//  Created by Samrat on 5/11/16.
//  Copyright © 2016 SMRT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var collectionView: UICollectionView!
    var arrMockData = Array<MockData>()
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        populateMockData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Helper Methods
    func populateMockData() {
        arrMockData = [
            MockData(imageName: "hello", description:"Hello there, i miss u."),
            MockData(imageName: "dudu", description:"🐳🐳🐳🐳🐳"),
            MockData(imageName: "bodyline", description:"Training like this, #bodyline"),
            MockData(imageName: "wave", description:"I'm hungry, indeed."),
            MockData(imageName: "darkvarder", description:"Dark Varder, #emoji"),
            MockData(imageName: "hhhhh", description:"I have no idea, bitch"),
        ]
    }
}

//MARK: Extension for CollectionView
extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMockData.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as? CustomCollectionViewCell {
            cell.imgVwBackground.image = UIImage(named: arrMockData[indexPath.row].imageName)
            cell.lblDescription.text = arrMockData[indexPath.row].description
            return cell
        }
        
        debugPrint("The CustomCollectionViewCell was found to be null.")
        // If the cell returns null.
        return CustomCollectionViewCell()
    }
    
}

