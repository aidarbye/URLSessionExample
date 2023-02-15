import UIKit

class AllDogsTableViewController: UITableViewController {
    var dogs: [Dog] = []
    var dog: Dog?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Gucci_cell", for: indexPath) as! TableViewCell
        let dog = dogs[indexPath.row]
        cell.configure(with: dog)
        return cell
    }
}

extension AllDogsTableViewController {
    func fetchDogs() {
        guard let url = URL(string: URLExamples.random_JSON.rawValue) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                self.dog = try JSONDecoder().decode(Dog.self, from: data)
                self.dogs.append(self.dog!)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
