import UIKit

class StartingScreen: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    
    private var showCustomModal = false
    private var city = ""
    private var temperature = ""
    private var feelsLikeTemperature = ""
    private var weatherIconImageView: UIImage? = nil
    
    private var counter: [UInt8] = [0, 0, 0]
    private var widthOfScreen = 0
    private var heightOfScreen: [Int] = [0, 0, 0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        widthOfScreen = Int(UIScreen.main.bounds.width)
        heightOfScreen = [Int(UIScreen.main.bounds.height/8), Int(UIScreen.main.bounds.height/2), Int(UIScreen.main.bounds.height)]
        
        self.view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CellForStartingScreen, forCellReuseIdentifier: "CellForStartingScreen")
        tableView.backgroundColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
        
        view.addSubview(tableView)
        
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    

    

    
    
}

