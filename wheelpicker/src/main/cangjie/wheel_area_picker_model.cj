/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package wheelpicker

import ohos.state_manage.*
import ohos.state_macro_manage.*

@Observed
public class WheelAreaPickerModel {
    var computeEnd: Bool = false
    @Publish
    var mTextHeight: Float64 = 30.0
    @Publish
    var mSpace: Float64 = 8.0
    @Publish
    var mItemHeight: Float64 = 0.0
    @Publish
    var mVisibleItem: Int64 = 9
    @Publish
    var mWheelHeight: Float64 = 0.0
    @Publish
    var mItemTextSize: Int64 = 16
    @Publish
    var mItemTextColor: Color = Color(0x536D8A)
    @Publish
    var mTextMaxHeight: Int64 = 30
    @Publish
    var mSelectedItemTextColor: Color = Color(0x00ff0000)
    @Publish
    var mIndicatorSize: Int64 = 2
    @Publish
    var mIndicatorColor: Color = Color.RED
    @Publish
    var mCurtainColor: Color = Color.WHITE
    @Publish
    var mHalfItemCount: Int64 = 0
    @Publish
    var mFontFamily: String = ""
    @Publish
    var hasIndicator: Bool = true
    @Publish
    var hasAtmospheric: Bool = false
    @Publish
    var hasCurtain: Bool = true
    @Publish
    var mFirstSelectPosition: Int64 = 0
    @Publish
    var mAlign: HorizontalAlign = HorizontalAlign.Center
    @Publish
    var mHideArea = false
    @Publish
    var mProvinceName: String = ""
    @Publish
    var mCityName: String = ""
    @Publish
    var mAreaName: String = ""
    @Publish
    var scrollBgColor: Color = Color.WHITE

    @Publish var solarLatestProvinceIndex: Int64 = 0
    @Publish var solarLatestCityAndAreaIndex: Int64 = 0
    @Publish var solarLatestAreaIndex: Int64 = 0
    @Publish var atmosphericColor: Array<(Color, Float64)> = []

    var mOnAreaSelectedListener: ?OnAreaSelectedListener = None

    public func hideArea(): Unit {
        this.mHideArea = true
    }

    public func setData(mData: Array<String>): WheelAreaPickerModel {
        throw Exception("You can not invoke setData in WheelAreaPicker")
    }

    public func setScrollBgColor(scrollBgColor: Color): WheelAreaPickerModel {
        this.scrollBgColor = scrollBgColor
        return this
    }

    public func getProvince(): String {
        return this.mProvinceName
    }

    public func getCity(): String {
        return this.mCityName
    }

    public func getArea(): String {
        return this.mAreaName
    }

    public func setSelectedItemPosition(FirstSelectPosition: Int64): WheelAreaPickerModel {
        this.mFirstSelectPosition = FirstSelectPosition
        return this
    }

    public func getSelectedItemPosition(): Int64 {
        return this.mFirstSelectPosition
    }

    public func setTextHeight(mTextHeight: Float64): WheelAreaPickerModel {
        this.mTextHeight = mTextHeight
        return this
    }

    public func getTextHeight(): Float64 {
        return this.mTextHeight
    }

    public func setVisibleItemCount(count: Int64): WheelAreaPickerModel {
        this.mVisibleItem = count
        return this
    }

    public func getVisibleItemCount(): Int64 {
        return this.mVisibleItem
    }

    public func getItemHeight(): Float64 {
        return this.mItemHeight
    }

    public func setSelectedItemTextColor(color: Color): WheelAreaPickerModel {
        this.mSelectedItemTextColor = color
        return this
    }

    public func getSelectedItemTextColor(): Color {
        return this.mSelectedItemTextColor
    }

    public func setItemTextColor(color: Color): WheelAreaPickerModel {
        this.mItemTextColor = color
        return this
    }

    public func getItemTextColor(): Color {
        return this.mItemTextColor
    }

    public func setItemTextSize(size: Int64): WheelAreaPickerModel {
        this.mItemTextSize = size
        return this
    }

    public func getItemTextSize(): Int64 {
        return this.mItemTextSize
    }

    public func setItemSpace(space: Float64): WheelAreaPickerModel {
        this.mSpace = space
        return this
    }

    public func getItemSpace(): Float64 {
        return this.mSpace
    }

    public func setIndicator(hasIndicator: Bool): WheelAreaPickerModel {
        this.hasIndicator = hasIndicator
        return this
    }

    public func hasIndicatorDivide(): Bool {
        return this.hasIndicator
    }

    public func setIndicatorSize(size: Int64): WheelAreaPickerModel {
        this.mIndicatorSize = size
        return this
    }

    public func getIndicatorSize(): Int64 {
        return this.mIndicatorSize
    }

    public func setIndicatorColor(color: Color): WheelAreaPickerModel {
        this.mIndicatorColor = color
        return this
    }

    public func setAtmospheric(hasAtmospheric: Bool): WheelAreaPickerModel {
        this.hasAtmospheric = hasAtmospheric
        return this
    }

    public func setAtmosphericColor(atmosphericColor: Array<(Color, Float64)>): WheelAreaPickerModel {
        this.atmosphericColor = atmosphericColor
        return this
    }

    public func hasAtmosphericShow(): Bool {
        return this.hasAtmospheric
    }

    public func getIndicatorColor(): Color {
        return this.mIndicatorColor
    }

    public func setCurtain(hasCurtain: Bool): WheelAreaPickerModel {
        this.hasCurtain = hasCurtain
        return this
    }

    public func hasCurtainShow(): Bool {
        return this.hasCurtain
    }

    public func setCurtainColor(color: Color): WheelAreaPickerModel {
        this.mCurtainColor = color
        return this
    }

    public func getCurtainColor(): Color {
        return this.mCurtainColor
    }

    public func setItemAlign(align: HorizontalAlign): WheelAreaPickerModel {
        this.mAlign = align
        return this
    }

    public func getItemAlign(): HorizontalAlign {
        return this.mAlign
    }

    public func setFontFamily(fontFamily: String): WheelAreaPickerModel {
        this.mFontFamily = fontFamily
        return this
    }

    public func getFontFamily(): String {
        return this.mFontFamily
    }

    public func updateVisibleItemCount(): Unit {
        if (this.mVisibleItem < 2) {
            return
        }
        if (this.mVisibleItem % 2 == 0) {
            this.mVisibleItem += 1
        }
        this.mItemHeight = this.mTextHeight + 2.0 * this.mSpace
        this.mHalfItemCount = (this.mVisibleItem - 1) / 2
        this.mWheelHeight = Float64(this.mVisibleItem) * this.mItemHeight
    }

    public func setOnAreaSelectedListener(listener: ?OnAreaSelectedListener): WheelAreaPickerModel {
        this.mOnAreaSelectedListener = listener;
        return this
    }
}
