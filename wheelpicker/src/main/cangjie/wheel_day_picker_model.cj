/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package wheelpicker

import ohos.state_manage.*
import ohos.state_macro_manage.*

public class WheelDayPickerModel {
    var mDuration: Float64 = 30.0
    var mTextHeight: Float64 = 30.0
    var mSpace: Float64 = 8.0
    var mItemHeight: Float64 = this.mTextHeight + 2.0 * this.mSpace
    var mVisibleItem: Int64 = 9
    var mWheelHeight: Float64 = this.mItemHeight * Float64(this.mVisibleItem)
    var mCenterY: Float64 = this.mWheelHeight / 2.0
    var mItemTextSize: Float64 = 16.0
    var mItemTextColor: Color = Color(0X536D8A)
    var mTextMaxHeight: Float64 = 30.0
    var mSelectedItemTextColor: Color = Color(0XFAFAaa)
    var mIndicatorSize: Float64 = 2.0
    var mIndicatorColor: Color = Color.RED
    var mCurtainColor: Color = Color.WHITE
    var mHalfItemCount: Int64 = (this.mVisibleItem - 1) / 2
    var mFontFamily: String = ""
    var isCyslic: Bool = false
    var hasIndicator: Bool = true
    var hasAtmospheric: Bool = false
    var hasCurtain: Bool = true
    var mSelectedItemPosition: Int64 = 0
    var mAlign: HorizontalAlign = HorizontalAlign.Center
    var mSelectedData: String = ""
    var scroller: Scroller = Scroller()
    var scroller1: Scroller = Scroller()
    var mData: Array<Int64>
    var scrollBgColor: Color = Color.WHITE
    var mOnItemSelectedListener: ?OnItemSelectedListener = None
    var atmosphericColor: Array<(Color, Float64)> = []
    var year: Int64 = 1049
    var month: Int64 = 1

    public init() {
        let res: Int64 = monthDays(this.year, this.month)
        this.mData = Array<Int64>(res, { item => item + 1})
    }

    public func setData(mData: Array<String>): WheelDayPickerModel {
        throw Exception("You can not invoke public func setData in WheelDatePicker")
    }

    public func setYearAndMonth(year: Int64, month: Int64): WheelDayPickerModel {
        if(year <= 0) {
            this.year = 1949
        }
        if(month <= 0) {
            this.month = 1
        }
        let res: Int64 = monthDays(this.year, this.month)
        this.mData = Array<Int64>(res, { item => item + 1})
        return this
    }

    public func setScrollBgColor(scrollBgColor: Color): WheelDayPickerModel {
        this.scrollBgColor = scrollBgColor
        return this
    }

    public func setFirstSelectedItemPosition(FirstSelectPosition: Int64): WheelDayPickerModel {
        this.mSelectedItemPosition = FirstSelectPosition
        return this
    }

    public func getCurrentItemPosition(): Int64 {
        return this.mSelectedItemPosition
    }

    public func getCurrentItemData(): String {
        return this.mSelectedData
    }

    public func setTextHeight(mTextHeight: Float64): WheelDayPickerModel {
        this.mTextHeight = mTextHeight
        return this
    }

    public func getTextHeight(mTextHeight: Float64): Float64 {
        return this.mTextHeight
    }

    public func setVisibleItemCount(count: Int64): WheelDayPickerModel {
        this.mVisibleItem = count
        return this
    }

    public func getVisibleItemCount(): Int64 {
        return this.mVisibleItem
    }

    public func getItemHeight(): Float64 {
        return this.mItemHeight
    }

    public func setCyclic(isCyslic: Bool): WheelDayPickerModel {
        this.isCyslic = isCyslic
        return this
    }

    public func isCyslicShow(): Bool {
        return this.isCyslic
    }

    public func setSelectedItemTextColor(color: Color): WheelDayPickerModel {
        this.mSelectedItemTextColor = color
        return this
    }

    public func getSelectedItemTextColor(): Color {
        return this.mSelectedItemTextColor
    }

    public func setItemTextColor(color: Color): WheelDayPickerModel {
        this.mItemTextColor = color
        return this
    }

    public func getItemTextColor(): Color {
        return this.mItemTextColor
    }

    public func setItemTextSize(size: Float64): WheelDayPickerModel {
        this.mItemTextSize = size
        return this
    }

    public func getItemTextSize(): Float64 {
        return this.mItemTextSize
    }

    public func setItemSpace(space: Float64): WheelDayPickerModel {
        this.mSpace = space
        return this
    }

    public func getItemSpace(): Float64 {
        return this.mSpace
    }

    public func setIndicator(hasIndicator: Bool): WheelDayPickerModel {
        this.hasIndicator = hasIndicator
        return this
    }

    public func hasIndicatorDivide(): Bool {
        return this.hasIndicator
    }

    public func setIndicatorSize(size: Float64): WheelDayPickerModel {
        this.mIndicatorSize = size
        return this
    }

    public func getIndicatorSize(): Float64 {
        return this.mIndicatorSize
    }

    public func setIndicatorColor(color: Color): WheelDayPickerModel {
        this.mIndicatorColor = color
        return this
    }

    public func getIndicatorColor(): Color {
        return this.mIndicatorColor
    }

    public func setCurtainColor(color: Color): WheelDayPickerModel {
        this.mCurtainColor = color
        return this
    }

    public func getCurtainColor(): Color {
        return this.mCurtainColor
    }

    public func setAtmospheric(hasAtmospheric: Bool): WheelDayPickerModel {
        this.hasAtmospheric = hasAtmospheric
        return this
    }

    public func setAtmosphericColor(atmosphericColor: Array<(Color, Float64)>): WheelDayPickerModel {
        this.atmosphericColor = atmosphericColor
        return this
    }

    public func hasAtmosphericShow(): Bool {
        return this.hasAtmospheric
    }

    public func setItemAlign(align: HorizontalAlign): WheelDayPickerModel {
        this.mAlign = align
        return this
    }

    public func getItemAlign(): HorizontalAlign {
        return this.mAlign
    }

    public func setFontFamily(fontFamily: String): WheelDayPickerModel {
        this.mFontFamily = fontFamily
        return this
    }

    public func getFontFamily(): String {
        return this.mFontFamily
    }

    public func updateVisibleItemCount() {
        if (this.mVisibleItem < 2) {
            return
        }
        if (this.mVisibleItem % 2 == 0) {
            this.mVisibleItem += 1
        }

        this.mWheelHeight = Float64(this.mVisibleItem) * this.mItemHeight
        this.mCenterY = this.mWheelHeight / 2.0
    }

    public func scrollInit(scroller: Scroller) {
        if (this.isCyslic) {
            scroller.scrollTo(
                xOffset: 0.0,
                yOffset: this.mItemHeight * Float64(this.mSelectedItemPosition + this.mData.size - this.mHalfItemCount),
                duration: 0.0,
                curve: Curve.Ease
            )

        } else {
            scroller.scrollTo(
                xOffset: 0.0,
                yOffset: this.mItemHeight * Float64(this.mSelectedItemPosition),
                duration: 0.0,
                curve: Curve.Ease
            )
        }
    }

    public func setSelectedItemPosition(SelectPosition: Int64) {
        if (this.isCyslic) {
            this.scroller.scrollTo(
                xOffset: 0.0,
                yOffset: Float64(SelectPosition - this.mHalfItemCount + this.mData.size) * this.mItemHeight,
                duration: Float64(this.mDuration),
                curve: Curve.Ease
            )
        } else {
            this.scroller.scrollTo(
                xOffset: 0.0,
                yOffset: Float64(SelectPosition) * this.mItemHeight,
                duration: Float64(this.mDuration),
                curve: Curve.Ease
            )
        }
    }

    public func setOnItemSelectedListener(listener: ?OnItemSelectedListener): WheelDayPickerModel {
        this.mOnItemSelectedListener = listener
        return this
    }
}

func monthDays(year: Int64, month: Int64): Int64 {
    match (month) {
        case 1 | 3 | 5 | 7 | 8 | 10 | 12 => return 31
        case 2 => if (year % 4 == 0) { //闰年
            return 29
        } else {
            return 28
        }
        case 4 | 6 | 9 | 11 => return 30
        case _ => return -1
    }
}
