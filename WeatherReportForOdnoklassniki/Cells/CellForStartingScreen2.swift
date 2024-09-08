import UIKit

class CellForStartingScreen2: UICollectionViewCell {
    
    let cityName = UILabel()
    let temperature = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cityName)
        contentView.addSubview(temperature)
        // Настроить UI элементы
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConfigurationsForCell2(cellHeight: CGFloat) {
        // Настроить ячейку, используя cellHeight
    }
    
    func updateWeatherData(completion: @escaping () -> Void) {
        // Вызов функции для определения города и получения данных о погоде
        completion()
    }
}
