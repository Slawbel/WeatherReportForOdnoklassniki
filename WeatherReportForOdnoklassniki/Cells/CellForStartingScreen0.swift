import UIKit

class CellForStartingScreen0: UICollectionViewCell {
    
    var cityName = UILabel()
    var temperature = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Добавляем лейблы в contentView
        contentView.addSubview(cityName)
        contentView.addSubview(temperature)
        
        // Настраиваем текстовое выравнивание
        cityName.textAlignment = .left
        temperature.textAlignment = .right
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConfigurationsForCell0(cellHeight: CGFloat) {
        cityName.translatesAutoresizingMaskIntoConstraints = false
        temperature.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalPadding: CGFloat = 10 // Установите отступ между лейблами и краем ячейки
        
        NSLayoutConstraint.activate([
            // Настройки для cityName
            cityName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding),
            cityName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: horizontalPadding),
            cityName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -horizontalPadding),
            cityName.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75) // 3/4 ширины
        ])
        
        NSLayoutConstraint.activate([
            // Настройки для temperature
            temperature.leadingAnchor.constraint(equalTo: cityName.trailingAnchor, constant: horizontalPadding),
            temperature.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPadding),
            temperature.topAnchor.constraint(equalTo: contentView.topAnchor, constant: horizontalPadding),
            temperature.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -horizontalPadding),
            temperature.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25) // 1/4 ширины
        ])
        
        // Динамически изменяем размер шрифта в зависимости от высоты ячейки
        let fontSize = cellHeight / 4
        cityName.font = UIFont.systemFont(ofSize: fontSize)
        temperature.font = UIFont.systemFont(ofSize: fontSize)
    }

    func updateWeatherData(completion: @escaping () -> Void) {
        completion()
    }
}
