/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package wheelpicker

public class WheelAreaPickerModel {
    private var computeEnd: Bool = false
    private var mTextHeight: Float64 = 30.0
    var mSpace: Float64 = 8.0
    var mItemHeight: Float64 = this.mTextHeight + 2.0 * this.mSpace
    var mVisibleItem: Int64 = 9
    var mWheelHeight: Float64 = this.mItemHeight * Float64(this.mVisibleItem)
    private var mCenterY: Float64 = this.mWheelHeight / 2.0
    var mItemTextSize: Int64 = 16
    var mItemTextColor: Color = Color(0x536D8A)
    private var mTextMaxHeight: Int64 = 30
    //var mSelectedItemTextColor: Color = Color(0xFAFAaa)
    var mSelectedItemTextColor: Color = Color(0x00ff0000)
    var mIndicatorSize: Int64 = 2
    var mIndicatorColor: Color = Color.RED
    var mCurtainColor: Color = Color.WHITE
    var mHalfItemCount: Int64 = 4
    var mFontFamily: String = ""
    var hasIndicator: Bool = true
    var hasAtmospheric: Bool = true
    var hasCurtain: Bool = true
    var mFirstSelectPosition: Int64 = 0
    var mAlign: HorizontalAlign = HorizontalAlign.Center
    var mHideArea = false
    var mProvinceName: String = ""
    var mCityName: String = ""
    var mAreaName: String = ""
    var scrollBgColor: Color = Color.WHITE

    public init() {}

    public func hideArea(): WheelAreaPickerModel {
        this.mHideArea = true
        return this
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

    public func setAtmospheric(hasAtmospheric: Bool): WheelAreaPickerModel {
        this.hasAtmospheric = hasAtmospheric
        return this
    }

    public func hasAtmosphericShow(): Bool {
        return this.hasAtmospheric
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
        this.mWheelHeight = Float64(this.mVisibleItem) * this.mItemHeight
        this.mCenterY = this.mWheelHeight / 2.0
    }

    public func scrollInit(scroller: Scroller): Unit {
        if (!this.computeEnd) {
            scroller.scrollTo(xOffset: 0.0, yOffset: this.mItemHeight * Float64(this.mFirstSelectPosition), duration: 1.0,
                curve: Curve.Ease)
            this.computeEnd = true
        }
    }
}
