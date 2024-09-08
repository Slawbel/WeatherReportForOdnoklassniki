import UIKit

class CellForStartingScreen0: UICollectionViewCell {
    
    var cityName = UILabel()
    var temperature = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cityName.text = "Find city"
        temperature.text = ""
        
        contentView.addSubview(cityName)
        contentView.addSubview(temperature)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConfigurationsForCell0(cellHeight: CGFloat) {
        cityName.translatesAutoresizingMaskIntoConstraints = false
        temperature.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalPaddingForCity = contentView.frame.width / 20
        NSLayoutConstraint.activate([
            cityName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPaddingForCity),
            cityName.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.frame.width * 0.75 - horizontalPaddingForCity)
        ])
        cityName.textAlignment = .left
        
        NSLayoutConstraint.activate([
            temperature.leadingAnchor.constraint(equalTo: cityName.trailingAnchor, constant: horizontalPaddingForCity),
            temperature.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPaddingForCity)
        ])
        temperature.textAlignment = .right
        
        // Динамически изменяем размер шрифта в зависимости от высоты ячейки
        let fontSize = cellHeight / 4
        cityName.font = UIFont.systemFont(ofSize: fontSize)
        temperature.font = UIFont.systemFont(ofSize: fontSize)
    }

}
