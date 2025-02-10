/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package wheelpicker

let monthJson: Array<String> = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]

func monthDays(year: Int64, month: String): Int64 {
    match (month) {
        case "1" | "3" | "5" | "7" | "8" | "10" | "12" => return 31
        case "2" => return if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) { 29 } else { 28 }
        case "4" | "6" | "9" | "11" => return 30
        case _ => return -1
    }
    return -1
}

public class MonthAndDay {
    var month: String
    var days: ArrayList<String>
   public  init(month: String, days: ArrayList<String>) {
        this.month = month
        this.days = days
    }
}
//阳历
public class SolarCalendar {
    var index: Int64
    var year: Int64
    var monthAndDay: ArrayList<MonthAndDay>
    public init(index: Int64, year: Int64, month: ArrayList<MonthAndDay>) {
        this.index = index
        this.year = year
        this.monthAndDay = month
    }
    public func getIndex(): Int64 {
        return this.index
    }
    public func getYear(): Int64 {
        return this.year
    }
    public func getMonthAndDay(): ArrayList<MonthAndDay> {
        return this.monthAndDay
    }
}
//中国年范围
class ChinaYearRange {
    var startYear: Int64
    var endYear: Int64

    init(startYear: Int64, endYear: Int64) {
        if(startYear >= endYear) {
            this.startYear = 1972
            this.endYear = 2022
            Hilog.error(0,"WheelPicker4cj","Please enter the correct time range")
        } else {
            this.startYear = startYear
            this.endYear = endYear
        }

    }
}

public func initializeSolarCalendar(rangeStart: Int64, rangeEnd: Int64): ArrayList<SolarCalendar> {
    var YearsDataArray: ArrayList<SolarCalendar> = ArrayList<SolarCalendar>()
    let chinaYearRange: ChinaYearRange = ChinaYearRange(rangeStart, rangeEnd)
    var yearIndex: Int64 = chinaYearRange.startYear
    if (chinaYearRange.startYear > chinaYearRange.endYear) {
        Hilog.error(0x0000, "wheelPicker4cj", "Time range error")
    } else {
        for (index in 0..(rangeEnd-rangeStart)) {
            if (yearIndex < chinaYearRange.endYear) {
                let MonthAndDayArray: ArrayList<MonthAndDay> = ArrayList<MonthAndDay>()
                for (monthItem in monthJson) {
                    let days: ArrayList<Int64> = ArrayList<Int64>()
                    for (index in 0..monthDays(yearIndex, monthItem)) {
                        days.append(index)
                    }
                    let formatDays: ArrayList<String> = ArrayList<String>()
                    for (dayItem in days) {
                        if ((dayItem + 1) < 10) {
                            formatDays.append("0${(dayItem + 1)}")
                        } else {
                            formatDays.append((dayItem + 1).toString())
                        }
                    }
                    var newMonthItem = ""
                    if (Int64.parse(monthItem) < 10) {
                        newMonthItem = "0" + monthItem
                    }
                    MonthAndDayArray.append(MonthAndDay(monthItem, formatDays))
                }
                YearsDataArray.append(SolarCalendar(index, yearIndex, MonthAndDayArray));
                yearIndex = yearIndex + 1
            }
        }
    }
    return YearsDataArray;
}
