/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package wheelpicker

import ohos.state_manage.*
import ohos.state_macro_manage.*

public class WheelMonthPickerModel {
    var mDuration: Float64 = 30.0
    var SelectPosition0: Int64 = 0
    var computeEnd: Bool = false
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
    var isCyslic: Bool = true
    var hasIndicator: Bool = true
    var hasAtmospheric: Bool = true
    var hasCurtain: Bool = true
    var mFirstSelectPosition: Int64 = 0
    var mSelectedItemPosition: Int64 = 0
    var mAlign: HorizontalAlign = HorizontalAlign.Center
    var mSelectedData: String = ""
    var mData: Array<Int64> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    var scroller: Scroller = Scroller()
    var scroller1: Scroller = Scroller()
    var scrollBgColor: Color = Color.WHITE
    var mOnItemSelectedListener: ?OnItemSelectedListener = None

    public init() {}

    public func setData(mData: Array<String>): WheelMonthPickerModel {
        throw Exception("You can not invoke public func setData in WheelDatePicker")
    }

    public func setScrollBgColor(scrollBgColor: Color): WheelMonthPickerModel {
        this.scrollBgColor = scrollBgColor
        return this
    }

    public func setFirstSelectedItemPosition(FirstSelectPosition: Int64): WheelMonthPickerModel {
        this.mFirstSelectPosition = FirstSelectPosition
        this.SelectPosition0 = FirstSelectPosition
        return this
    }

    public func getSelectedItemPosition(): Int64 {
        return this.mFirstSelectPosition
    }

    public func getCurrentItemPosition(): Int64 {
        return this.mSelectedItemPosition
    }

    public func getCurrentItemData(): String {
        return this.mSelectedData
    }

    public func setTextHeight(mTextHeight: Float64): WheelMonthPickerModel {
        this.mTextHeight = mTextHeight
        return this
    }

    public func getTextHeight(mTextHeight: Float64): Float64 {
        return this.mTextHeight
    }

    public func setVisibleItemCount(count: Int64): WheelMonthPickerModel {
        this.mVisibleItem = count
        return this
    }

    public func getVisibleItemCount(): Int64 {
        return this.mVisibleItem
    }

    public func getItemHeight(): Float64 {
        return this.mItemHeight
    }

    public func setCyclic(isCyslic: Bool): WheelMonthPickerModel {
        this.isCyslic = isCyslic
        return this
    }

    public func isCyslicShow(): Bool {
        return this.isCyslic
    }

    public func setSelectedItemTextColor(color: Color): WheelMonthPickerModel {
        this.mSelectedItemTextColor = color
        return this
    }

    public func getSelectedItemTextColor(): Color {
        return this.mSelectedItemTextColor
    }

    public func setItemTextColor(color: Color): WheelMonthPickerModel {
        this.mItemTextColor = color
        return this
    }

    public func getItemTextColor(): Color {
        return this.mItemTextColor
    }

    public func setItemTextSize(size: Float64): WheelMonthPickerModel {
        this.mItemTextSize = size
        return this
    }

    public func getItemTextSize(): Float64 {
        return this.mItemTextSize
    }

    public func setItemSpace(space: Float64): WheelMonthPickerModel {
        this.mSpace = space
        return this
    }

    public func getItemSpace(): Float64 {
        return this.mSpace
    }

    public func setIndicator(hasIndicator: Bool): WheelMonthPickerModel {
        this.hasIndicator = hasIndicator
        return this
    }

    public func hasIndicatorDivide(): Bool {
        return this.hasIndicator
    }

    public func setIndicatorSize(size: Float64): WheelMonthPickerModel {
        this.mIndicatorSize = size
        return this
    }

    public func getIndicatorSize(): Float64 {
        return this.mIndicatorSize
    }

    public func setIndicatorColor(color: Color): WheelMonthPickerModel {
        this.mIndicatorColor = color
        return this
    }

    public func getIndicatorColor(): Color {
        return this.mIndicatorColor
    }

    public func setCurtain(hasCurtain: Bool): WheelMonthPickerModel {
        this.hasCurtain = hasCurtain
        return this
    }

    public func hasCurtainShow(): Bool {
        return this.hasCurtain
    }

    public func setCurtainColor(color: Color): WheelMonthPickerModel {
        this.mCurtainColor = color
        return this
    }

    public func getCurtainColor(): Color {
        return this.mCurtainColor
    }

    public func setAtmospheric(hasAtmospheric: Bool): WheelMonthPickerModel {
        this.hasAtmospheric = hasAtmospheric
        return this
    }

    public func hasAtmosphericShow(): Bool {
        return this.hasAtmospheric
    }

    public func setItemAlign(align: HorizontalAlign): WheelMonthPickerModel {
        this.mAlign = align
        return this
    }

    public func getItemAlign(): HorizontalAlign {
        return this.mAlign
    }

    public func setFontFamily(fontFamily: String): WheelMonthPickerModel {
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
        if (!this.computeEnd && this.isCyslic) {
            scroller.scrollTo(
                xOffset: 0.0,
                yOffset: this.mItemHeight * Float64(this.mFirstSelectPosition + this.mData.size - this.mHalfItemCount),
                duration: 0.0,
                curve: Curve.Ease
            )
            this.mSelectedItemPosition = this.mFirstSelectPosition
            this.computeEnd = true
        } else if (!this.computeEnd) {
            scroller.scrollTo(
                xOffset: 0.0,
                yOffset: this.mItemHeight * Float64(this.mFirstSelectPosition),
                duration: 1.0,
                curve: Curve.Ease
            )
            this.mSelectedItemPosition = this.mFirstSelectPosition
            this.computeEnd = true
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

    public func setOnItemSelectedListener(listener: ?OnItemSelectedListener): WheelMonthPickerModel {
        this.mOnItemSelectedListener = listener;
        return this
    }
}
