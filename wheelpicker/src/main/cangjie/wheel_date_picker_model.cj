/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package wheelpicker

import ohos.state_manage.*
import ohos.state_macro_manage.*

@Observed
public class WheelDatePickerModel {
    @Publish var mTextHeight: Float64 = 30.0
    @Publish var mSpace: Float64 = 8.0
    @Publish var mItemHeight: Float64 = 0.0
    @Publish var mVisibleItem: Int64 = 7
    @Publish var mWheelHeight: Float64 = 0.0
    @Publish var mCenterY: Float64 = 0.0
    @Publish var mItemTextSize: Float64 = 16.0
    @Publish var mItemTextColor: Color = Color(0X536D8A)
    @Publish var mSelectedItemTextColor: Color = Color(0XFAFAaa)
    @Publish var mIndicatorSize: Float64 = 2.0
    @Publish var mIndicatorColor: Color = Color.RED
    @Publish var mCurtainColor: Color = Color.WHITE
    @Publish var mHalfItemCount: Int64 = 0
    @Publish var mFontFamily: String = ""
    @Publish var isCyslic: Bool = false
    var hasIndicator: Bool = true
    var hasAtmospheric: Bool = false
    var hasCurtain: Bool = true
    @Publish var mFirstSelectYearPosition: Int64 = 0
    @Publish var mFirstSelectMonthPosition: Int64 = 0
    @Publish var mFirstSelectDayPosition: Int64 = 0
    @Publish var mAlignDay: HorizontalAlign = HorizontalAlign.Center
    @Publish var mAlignMonth: HorizontalAlign = HorizontalAlign.Center
    @Publish var mAlignYear: HorizontalAlign = HorizontalAlign.Center
    var mData: Array<Int64> = []
    @Publish var scrollBgColor: Color = Color.WHITE

    @Publish var yearRangeStart: Int64 = 1972
    @Publish var yearRangeEnd: Int64 = 2022
    @Publish var solarLatestYearIndex: Int64 = 0
    @Publish var solarLatestMonthIndex: Int64 = 0
    @Publish var solarLatestDayIndex: Int64 = 0
    @Publish var mDate: String = ""
    var atmosphericColor: Array<(Color, Float64)> = []

    public func setData(mData: Array<String>): WheelDatePickerModel {
        Hilog.info(0,"setData","setData mData:${mData.size}")
        return this
    }

    public func setScrollBgColor(scrollBgColor: Color): WheelDatePickerModel {
        this.scrollBgColor = scrollBgColor
        return this
    }

    public func setTextHeight(mTextHeight: Float64): WheelDatePickerModel {
        if(mTextHeight > 30.0) {
            this.mTextHeight = 30.0
        } else {
            this.mTextHeight = mTextHeight
        }

        return this
    }

    public func setVisibleItemCount(count: Int64): WheelDatePickerModel {
        if(count < 7) {
            this.mVisibleItem = 7
            return this
        }
        let size: Int64 = (this.yearRangeEnd - this.yearRangeStart) / 2
        if(count > size) {
            this.mVisibleItem = size
        } else {
            this.mVisibleItem = count
        }

        return this
    }

    public func setCyclic(isCyslic: Bool): WheelDatePickerModel {
        this.isCyslic = isCyslic
        return this
    }

    public func isCyslicShow(): Bool {
        return this.isCyslic
    }

    public func setSelectedItemTextColor(color: Color): WheelDatePickerModel {
        this.mSelectedItemTextColor = color
        return this
    }

    public func setItemTextColor(color: Color): WheelDatePickerModel {
        this.mItemTextColor = color
        return this
    }

    public func setItemTextSize(size: Float64): WheelDatePickerModel {
        this.mItemTextSize = size
        return this
    }

    public func setItemSpace(space: Float64): WheelDatePickerModel {
        if(space > this.mTextHeight) {
            this.mSpace = this.mTextHeight
        } else {
            this.mSpace = space
        }
        return this
    }

    public func setIndicator(hasIndicator: Bool): WheelDatePickerModel {
        this.hasIndicator = hasIndicator
        return this
    }

    public func hasIndicatorDivide(): Bool {
        return this.hasIndicator
    }

    public func setIndicatorSize(size: Float64): WheelDatePickerModel {
        this.mIndicatorSize = size
        return this
    }

    public func setIndicatorColor(color: Color): WheelDatePickerModel {
        this.mIndicatorColor = color
        return this
    }

    public func setCurtainColor(color: Color): WheelDatePickerModel {
        this.mCurtainColor = color
        return this
    }

    public func setAtmospheric(hasAtmospheric1: Bool): WheelDatePickerModel {
        this.hasAtmospheric = hasAtmospheric1
        return this
    }

    public func setAtmosphericColor(atmosphericColor1: Array<(Color, Float64)>): WheelDatePickerModel {
        this.atmosphericColor = atmosphericColor1
        return this
    }

    public func hasAtmosphericShow(): Bool {
        return this.hasAtmospheric
    }

    public func setFontFamily(fontFamily1: String): WheelDatePickerModel {
        this.mFontFamily = fontFamily1
        return this
    }

    public func setItemAlignYear(align1: HorizontalAlign): WheelDatePickerModel {
        this.mAlignYear = align1
        return this
    }

    public func setItemAlignMonth(align1: HorizontalAlign): WheelDatePickerModel {
        this.mAlignMonth = align1
        return this
    }

    public func setItemAlignDay(align1: HorizontalAlign): WheelDatePickerModel {
        this.mAlignDay = align1
        return this
    }

    public func setYearStart(yearStart1: Int64): WheelDatePickerModel {
        if(yearStart1 > this.yearRangeEnd) {
            this.yearRangeStart = this.yearRangeEnd - 1
        } else {
            this.yearRangeStart = yearStart1
        }
        this.yearRangeStart = yearStart1
        return this
    }

    public func setYearEnd(yearEnd1: Int64): WheelDatePickerModel {
        if(yearEnd1 <= this.yearRangeStart) {
            this.yearRangeEnd = this.yearRangeStart + 1
        } else {
            this.yearRangeEnd = yearEnd1 + 1
        }
        return this
    }

    public func setSelectedYear(mFirstSelectYearPosition1: Int64): WheelDatePickerModel {
        if(mFirstSelectYearPosition1 < 0) {
            this.mFirstSelectYearPosition = 0
        } else if(mFirstSelectYearPosition1 > (this.yearRangeEnd - this.yearRangeStart)) {
            this.mFirstSelectYearPosition = (this.yearRangeEnd - this.yearRangeStart)
        } else {
            this.mFirstSelectYearPosition = mFirstSelectYearPosition1
        }
        return this
    }

    public func setSelectedMonth(mFirstSelectMonthPosition1: Int64): WheelDatePickerModel {
        if(mFirstSelectMonthPosition1 < 0) {
            this.mFirstSelectMonthPosition = 0
        } else if(mFirstSelectMonthPosition1 >= 11) {
            this.mFirstSelectMonthPosition = 11
        } else {
            this.mFirstSelectMonthPosition = mFirstSelectMonthPosition1
        }
        return this
    }

    public func setSelectedDay(mFirstSelectDayPosition1: Int64): WheelDatePickerModel {
        let yearRange1: Array<Int64> = Array<Int64>((this.yearRangeEnd - yearRangeStart), {i => yearRangeStart + i})
        let monthRange1: Array<Int64> = Array<Int64>(12, {i => 1 + i})
        let day1: Int64 = monthDays(yearRange1[this.mFirstSelectYearPosition], monthRange1[this.mFirstSelectMonthPosition])
        if(mFirstSelectDayPosition1 < 0) {
            this.mFirstSelectDayPosition = 0
        } else if(mFirstSelectDayPosition >= day1) {
            this.mFirstSelectDayPosition = day1 - 1
        } else {
            this.mFirstSelectDayPosition = mFirstSelectDayPosition1
        }
        return this
    }

    public func getSelectedItemTextColor(): Color {
        return this.mSelectedItemTextColor
    }
    public func getItemHeight(): Float64 {
        return this.mItemHeight
    }
    public func getVisibleItemCount(): Int64 {
        return this.mVisibleItem
    }

    public func getIndicatorColor(): Color {
        return this.mIndicatorColor
    }

    public func getTextHeight(mTextHeight1: Float64): Float64 {
        Hilog.info(0,"WheelDatePickerModel getTextHeight","getTextHeight mTextHeight:${mTextHeight1}")
        return this.mTextHeight
    }
    public func getItemTextColor(): Color {
        return this.mItemTextColor
    }

    public func getItemTextSize(): Float64 {
        return this.mItemTextSize
    }
    public func getItemSpace(): Float64 {
        return this.mSpace
    }

    public func getItemAlignYear(): HorizontalAlign {
        return this.mAlignYear
    }

    public func getItemAlignMonth(): HorizontalAlign {
        return this.mAlignMonth
    }

    public func getIndicatorSize(): Float64 {
        return this.mIndicatorSize
    }

    public func getItemAlignDay(): HorizontalAlign {
        return this.mAlignDay
    }

    public func getYearStart(): Int64 {
        return this.yearRangeStart
    }

    public func getYearEnd(): Int64 {
        return this.yearRangeEnd
    }

    public func getSelectedYear(): Int64 {
        return this.mFirstSelectYearPosition
    }

    public func getCurrentYear(): Int64 {
        return this.solarLatestYearIndex
    }

    public func getCurtainColor(): Color {
        return this.mCurtainColor
    }

    public func getFontFamily(): String {
        return this.mFontFamily
    }

    public func getSelectedMonth(): Int64 {
        return this.mFirstSelectMonthPosition
    }

    public func getCurrentMonth(): Int64 {
        return this.solarLatestMonthIndex
    }

    public func getSelectedDay(): Int64 {
        return this.mFirstSelectDayPosition
    }

    public func getCurrentDay(): Int64 {
        return this.solarLatestDayIndex
    }

    public func getYear(): Int64 {
        return this.getSelectedYear() + this.yearRangeStart + 1
    }

    public func getMonth(): Int64 {
        return this.getSelectedMonth() + 1
    }

    public func getCurrentDate(): String {
        return this.mDate
    }

    public func updateVisibleItemCount(): Unit {
        this.solarLatestYearIndex = this.mFirstSelectYearPosition
        this.solarLatestMonthIndex = this.mFirstSelectMonthPosition
        this.solarLatestDayIndex = this.mFirstSelectDayPosition
        if (this.mVisibleItem < 2) {
            return
        }

        if (this.mVisibleItem % 2 == 0) {
            this.mVisibleItem += 1
        }
        this.mItemHeight = this.mTextHeight + 2.0 * this.mSpace
        this.mWheelHeight = Float64(this.mVisibleItem) * this.mItemHeight
        this.mCenterY = this.mWheelHeight / 2.0
        this.mHalfItemCount = (this.mVisibleItem - 1) / 2
        var mDate: String = "${this.yearRangeStart + this.mFirstSelectYearPosition + this.mHalfItemCount}" + "-" +
        "${this.mFirstSelectMonthPosition + this.mHalfItemCount + 1}" + "-" +
        "${this.mFirstSelectDayPosition + this.mHalfItemCount + 1}"
    }

}
