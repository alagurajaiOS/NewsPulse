//
//  ExploreVC.swift
//  News Pulse
//
//  Created by alagu-16152 on 13/06/24.
//

import UIKit

class ExploreVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private var categories = [("business", #imageLiteral(resourceName: "explore_business")), ("entertainment", #imageLiteral(resourceName: "explore_entertainment")), ("health", #imageLiteral(resourceName: "explore_health")), ("science", #imageLiteral(resourceName: "explore_science")), ("sports", #imageLiteral(resourceName: "explore_entertainment")), ("technology", #imageLiteral(resourceName: "explore_technology"))]
    
    private let viewModel = ExploreViewModel()
    
    private var sources:[Source] {
        return viewModel.sources
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        viewModel.getSources(){ result in 
            if result{
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    func setup(){
        //REGISTER CELL
        collectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        collectionView.register(UINib(nibName: "SourceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SourceCollectionViewCell")
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            //HEADER
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)
            
            if sectionIndex == 0{
                return categoryLayout()
            } else{
                return sourceLayout()
            }
            
            
            
            func categoryLayout() -> NSCollectionLayoutSection {
                //DEFINE ITEM
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 8, trailing: 5)
                
                //DEFINE GROUP
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(70))

//                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
                
                //DEFINE SECTION
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                // Add header
                section.boundarySupplementaryItems = [header]
                
                return section
                
            }
            
            func sourceLayout() -> NSCollectionLayoutSection {
                //DEFINE ITEM
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 8, trailing: 5)
                
                //DEFINE GROUP
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.6))

//                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
                
                //DEFINE SECTION
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                // Add header
                section.boundarySupplementaryItems = [header]
                
                return section
                
            }
            
//            func sourceLayout() -> NSCollectionLayoutSection {
//                //DEFINE ITEM
//                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
//                let item = NSCollectionLayoutItem(layoutSize: itemSize)
//                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 5)
//                
//                //DEFINE GROUP
//                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(70))
//                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
//                
//                //DEFINE SECTION
//                let section = NSCollectionLayoutSection(group: group)
//                section.orthogonalScrollingBehavior = .none
//                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
//                
//                // Add header
//                section.boundarySupplementaryItems = [header]
//                
//                return section
//                
//            }
            
        }
        
        collectionView.collectionViewLayout = layout
    }

}

extension ExploreVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return categories.count
        }
        return self.sources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            let (title,image) = categories[indexPath.row]
            cell.categoryLabel.text = title
            cell.categoryImageView.image = image
            return cell
        } else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SourceCollectionViewCell", for: indexPath) as! SourceCollectionViewCell
            cell.config(data: sources[indexPath.item])
            return cell
        }
    }
}

