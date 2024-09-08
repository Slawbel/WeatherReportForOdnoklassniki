import UIKit

class StartingScreen: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var showCustomModal = false
    private var city = ""
    private var temperature = ""
    private var feelsLikeTemperature = ""
    private var weatherIconImageView: UIImage? = nil
    
    // Индексы для отслеживания текущего размера для каждой ячейки
    private var currentHeightIndex: [Int] = Array(repeating: 0, count: 10)
    
    private var heightOfScreen = [Int(UIScreen.main.bounds.height/8), Int(UIScreen.main.bounds.height/2), Int(UIScreen.main.bounds.height)]
    private var widthOfScreen = Int(UIScreen.main.bounds.width)
    
    let apiVM = ApiViewModel()
    
    // Создаем layout для UICollectionView
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        return layout
    }()
    
    // Инициализируем collectionView с layout
    private let collectionView: UICollectionView
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Устанавливаем цвет фона
        self.view.backgroundColor = .lightGray
        
        // Настраиваем collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CellForStartingScreen0.self, forCellWithReuseIdentifier: "CellForStartingScreen0")
        collectionView.register(CellForStartingScreen1.self, forCellWithReuseIdentifier: "CellForStartingScreen1")
        collectionView.register(CellForStartingScreen2.self, forCellWithReuseIdentifier: "CellForStartingScreen2")
        collectionView.backgroundColor = .black
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        
        // Устанавливаем констрейнты для collectionView
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell
        
        // Определяем фактическую высоту ячейки
        let cellHeight = CGFloat(heightOfScreen[currentHeightIndex[indexPath.item]])

        // Выбираем тип ячейки в зависимости от значения индекса высоты
        switch currentHeightIndex[indexPath.item] {
        case 0:
            let cell0 = collectionView.dequeueReusableCell(withReuseIdentifier: "CellForStartingScreen0", for: indexPath) as! CellForStartingScreen0
            self.apiVM.fetchWeatherAPIRequest(forCity: "Tokyo") { currentWeather in
                DispatchQueue.main.async {
                    cell0.cityName.text = currentWeather.cityName
                    cell0.temperature.text = currentWeather.temperatureString
                    cell0.setConfigurationsForCell0(cellHeight: cellHeight) // Используем фактическую высоту
                }
            }
            cell = cell0
        case 1:
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "CellForStartingScreen1", for: indexPath) as! CellForStartingScreen1
            self.apiVM.fetchWeatherAPIRequest(forCity: "Tokyo") { currentWeather in
                DispatchQueue.main.async {
                    cell1.cityName = currentWeather.cityName
                    cell1.temperature = currentWeather.temperatureString
                    cell1.setConfigurationsForCell1()  // Дополнительно передайте высоту, если нужно
                }
            }
            cell = cell1
        case 2:
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "CellForStartingScreen2", for: indexPath) as! CellForStartingScreen2
            self.apiVM.fetchWeatherAPIRequest(forCity: "Tokyo") { currentWeather in
                DispatchQueue.main.async {
                    cell2.cityName = currentWeather.cityName
                    cell2.temperature = currentWeather.temperatureString
                    cell2.setConfigurationsForCell2()  // Дополнительно передайте высоту, если нужно
                }
            }
            cell = cell2
        default:
            fatalError("Unexpected index")
        }
        
        cell.backgroundColor = .white
        
        return cell
    }


    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let currentHeight = heightOfScreen[currentHeightIndex[indexPath.item]]
        return CGSize(width: self.widthOfScreen, height: currentHeight)
    }
    
    // MARK: Метод для обработки нажатия на ячейку
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentHeightIndex[indexPath.item] = (currentHeightIndex[indexPath.item] + 1) % heightOfScreen.count
        
        collectionView.performBatchUpdates({
            collectionView.reloadItems(at: [indexPath])
        }, completion: nil)
    }
}
