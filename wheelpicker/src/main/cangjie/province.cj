/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package wheelpicker

public class Province {
    var provinceName: String
    var cityAndArea: ArrayList<CityAndArea>

    public init(provinceName: String, cityAndArea: ArrayList<CityAndArea>) {
        this.provinceName = provinceName
        this.cityAndArea = cityAndArea
    }

    public func getProvinceName(): String {
        return this.provinceName
    }

    public func getCityAndArea(): ArrayList<CityAndArea> {
        return this.cityAndArea
    }
}

public class CityAndArea {
    var cityName: String
    var area: Array<String>

    public init(cityName: String, area: Array<String>) {
        this.cityName = cityName
        this.area = area
    }

    public func getCityName(): String {
        return this.cityName
    }

    public func getArea(): Array<String> {
        return this.area
    }

}

public class ProvinceJsonObj {
    var name: String
    var city: Array<CityObj>
    public init(name: String, city: Array<CityObj>) {
        this.name = name
        this.city = city
    }
    public func getName(): String {
        return name
    }
    public func getCity(): Array<CityObj> {
        return city
    }
}

public class CityObj {
    var name: String
    var area: Array<String>
    public init(name: String, area: Array<String>) {
        this.name = name
        this.area = area
    }

    public func getName(): String {
        return this.name
    }

    public func getArea(): Array<String> {
        return this.area
    }
}

public func initializeProvinceOnStartup(): ArrayList<Province> {
    var PickerArray: ArrayList<Province> = ArrayList<Province>()
    for (item in provinceJson) {
        var cityAndAreaArray: ArrayList<CityAndArea> = ArrayList<CityAndArea>()
        for (cityParam in item.getCity()) {
            cityAndAreaArray.add(CityAndArea(cityParam.getName(), cityParam.getArea()))
        }
        PickerArray.add(Province(item.getName(), cityAndAreaArray))
    }

    return PickerArray
}

