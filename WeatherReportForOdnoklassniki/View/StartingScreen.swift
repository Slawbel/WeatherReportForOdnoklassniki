import UIKit

class StartingScreen: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let apiVM = ApiViewModel()
    
    // Индексы для отслеживания текущего размера для каждой ячейки
    private var currentHeightIndex: [Int] = Array(repeating: 0, count: 10)
    
    private var heightOfScreen = [UIScreen.main.bounds.height / 8, UIScreen.main.bounds.height / 2, UIScreen.main.bounds.height]
    private var widthOfScreen = UIScreen.main.bounds.width
    
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        return layout
    }()
    
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
        
        self.view.backgroundColor = .lightGray
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CellForStartingScreen0.self, forCellWithReuseIdentifier: "CellForStartingScreen0")
        collectionView.register(CellForStartingScreen1.self, forCellWithReuseIdentifier: "CellForStartingScreen1")
        collectionView.register(CellForStartingScreen2.self, forCellWithReuseIdentifier: "CellForStartingScreen2")
        collectionView.backgroundColor = .black
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
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
        let cellHeight = CGFloat(heightOfScreen[currentHeightIndex[indexPath.item]])
        let cell: UICollectionViewCell
        
        switch currentHeightIndex[indexPath.item] {
        case 0:
            let cell0 = collectionView.dequeueReusableCell(withReuseIdentifier: "CellForStartingScreen0", for: indexPath) as! CellForStartingScreen0
            let city = "Tokyo"
            apiVM.fetchWeatherAPIRequest(forCity: city) { [weak cell0] currentWeather in
                DispatchQueue.main.async {
                    cell0?.cityName.text = currentWeather.cityName
                    cell0?.temperature.text = currentWeather.temperatureString + "°C"
                    cell0?.setConfigurationsForCell0(cellHeight: cellHeight)
                }
            }
            cell = cell0
        case 1:
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "CellForStartingScreen1", for: indexPath) as! CellForStartingScreen1
            let city = "Tokyo"
            apiVM.fetchWeatherAPIRequest(forCity: city) { [weak cell1] currentWeather in
                DispatchQueue.main.async {
                    cell1?.cityName.text = currentWeather.cityName
                    cell1?.temperature.text = currentWeather.temperatureString + "°C"
                    cell1?.tempFeelsLike.text = currentWeather.feelsLikeTemperatureString + "°C"
                    cell1?.weatherImage.image = UIImage(systemName: currentWeather.systemIconNameString)
                    cell1?.setConfigurationsForCell1(cellHeight: cellHeight)
                }
            }
            
            // Добавление действия для кнопки выбора города
            cell1.selectCityButton.addTarget(self, action: #selector(selectCityButtonTapped(_:)), for: .touchUpInside)
            cell = cell1
        case 2:
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "CellForStartingScreen2", for: indexPath) as! CellForStartingScreen2
            let city = "Tokyo"
            apiVM.fetchWeatherAPIRequest(forCity: city) { [weak cell2] currentWeather in
                DispatchQueue.main.async {
                    cell2?.cityName.text = currentWeather.cityName
                    cell2?.temperature.text = currentWeather.temperatureString + "°C"
                    cell2?.tempFeelsLike.text = currentWeather.feelsLikeTemperatureString + "°C"
                    cell2?.pressureValue.text = currentWeather.pressureString
                    cell2?.humidityValue.text = currentWeather.humidityString
                    cell2?.windSpeedValue.text = currentWeather.windSpeedString
                    cell2?.cloudinessValue.text = currentWeather.cloudinessString
                    cell2?.sunriseValue.text = currentWeather.sunriseTime
                    cell2?.sunsetValue.text = currentWeather.sunsetTime
                    cell2?.windDegreeValue.text = currentWeather.windDegreeString
                    cell2?.weatherImage.image = UIImage(systemName: currentWeather.systemIconNameString)
                    cell2?.setConfigurationsForCell2(cellHeight: cellHeight)

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
        return CGSize(width: widthOfScreen, height: currentHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentHeightIndex[indexPath.item] = (currentHeightIndex[indexPath.item] + 1) % heightOfScreen.count
        collectionView.performBatchUpdates({
            collectionView.reloadItems(at: [indexPath])
        }, completion: nil)
    }
    
    @objc private func selectCityButtonTapped(_ sender: UIButton) {
        // Реализуйте логику выбора города
        // Например, переход на экран карты или отображение диалога выбора города
        print("Select city button tapped")
    }
}
