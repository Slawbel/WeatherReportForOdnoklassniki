import UIKit

class CellForStartingScreen1: UICollectionViewCell {
    
    var cityName = UILabel()
    var temperature = UILabel()
    var tempFeelsLike = UILabel()
    var selectCityButton = UIButton()
    var weatherImage = UIImageView()
    var temperatureLabel = UILabel()
    var feelsLikeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add elements to contentView
        contentView.addSubview(cityName)
        contentView.addSubview(temperature)
        contentView.addSubview(tempFeelsLike)
        contentView.addSubview(selectCityButton)
        contentView.addSubview(weatherImage)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(feelsLikeLabel)
        
        // Configure label and button styles
        cityName.textAlignment = .left
        cityName.adjustsFontSizeToFitWidth = true
        cityName.minimumScaleFactor = 0.5
        cityName.numberOfLines = 1
        
        temperature.textAlignment = .right
        temperature.adjustsFontSizeToFitWidth = true
        temperature.minimumScaleFactor = 0.5
        temperature.numberOfLines = 1
        
        tempFeelsLike.textAlignment = .right
        tempFeelsLike.adjustsFontSizeToFitWidth = true
        tempFeelsLike.minimumScaleFactor = 0.5
        tempFeelsLike.numberOfLines = 1
        
        selectCityButton.backgroundColor = .red
        selectCityButton.setTitleColor(.white, for: .normal)
        
        weatherImage.contentMode = .scaleAspectFit
        weatherImage.tintColor = .black
        
        temperatureLabel.text = "Temperature:"
        feelsLikeLabel.text = "Feels like:"
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        feelsLikeLabel.translatesAutoresizingMaskIntoConstraints = false
        cityName.translatesAutoresizingMaskIntoConstraints = false
        temperature.translatesAutoresizingMaskIntoConstraints = false
        tempFeelsLike.translatesAutoresizingMaskIntoConstraints = false
        selectCityButton.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Update corner radius for the button
        selectCityButton.layer.cornerRadius = selectCityButton.bounds.height / 2
        selectCityButton.clipsToBounds = true
    }
    
    func setConfigurationsForCell1(cellHeight: CGFloat) {
        
        let horizontalPadding: CGFloat = 12
        let verticalPadding: CGFloat = 12
        let heightForItem: CGFloat = cellHeight / 5
        let fontSize: CGFloat = heightForItem * 0.4
        
        cityName.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        temperature.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        tempFeelsLike.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        selectCityButton.titleLabel?.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)
        temperatureLabel.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)
        feelsLikeLabel.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)
        
        NSLayoutConstraint.activate([
            cityName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding),
            cityName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalPadding),
            cityName.heightAnchor.constraint(equalToConstant: heightForItem),
            cityName.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),
            
            selectCityButton.leadingAnchor.constraint(equalTo: cityName.trailingAnchor, constant: horizontalPadding),
            selectCityButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalPadding),
            selectCityButton.heightAnchor.constraint(equalToConstant: heightForItem),
            selectCityButton.widthAnchor.constraint(equalTo: selectCityButton.heightAnchor), // Square button
            selectCityButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPadding),

            temperatureLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding),
            temperatureLabel.topAnchor.constraint(equalTo: cityName.bottomAnchor, constant: verticalPadding),
            temperatureLabel.heightAnchor.constraint(equalToConstant: heightForItem),
            temperatureLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),
            
            temperature.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: horizontalPadding),
            temperature.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPadding),
            temperature.topAnchor.constraint(equalTo: cityName.bottomAnchor, constant: verticalPadding),
            temperature.heightAnchor.constraint(equalToConstant: heightForItem),
            temperature.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),
            
            feelsLikeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding),
            feelsLikeLabel.topAnchor.constraint(equalTo: temperature.bottomAnchor, constant: verticalPadding),
            feelsLikeLabel.heightAnchor.constraint(equalToConstant: heightForItem),
            feelsLikeLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),
            
            tempFeelsLike.leadingAnchor.constraint(equalTo: feelsLikeLabel.trailingAnchor, constant: horizontalPadding),
            tempFeelsLike.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPadding),
            tempFeelsLike.topAnchor.constraint(equalTo: temperature.bottomAnchor, constant: verticalPadding),
            tempFeelsLike.heightAnchor.constraint(equalToConstant: heightForItem),
            tempFeelsLike.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),
            
            weatherImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding),
            weatherImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPadding),
            weatherImage.topAnchor.constraint(equalTo: feelsLikeLabel.bottomAnchor, constant: verticalPadding),
            weatherImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalPadding),
            weatherImage.heightAnchor.constraint(equalToConstant: cellHeight * 0.6)
        ])
        
        // Устанавливаем радиус углов для кнопки после активации всех ограничений
        selectCityButton.layoutIfNeeded()
        selectCityButton.layer.cornerRadius = selectCityButton.bounds.height / 2
        selectCityButton.clipsToBounds = true
    }
}
