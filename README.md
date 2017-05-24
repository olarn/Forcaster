# Forcaster

The api key to communicate with openweathermap.org
Create you own on https://home.openweathermap.org/users/sign_up 
    and replace it in OpenWeatherAPI.swift

fileprivate let apiKey = "<<YOUR API KEY>>"

API

Libraries :-

Alamofire :- https://github.com/Alamofire/Alamofire
SwiftyJSON :- https://github.com/SwiftyJSON/SwiftyJSON
Alamofire-SwiftyJSON :- https://github.com/SwiftyJSON/Alamofire-SwiftyJSON

API Docs :-
https://openweathermap.org/forecast16

JSON Example :-
http://samples.openweathermap.org/data/2.5/forecast/daily?q=Bangkok&appid=b1b15e88fa797225412429c1c50c122a1

=============
Requirements
=============

1. ทำให้หน้าแรกทำงานได้
2. ตอนกดปุ่ม "7 days" บน NavBar หน้าแรก ถ้ายังไม่มีผลลัพธ์การ search จะแสดงข้อมูลหน้าต่อไปไม่ได้
3. แสดงข้อมูล forcast  7 วันในหน้าที่ 2
4. run unit test "WeatherForcastTests.testWeatherForcastPresenterForBangkokShouldReturnBangkokForcasts()" ผ่าน
