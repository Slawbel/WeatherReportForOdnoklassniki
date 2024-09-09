import UIKit

class CellForStartingScreen2: UICollectionViewCell {

    // UI Elements
    let cityName = UILabel()
    let temperature = UILabel()
    let tempFeelsLike = UILabel()
    let selectCityButton = UIButton()
    let weatherImage = UIImageView()
    let temperatureLabel = UILabel()
    let feelsLikeLabel = UILabel()
    let humidityLabel = UILabel()
    let humidityValue = UILabel()
    let windSpeedLabel = UILabel()
    let windSpeedValue = UILabel()
    let pressureLabel = UILabel()
    let pressureValue = UILabel()
    let cloudinessLabel = UILabel()
    let cloudinessValue = UILabel()
    let sunriseLabel = UILabel()
    let sunriseValue = UILabel()
    let sunsetLabel = UILabel()
    let sunsetValue = UILabel()
    let windDegreeLabel = UILabel()
    let windDegreeValue = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        // Add elements to contentView
        contentView.addSubview(cityName)
        contentView.addSubview(temperature)
        contentView.addSubview(tempFeelsLike)
        contentView.addSubview(selectCityButton)
        contentView.addSubview(weatherImage)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(feelsLikeLabel)
        contentView.addSubview(humidityLabel)
        contentView.addSubview(humidityValue)
        contentView.addSubview(windSpeedLabel)
        contentView.addSubview(windSpeedValue)
        contentView.addSubview(pressureLabel)
        contentView.addSubview(pressureValue)
        contentView.addSubview(cloudinessLabel)
        contentView.addSubview(cloudinessValue)
        contentView.addSubview(sunriseLabel)
        contentView.addSubview(sunriseValue)
        contentView.addSubview(sunsetLabel)
        contentView.addSubview(sunsetValue)
        contentView.addSubview(windDegreeLabel)
        contentView.addSubview(windDegreeValue)

        // Configure elements
        cityName.text = "City Name"
        temperatureLabel.text = "Temperature:"
        feelsLikeLabel.text = "Feels like:"
        humidityLabel.text = "Humidity:"
        humidityValue.text = "0%"
        windSpeedLabel.text = "Wind Speed:"
        windSpeedValue.text = "0 km/h"
        pressureLabel.text = "Pressure:"
        pressureValue.text = "0 hPa"
        cloudinessLabel.text = "Cloudiness:"
        cloudinessValue.text = "0%"
        sunriseLabel.text = "Sunrise:"
        sunriseValue.text = "00:00"
        sunsetLabel.text = "Sunset:"
        sunsetValue.text = "00:00"
        windDegreeLabel.text = "Wind Degree:"
        windDegreeValue.text = "0°"

        // Set fonts dynamically
        cityName.adjustsFontSizeToFitWidth = true
        temperature.adjustsFontSizeToFitWidth = true
        tempFeelsLike.adjustsFontSizeToFitWidth = true
        humidityValue.adjustsFontSizeToFitWidth = true
        windSpeedValue.adjustsFontSizeToFitWidth = true
        pressureValue.adjustsFontSizeToFitWidth = true
        cloudinessValue.adjustsFontSizeToFitWidth = true
        sunriseValue.adjustsFontSizeToFitWidth = true
        sunsetValue.adjustsFontSizeToFitWidth = true
        windDegreeValue.adjustsFontSizeToFitWidth = true

        // Enable Auto Layout for all elements
        cityName.translatesAutoresizingMaskIntoConstraints = false
        temperature.translatesAutoresizingMaskIntoConstraints = false
        tempFeelsLike.translatesAutoresizingMaskIntoConstraints = false
        selectCityButton.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        feelsLikeLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityValue.translatesAutoresizingMaskIntoConstraints = false
        windSpeedLabel.translatesAutoresizingMaskIntoConstraints = false
        windSpeedValue.translatesAutoresizingMaskIntoConstraints = false
        pressureLabel.translatesAutoresizingMaskIntoConstraints = false
        pressureValue.translatesAutoresizingMaskIntoConstraints = false
        cloudinessLabel.translatesAutoresizingMaskIntoConstraints = false
        cloudinessValue.translatesAutoresizingMaskIntoConstraints = false
        sunriseLabel.translatesAutoresizingMaskIntoConstraints = false
        sunriseValue.translatesAutoresizingMaskIntoConstraints = false
        sunsetLabel.translatesAutoresizingMaskIntoConstraints = false
        sunsetValue.translatesAutoresizingMaskIntoConstraints = false
        windDegreeLabel.translatesAutoresizingMaskIntoConstraints = false
        windDegreeValue.translatesAutoresizingMaskIntoConstraints = false
    }

    func setConfigurationsForCell2(cellHeight: CGFloat) {
        let horizontalPadding: CGFloat = 5
        let verticalPadding: CGFloat = 5 // Увеличенный отступ
        let heightForItem: CGFloat = cellHeight / 14
        let fontSize: CGFloat = heightForItem * 0.5

        // Установка шрифтов
        cityName.font = UIFont.systemFont(ofSize: fontSize * 1.2, weight: .bold)
        temperature.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        tempFeelsLike.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        temperatureLabel.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)
        feelsLikeLabel.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)
        humidityLabel.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)
        humidityValue.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)
        windSpeedLabel.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)
        windSpeedValue.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)
        pressureLabel.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)
        pressureValue.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)
        cloudinessLabel.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)
        cloudinessValue.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)
        sunriseLabel.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)
        sunriseValue.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)
        sunsetLabel.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)
        sunsetValue.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)
        windDegreeLabel.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)
        windDegreeValue.font = UIFont.systemFont(ofSize: fontSize * 0.8, weight: .regular)

        // Настройка выравнивания текста
        temperature.textAlignment = .right
        tempFeelsLike.textAlignment = .right
        humidityValue.textAlignment = .right
        windSpeedValue.textAlignment = .right
        pressureValue.textAlignment = .right
        cloudinessValue.textAlignment = .right
        sunriseValue.textAlignment = .right
        sunsetValue.textAlignment = .right
        windDegreeValue.textAlignment = .right

        // Настройка кнопки и изображения
        selectCityButton.backgroundColor = .red

        weatherImage.contentMode = .scaleAspectFit
        weatherImage.tintColor = .black
        
        // Активируем Auto Layout для всех элементов
        NSLayoutConstraint.activate([
            cityName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding),
            cityName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalPadding),
            cityName.heightAnchor.constraint(equalToConstant: heightForItem * 1.5),
            cityName.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),

            selectCityButton.leadingAnchor.constraint(equalTo: cityName.trailingAnchor, constant: horizontalPadding),
            selectCityButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalPadding + 5), // Увеличенный отступ
            selectCityButton.heightAnchor.constraint(equalToConstant: heightForItem),
            selectCityButton.widthAnchor.constraint(equalTo: selectCityButton.heightAnchor),
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

            humidityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding),
            humidityLabel.topAnchor.constraint(equalTo: feelsLikeLabel.bottomAnchor, constant: verticalPadding),
            humidityLabel.heightAnchor.constraint(equalToConstant: heightForItem),
            humidityLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),

            humidityValue.leadingAnchor.constraint(equalTo: humidityLabel.trailingAnchor, constant: horizontalPadding),
            humidityValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPadding),
            humidityValue.topAnchor.constraint(equalTo: feelsLikeLabel.bottomAnchor, constant: verticalPadding),
            humidityValue.heightAnchor.constraint(equalToConstant: heightForItem),
            humidityValue.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),

            windSpeedLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding),
            windSpeedLabel.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor, constant: verticalPadding),
            windSpeedLabel.heightAnchor.constraint(equalToConstant: heightForItem),
            windSpeedLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),

            windSpeedValue.leadingAnchor.constraint(equalTo: windSpeedLabel.trailingAnchor, constant: horizontalPadding),
            windSpeedValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPadding),
            windSpeedValue.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor, constant: verticalPadding),
            windSpeedValue.heightAnchor.constraint(equalToConstant: heightForItem),
            windSpeedValue.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),

            pressureLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding),
            pressureLabel.topAnchor.constraint(equalTo: windSpeedLabel.bottomAnchor, constant: verticalPadding),
            pressureLabel.heightAnchor.constraint(equalToConstant: heightForItem),
            pressureLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),

            pressureValue.leadingAnchor.constraint(equalTo: pressureLabel.trailingAnchor, constant: horizontalPadding),
            pressureValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPadding),
            pressureValue.topAnchor.constraint(equalTo: windSpeedLabel.bottomAnchor, constant: verticalPadding),
            pressureValue.heightAnchor.constraint(equalToConstant: heightForItem),
            pressureValue.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),

            cloudinessLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding),
            cloudinessLabel.topAnchor.constraint(equalTo: pressureLabel.bottomAnchor, constant: verticalPadding),
            cloudinessLabel.heightAnchor.constraint(equalToConstant: heightForItem),
            cloudinessLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),

            cloudinessValue.leadingAnchor.constraint(equalTo: cloudinessLabel.trailingAnchor, constant: horizontalPadding),
            cloudinessValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPadding),
            cloudinessValue.topAnchor.constraint(equalTo: pressureLabel.bottomAnchor, constant: verticalPadding),
            cloudinessValue.heightAnchor.constraint(equalToConstant: heightForItem),
            cloudinessValue.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),

            sunriseLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding),
            sunriseLabel.topAnchor.constraint(equalTo: cloudinessLabel.bottomAnchor, constant: verticalPadding),
            sunriseLabel.heightAnchor.constraint(equalToConstant: heightForItem),
            sunriseLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),

            sunriseValue.leadingAnchor.constraint(equalTo: sunriseLabel.trailingAnchor, constant: horizontalPadding),
            sunriseValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPadding),
            sunriseValue.topAnchor.constraint(equalTo: cloudinessLabel.bottomAnchor, constant: verticalPadding),
            sunriseValue.heightAnchor.constraint(equalToConstant: heightForItem),
            sunriseValue.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),

            sunsetLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding),
            sunsetLabel.topAnchor.constraint(equalTo: sunriseLabel.bottomAnchor, constant: verticalPadding),
            sunsetLabel.heightAnchor.constraint(equalToConstant: heightForItem),
            sunsetLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),

            sunsetValue.leadingAnchor.constraint(equalTo: sunsetLabel.trailingAnchor, constant: horizontalPadding),
            sunsetValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPadding),
            sunsetValue.topAnchor.constraint(equalTo: sunriseLabel.bottomAnchor, constant: verticalPadding),
            sunsetValue.heightAnchor.constraint(equalToConstant: heightForItem),
            sunsetValue.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),

            windDegreeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding),
            windDegreeLabel.topAnchor.constraint(equalTo: sunsetLabel.bottomAnchor, constant: verticalPadding),
            windDegreeLabel.heightAnchor.constraint(equalToConstant: heightForItem),
            windDegreeLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),

            windDegreeValue.leadingAnchor.constraint(equalTo: windDegreeLabel.trailingAnchor, constant: horizontalPadding),
            windDegreeValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPadding),
            windDegreeValue.topAnchor.constraint(equalTo: sunsetLabel.bottomAnchor, constant: verticalPadding),
            windDegreeValue.heightAnchor.constraint(equalToConstant: heightForItem),
            windDegreeValue.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),

            weatherImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            weatherImage.topAnchor.constraint(equalTo: windDegreeLabel.bottomAnchor, constant: verticalPadding),
            weatherImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalPadding),
            weatherImage.widthAnchor.constraint(equalToConstant: heightForItem * 1.5),
            weatherImage.heightAnchor.constraint(equalTo: weatherImage.widthAnchor)
        ])
        
        // Устанавливаем радиус углов для кнопки после активации всех ограничений
        selectCityButton.layoutIfNeeded()
        selectCityButton.layer.cornerRadius = selectCityButton.bounds.height / 2
        selectCityButton.clipsToBounds = true
    }
}
