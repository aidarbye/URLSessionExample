import UIKit

enum URLExamples: String {
//    case random_JSON = "https://random.dog/woof.json"
    case random_JSON = "https://random.dog/woof.json"
    case random_image = "https://place.dog/300/200"
}

enum UserActions: String, CaseIterable {
    case exampleOne = "Example One"
    case exampleTwo = "Example Two"
    case exampleThree = "Example Three"
    case exampleFour = "Example Four"
    case manyDogs = "many Dogs"
}


class MainCollectionController: UICollectionViewController {

    let userActions = UserActions.allCases

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userActions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as!  UserActionCell
        
        let userAction = userActions[indexPath.item]
        cell.MainLabelCell.text = userAction.rawValue
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        switch userAction {
        case .manyDogs:
            performSegue(withIdentifier: "allDogs", sender: nil)
        default:
            performSegue(withIdentifier: "showImage", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "allDogs"{
            let AllDogsVC = segue.destination as! AllDogsTableViewController
            AllDogsVC.fetchDogs()
        }
    }
    
}

extension MainCollectionController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
    
}
