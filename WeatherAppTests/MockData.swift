//
//  MockData.swift
//  WeatherAppTests
//
//  Created by Adityakumar Ramnuj on 16/10/23.
//

import Foundation
@testable import WeatherApp

let weatherData = """
{
    "coord": {
        "lon": 10.99,
        "lat": 44.34
    },
    "weather": [
        {
            "id": 804,
            "main": "Clouds",
            "description": "overcast clouds",
            "icon": "04d"
        }
    ],
    "base": "stations",
    "main": {
        "temp": 293.48,
        "feels_like": 293.11,
        "temp_min": 290.3,
        "temp_max": 294.31,
        "pressure": 1009,
        "humidity": 59,
        "sea_level": 1009,
        "grnd_level": 926
    },
    "visibility": 10000,
    "wind": {
        "speed": 1.33,
        "deg": 354,
        "gust": 2.6
    },
    "clouds": {
        "all": 99
    },
    "dt": 1697372615,
    "sys": {
        "type": 2,
        "id": 2004688,
        "country": "IT",
        "sunrise": 1697347809,
        "sunset": 1697387601
    },
    "timezone": 7200,
    "id": 3163858,
    "name": "Zocca",
    "cod": 200
}
""".data(using: .utf8)

let forecastData = """
{
    "cod": "200",
    "message": 0,
    "cnt": 40,
    "list": [
        {
            "dt": 1697436000,
            "main": {
                "temp": 284.39,
                "feels_like": 283.68,
                "temp_min": 282.19,
                "temp_max": 284.39,
                "pressure": 1019,
                "sea_level": 1019,
                "grnd_level": 932,
                "humidity": 81,
                "temp_kf": 2.2
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 2.23,
                "deg": 70,
                "gust": 6.51
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-16 06:00:00"
        },
        {
            "dt": 1697446800,
            "main": {
                "temp": 284.13,
                "feels_like": 283.27,
                "temp_min": 283.61,
                "temp_max": 284.13,
                "pressure": 1019,
                "sea_level": 1019,
                "grnd_level": 933,
                "humidity": 76,
                "temp_kf": 0.52
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 3.19,
                "deg": 74,
                "gust": 5.47
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-16 09:00:00"
        },
        {
            "dt": 1697457600,
            "main": {
                "temp": 284.58,
                "feels_like": 283.42,
                "temp_min": 284.58,
                "temp_max": 284.68,
                "pressure": 1018,
                "sea_level": 1018,
                "grnd_level": 932,
                "humidity": 63,
                "temp_kf": -0.1
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 3.27,
                "deg": 73,
                "gust": 4.71
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-16 12:00:00"
        },
        {
            "dt": 1697468400,
            "main": {
                "temp": 284.92,
                "feels_like": 283.54,
                "temp_min": 284.92,
                "temp_max": 284.92,
                "pressure": 1017,
                "sea_level": 1017,
                "grnd_level": 931,
                "humidity": 53,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 2.85,
                "deg": 64,
                "gust": 3.49
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-16 15:00:00"
        },
        {
            "dt": 1697479200,
            "main": {
                "temp": 281.61,
                "feels_like": 281.61,
                "temp_min": 281.61,
                "temp_max": 281.61,
                "pressure": 1018,
                "sea_level": 1018,
                "grnd_level": 931,
                "humidity": 70,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 0.98,
                "deg": 64,
                "gust": 2.28
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-16 18:00:00"
        },
        {
            "dt": 1697490000,
            "main": {
                "temp": 281.65,
                "feels_like": 281.65,
                "temp_min": 281.65,
                "temp_max": 281.65,
                "pressure": 1018,
                "sea_level": 1018,
                "grnd_level": 931,
                "humidity": 75,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 0.63,
                "deg": 27,
                "gust": 2
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-16 21:00:00"
        },
        {
            "dt": 1697500800,
            "main": {
                "temp": 282.15,
                "feels_like": 282.15,
                "temp_min": 282.15,
                "temp_max": 282.15,
                "pressure": 1017,
                "sea_level": 1017,
                "grnd_level": 931,
                "humidity": 73,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 1.28,
                "deg": 27,
                "gust": 2.32
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-17 00:00:00"
        },
        {
            "dt": 1697511600,
            "main": {
                "temp": 281.77,
                "feels_like": 281.77,
                "temp_min": 281.77,
                "temp_max": 281.77,
                "pressure": 1017,
                "sea_level": 1017,
                "grnd_level": 930,
                "humidity": 68,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 1.17,
                "deg": 356,
                "gust": 2.03
            },
            "visibility": 10000,
            "pop": 0.05,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-17 03:00:00"
        },
        {
            "dt": 1697522400,
            "main": {
                "temp": 281.2,
                "feels_like": 281.2,
                "temp_min": 281.2,
                "temp_max": 281.2,
                "pressure": 1017,
                "sea_level": 1017,
                "grnd_level": 930,
                "humidity": 67,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 1.05,
                "deg": 352,
                "gust": 1.63
            },
            "visibility": 10000,
            "pop": 0.27,
            "rain": {
                "3h": 0.12
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-17 06:00:00"
        },
        {
            "dt": 1697533200,
            "main": {
                "temp": 284.61,
                "feels_like": 283.3,
                "temp_min": 284.61,
                "temp_max": 284.61,
                "pressure": 1017,
                "sea_level": 1017,
                "grnd_level": 931,
                "humidity": 57,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 92
            },
            "wind": {
                "speed": 1.82,
                "deg": 27,
                "gust": 1.81
            },
            "visibility": 10000,
            "pop": 0.13,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-17 09:00:00"
        },
        {
            "dt": 1697544000,
            "main": {
                "temp": 287.28,
                "feels_like": 286.05,
                "temp_min": 287.28,
                "temp_max": 287.28,
                "pressure": 1016,
                "sea_level": 1016,
                "grnd_level": 931,
                "humidity": 50,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 95
            },
            "wind": {
                "speed": 2.57,
                "deg": 49,
                "gust": 2.08
            },
            "visibility": 10000,
            "pop": 0.09,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-17 12:00:00"
        },
        {
            "dt": 1697554800,
            "main": {
                "temp": 286.95,
                "feels_like": 285.77,
                "temp_min": 286.95,
                "temp_max": 286.95,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 930,
                "humidity": 53,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 91
            },
            "wind": {
                "speed": 2.21,
                "deg": 56,
                "gust": 1.88
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-17 15:00:00"
        },
        {
            "dt": 1697565600,
            "main": {
                "temp": 282.5,
                "feels_like": 282.5,
                "temp_min": 282.5,
                "temp_max": 282.5,
                "pressure": 1016,
                "sea_level": 1016,
                "grnd_level": 930,
                "humidity": 73,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 96
            },
            "wind": {
                "speed": 0.27,
                "deg": 171,
                "gust": 1.11
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-17 18:00:00"
        },
        {
            "dt": 1697576400,
            "main": {
                "temp": 281.41,
                "feels_like": 281.41,
                "temp_min": 281.41,
                "temp_max": 281.41,
                "pressure": 1017,
                "sea_level": 1017,
                "grnd_level": 930,
                "humidity": 79,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 1.03,
                "deg": 204,
                "gust": 1.21
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-17 21:00:00"
        },
        {
            "dt": 1697587200,
            "main": {
                "temp": 280.75,
                "feels_like": 280.75,
                "temp_min": 280.75,
                "temp_max": 280.75,
                "pressure": 1016,
                "sea_level": 1016,
                "grnd_level": 929,
                "humidity": 81,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 0.9,
                "deg": 215,
                "gust": 0.97
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-18 00:00:00"
        },
        {
            "dt": 1697598000,
            "main": {
                "temp": 280.31,
                "feels_like": 280.31,
                "temp_min": 280.31,
                "temp_max": 280.31,
                "pressure": 1016,
                "sea_level": 1016,
                "grnd_level": 929,
                "humidity": 79,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 0.56,
                "deg": 235,
                "gust": 0.73
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-18 03:00:00"
        },
        {
            "dt": 1697608800,
            "main": {
                "temp": 281.33,
                "feels_like": 281.33,
                "temp_min": 281.33,
                "temp_max": 281.33,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 929,
                "humidity": 72,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 0.21,
                "deg": 198,
                "gust": 0.48
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-18 06:00:00"
        },
        {
            "dt": 1697619600,
            "main": {
                "temp": 282.14,
                "feels_like": 282.14,
                "temp_min": 282.14,
                "temp_max": 282.14,
                "pressure": 1016,
                "sea_level": 1016,
                "grnd_level": 930,
                "humidity": 76,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 0.47,
                "deg": 55,
                "gust": 0.66
            },
            "visibility": 10000,
            "pop": 0.25,
            "rain": {
                "3h": 0.12
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-18 09:00:00"
        },
        {
            "dt": 1697630400,
            "main": {
                "temp": 282.01,
                "feels_like": 282.01,
                "temp_min": 282.01,
                "temp_max": 282.01,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 929,
                "humidity": 83,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 0.64,
                "deg": 79,
                "gust": 0.85
            },
            "visibility": 10000,
            "pop": 0.2,
            "rain": {
                "3h": 0.25
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-18 12:00:00"
        },
        {
            "dt": 1697641200,
            "main": {
                "temp": 281.99,
                "feels_like": 281.99,
                "temp_min": 281.99,
                "temp_max": 281.99,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 928,
                "humidity": 86,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 0.55,
                "deg": 38,
                "gust": 0.61
            },
            "visibility": 10000,
            "pop": 0.2,
            "rain": {
                "3h": 0.13
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-18 15:00:00"
        },
        {
            "dt": 1697652000,
            "main": {
                "temp": 281.79,
                "feels_like": 281.79,
                "temp_min": 281.79,
                "temp_max": 281.79,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 927,
                "humidity": 91,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 0.47,
                "deg": 339,
                "gust": 0.6
            },
            "visibility": 10000,
            "pop": 0.25,
            "rain": {
                "3h": 0.56
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-18 18:00:00"
        },
        {
            "dt": 1697662800,
            "main": {
                "temp": 281.97,
                "feels_like": 281.97,
                "temp_min": 281.97,
                "temp_max": 281.97,
                "pressure": 1013,
                "sea_level": 1013,
                "grnd_level": 927,
                "humidity": 92,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 0.8,
                "deg": 357,
                "gust": 1.09
            },
            "visibility": 10000,
            "pop": 0.58,
            "rain": {
                "3h": 0.59
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-18 21:00:00"
        },
        {
            "dt": 1697673600,
            "main": {
                "temp": 281.45,
                "feels_like": 281.45,
                "temp_min": 281.45,
                "temp_max": 281.45,
                "pressure": 1012,
                "sea_level": 1012,
                "grnd_level": 926,
                "humidity": 96,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 501,
                    "main": "Rain",
                    "description": "moderate rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 0.63,
                "deg": 349,
                "gust": 1.17
            },
            "visibility": 4793,
            "pop": 0.9,
            "rain": {
                "3h": 5.35
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-19 00:00:00"
        },
        {
            "dt": 1697684400,
            "main": {
                "temp": 281.55,
                "feels_like": 281.55,
                "temp_min": 281.55,
                "temp_max": 281.55,
                "pressure": 1011,
                "sea_level": 1011,
                "grnd_level": 924,
                "humidity": 97,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 502,
                    "main": "Rain",
                    "description": "heavy intensity rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 0.38,
                "deg": 51,
                "gust": 0.89
            },
            "visibility": 9846,
            "pop": 0.93,
            "rain": {
                "3h": 17.87
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-19 03:00:00"
        },
        {
            "dt": 1697695200,
            "main": {
                "temp": 281.59,
                "feels_like": 281.59,
                "temp_min": 281.59,
                "temp_max": 281.59,
                "pressure": 1010,
                "sea_level": 1010,
                "grnd_level": 924,
                "humidity": 97,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 0.61,
                "deg": 58,
                "gust": 0.76
            },
            "visibility": 7881,
            "pop": 0.99,
            "rain": {
                "3h": 1.98
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-19 06:00:00"
        },
        {
            "dt": 1697706000,
            "main": {
                "temp": 284.14,
                "feels_like": 283.7,
                "temp_min": 284.14,
                "temp_max": 284.14,
                "pressure": 1009,
                "sea_level": 1009,
                "grnd_level": 924,
                "humidity": 92,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 98
            },
            "wind": {
                "speed": 0.7,
                "deg": 64,
                "gust": 0.96
            },
            "visibility": 8564,
            "pop": 0.49,
            "rain": {
                "3h": 0.12
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-19 09:00:00"
        },
        {
            "dt": 1697716800,
            "main": {
                "temp": 286.21,
                "feels_like": 285.9,
                "temp_min": 286.21,
                "temp_max": 286.21,
                "pressure": 1007,
                "sea_level": 1007,
                "grnd_level": 923,
                "humidity": 89,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 99
            },
            "wind": {
                "speed": 0.57,
                "deg": 84,
                "gust": 1.96
            },
            "visibility": 10000,
            "pop": 0.53,
            "rain": {
                "3h": 0.3
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-19 12:00:00"
        },
        {
            "dt": 1697727600,
            "main": {
                "temp": 286.3,
                "feels_like": 285.99,
                "temp_min": 286.3,
                "temp_max": 286.3,
                "pressure": 1005,
                "sea_level": 1005,
                "grnd_level": 921,
                "humidity": 89,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 0.75,
                "deg": 38,
                "gust": 1.95
            },
            "visibility": 10000,
            "pop": 0.61,
            "rain": {
                "3h": 0.31
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-19 15:00:00"
        },
        {
            "dt": 1697738400,
            "main": {
                "temp": 283.96,
                "feels_like": 283.52,
                "temp_min": 283.96,
                "temp_max": 283.96,
                "pressure": 1005,
                "sea_level": 1005,
                "grnd_level": 920,
                "humidity": 93,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 99
            },
            "wind": {
                "speed": 0.48,
                "deg": 63,
                "gust": 1.19
            },
            "visibility": 10000,
            "pop": 0.41,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-19 18:00:00"
        },
        {
            "dt": 1697749200,
            "main": {
                "temp": 283.93,
                "feels_like": 283.54,
                "temp_min": 283.93,
                "temp_max": 283.93,
                "pressure": 1004,
                "sea_level": 1004,
                "grnd_level": 919,
                "humidity": 95,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 0.72,
                "deg": 129,
                "gust": 1.2
            },
            "visibility": 10000,
            "pop": 0.45,
            "rain": {
                "3h": 0.12
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-19 21:00:00"
        },
        {
            "dt": 1697760000,
            "main": {
                "temp": 283.53,
                "feels_like": 283.1,
                "temp_min": 283.53,
                "temp_max": 283.53,
                "pressure": 1003,
                "sea_level": 1003,
                "grnd_level": 918,
                "humidity": 95,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 0.31,
                "deg": 74,
                "gust": 0.79
            },
            "visibility": 10000,
            "pop": 0.37,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-20 00:00:00"
        },
        {
            "dt": 1697770800,
            "main": {
                "temp": 283.41,
                "feels_like": 283,
                "temp_min": 283.41,
                "temp_max": 283.41,
                "pressure": 1001,
                "sea_level": 1001,
                "grnd_level": 916,
                "humidity": 96,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 1.06,
                "deg": 129,
                "gust": 1.31
            },
            "visibility": 10000,
            "pop": 0.37,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-20 03:00:00"
        },
        {
            "dt": 1697781600,
            "main": {
                "temp": 284.97,
                "feels_like": 284.71,
                "temp_min": 284.97,
                "temp_max": 284.97,
                "pressure": 999,
                "sea_level": 999,
                "grnd_level": 914,
                "humidity": 96,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 1.37,
                "deg": 120,
                "gust": 2.42
            },
            "visibility": 10000,
            "pop": 0.37,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-20 06:00:00"
        },
        {
            "dt": 1697792400,
            "main": {
                "temp": 287.98,
                "feels_like": 287.87,
                "temp_min": 287.98,
                "temp_max": 287.98,
                "pressure": 996,
                "sea_level": 996,
                "grnd_level": 913,
                "humidity": 90,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 2.08,
                "deg": 98,
                "gust": 3.68
            },
            "visibility": 10000,
            "pop": 0.6,
            "rain": {
                "3h": 0.25
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-20 09:00:00"
        },
        {
            "dt": 1697803200,
            "main": {
                "temp": 289.16,
                "feels_like": 289.09,
                "temp_min": 289.16,
                "temp_max": 289.16,
                "pressure": 994,
                "sea_level": 994,
                "grnd_level": 911,
                "humidity": 87,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 2.31,
                "deg": 132,
                "gust": 7.93
            },
            "visibility": 10000,
            "pop": 0.92,
            "rain": {
                "3h": 1.55
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-20 12:00:00"
        },
        {
            "dt": 1697814000,
            "main": {
                "temp": 288.15,
                "feels_like": 288.08,
                "temp_min": 288.15,
                "temp_max": 288.15,
                "pressure": 991,
                "sea_level": 991,
                "grnd_level": 908,
                "humidity": 91,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 1.02,
                "deg": 179,
                "gust": 4.95
            },
            "visibility": 8628,
            "pop": 1,
            "rain": {
                "3h": 2.97
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-10-20 15:00:00"
        },
        {
            "dt": 1697824800,
            "main": {
                "temp": 286.77,
                "feels_like": 286.67,
                "temp_min": 286.77,
                "temp_max": 286.77,
                "pressure": 990,
                "sea_level": 990,
                "grnd_level": 907,
                "humidity": 95,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 501,
                    "main": "Rain",
                    "description": "moderate rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 2.34,
                "deg": 209,
                "gust": 6.04
            },
            "visibility": 10000,
            "pop": 1,
            "rain": {
                "3h": 7.76
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-20 18:00:00"
        },
        {
            "dt": 1697835600,
            "main": {
                "temp": 284.63,
                "feels_like": 284.21,
                "temp_min": 284.63,
                "temp_max": 284.63,
                "pressure": 991,
                "sea_level": 991,
                "grnd_level": 907,
                "humidity": 91,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 68
            },
            "wind": {
                "speed": 2.4,
                "deg": 207,
                "gust": 4.09
            },
            "visibility": 10000,
            "pop": 1,
            "rain": {
                "3h": 0.88
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-20 21:00:00"
        },
        {
            "dt": 1697846400,
            "main": {
                "temp": 284.02,
                "feels_like": 283.43,
                "temp_min": 284.02,
                "temp_max": 284.02,
                "pressure": 991,
                "sea_level": 991,
                "grnd_level": 907,
                "humidity": 87,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "clouds": {
                "all": 41
            },
            "wind": {
                "speed": 2.84,
                "deg": 189,
                "gust": 6.03
            },
            "visibility": 10000,
            "pop": 0.72,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-21 00:00:00"
        },
        {
            "dt": 1697857200,
            "main": {
                "temp": 284.34,
                "feels_like": 283.76,
                "temp_min": 284.34,
                "temp_max": 284.34,
                "pressure": 990,
                "sea_level": 990,
                "grnd_level": 906,
                "humidity": 86,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 96
            },
            "wind": {
                "speed": 4.37,
                "deg": 200,
                "gust": 9.21
            },
            "visibility": 10000,
            "pop": 0.69,
            "rain": {
                "3h": 1.34
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-10-21 03:00:00"
        }
    ],
    "city": {
        "id": 3163858,
        "name": "Zocca",
        "coord": {
            "lat": 44.34,
            "lon": 10.99
        },
        "country": "IT",
        "population": 4593,
        "timezone": 7200,
        "sunrise": 1697434284,
        "sunset": 1697473898
    }
}
""".data(using: .utf8)

