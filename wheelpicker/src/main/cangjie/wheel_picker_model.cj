/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package wheelpicker

import ohos.state_manage.*
import ohos.state_macro_manage.*

@Observed
public class WheelPickerModel {
    @Publish
    var mDuration: Float64 = 100.0
    @Publish
    var mTextHeight: Float64 = 28.0
    @Publish
    var mSpace: Float64 = 8.0
    @Publish
    var mItemHeight: Float64 = 0.0
    @Publish
    var mVisibleItem: Int64 = 7
    @Publish
    var mWheelHeight: Float64 = 0.0
    @Publish
    var mItemTextSize: Float64 = 24.0
    @Publish
    var mItemTextColor: Color = Color(0X536D8A)
    @Publish
    var mSelectedItemTextColor: Color = Color(0XFAFAaa)
    @Publish
    var mIndicatorSize: Float64 = 1.0
    @Publish
    var mIndicatorColor: Color = Color.RED
    @Publish
    var mCurtainColor: Color = Color.WHITE
    @Publish
    var mHalfItemCount: Int64 = 0
    @Publish
    var mFontFamily: String = ""
    @Publish
    var isCyslic: Bool = false
    var hasIndicator: Bool = true
    var hasAtmospheric: Bool = false
    var atmosphericColor: Array<(Color, Float64)> = []
    var hasCurtain: Bool = true
    @Publish
    var mFirstSelectPosition: Int64 = 0
    @Publish
    var mSelectedItemPosition: Int64 = 0
    @Publish
    var mAlign: HorizontalAlign = HorizontalAlign.Center
    @Publish
    var mSelectedData: String = ""
    @Publish
    var mData: Array<String> = []
    @Publish
    var scrollBgColor: Color = Color.WHITE

    @Publish
    var scroller: Scroller = Scroller()
    @Publish
    var scroller1: Scroller = Scroller()

    @Publish
    var mSelectDataShow: (text: String) -> Unit = {text: String =>}

    //--------------------------set---------------------------------

    public func setScrollBgColor(scrollBgColor: Color): WheelPickerModel {
        this.scrollBgColor = scrollBgColor
        return this
    }

    public func setData(mData: Array<String>): WheelPickerModel {
        this.mData = mData
        return this
    }

    public func setSelectDataShow(mSelectDataShow: (text: String) -> Unit): WheelPickerModel {
        this.mSelectDataShow = mSelectDataShow
        return this;
    }

    public func setFirstSelectedItemPosition(FirstSelectPosition: Int64): WheelPickerModel {
        this.mFirstSelectPosition = FirstSelectPosition
        return this
    }

    public func setTextHeight(mTextHeight: Float64): WheelPickerModel {
        if (mTextHeight > 30.0) {
            this.mTextHeight = 30.0
            Hilog.error(0, "WheelPicker4cj", "The maximum text height is 30")
        }
        this.mTextHeight = mTextHeight
        return this
    }

    public func setVisibleItemCount(count: Int64): WheelPickerModel {
        if (count < 7) {
            this.mVisibleItem = 7
            Hilog.error(0, "WheelPicker4cj", "The minimum count is 7")
        }
        this.mVisibleItem = count
        return this
    }

    public func setCyclic(isCyslic: Bool): WheelPickerModel {
        this.isCyslic = isCyslic
        return this
    }

    public func setSelectedItemTextColor(color: Color): WheelPickerModel {
        this.mSelectedItemTextColor = color
        return this
    }

    public func setItemTextColor(color: Color): WheelPickerModel {
        this.mItemTextColor = color
        return this
    }

    public func setItemTextSize(size: Float64): WheelPickerModel {
        this.mItemTextSize = size
        return this
    }

    public func setItemSpace(space: Float64): WheelPickerModel {
        this.mSpace = space
        return this
    }

    public func setIndicator(hasIndicator: Bool): WheelPickerModel {
        this.hasIndicator = hasIndicator
        return this
    }

    public func setIndicatorSize(size: Float64): WheelPickerModel {
        this.mIndicatorSize = size
        return this
    }
    public func setIndicatorColor(color: Color): WheelPickerModel {
        this.mIndicatorColor = color
        return this
    }

    public func setCurtainColor(color: Color): WheelPickerModel {
        this.mCurtainColor = color
        return this
    }
    public func setItemAlign(align: HorizontalAlign): WheelPickerModel {
        this.mAlign = align
        return this
    }

    public func setFontFamily(fontFamily: String): WheelPickerModel {
        this.mFontFamily = fontFamily
        return this
    }

    public func setAtmospheric(hasAtmospheric: Bool): WheelPickerModel {
        this.hasAtmospheric = hasAtmospheric
        return this
    }

    public func setAtmosphericColor(atmosphericColor: Array<(Color, Float64)>): WheelPickerModel {
        this.atmosphericColor = atmosphericColor
        return this
    }

    public func hasAtmosphericShow(): Bool {
        return this.hasAtmospheric
    }

    //---------------------------------------get---------------------------------

    public func getCurrentItemPosition(): Int64 {
        return this.mSelectedItemPosition
    }

    public func getCurrentItemData(): String {
        return this.mSelectedData
    }

    public func getTextHeight(mTextHeight: Float64): Float64 {
        return this.mTextHeight
    }

    public func getVisibleItemCount(): Int64 {
        return this.mVisibleItem
    }

    public func getItemHeight(): Float64 {
        return this.mItemHeight
    }

    public func isCyslicShow(): Bool {
        return this.isCyslic
    }

    public func getSelectedItemTextColor(): Color {
        return this.mSelectedItemTextColor
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

    public func hasIndicatorDivide(): Bool {
        return this.hasIndicator
    }

    public func getIndicatorSize(): Float64 {
        return this.mIndicatorSize
    }

    public func getIndicatorColor(): Color {
        return this.mIndicatorColor
    }

    public func getCurtainColor(): Color {
        return this.mCurtainColor
    }

    public func getItemAlign(): HorizontalAlign {
        return this.mAlign
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
        this.mItemHeight = this.mTextHeight + 2.0 * this.mSpace
        this.mWheelHeight = Float64(this.mVisibleItem) * this.mItemHeight
        this.mHalfItemCount = (this.mVisibleItem - 1) / 2
    }

    public func scrollInit(scroller: Scroller) {
        if (this.isCyslic) {
            scroller.scrollTo(
                xOffset: 0.0,
                yOffset: this.mItemHeight * Float64(this.mFirstSelectPosition + this.mData.size - this.mHalfItemCount),
                duration: 0.0,
                curve: Curve.Ease
            )
            this.mSelectedItemPosition = this.mFirstSelectPosition
        } else {
            scroller.scrollTo(
                xOffset: 0.0,
                yOffset: this.mItemHeight * Float64(this.mFirstSelectPosition),
                duration: 0.0,
                curve: Curve.Ease
            )
            this.mSelectedItemPosition = this.mFirstSelectPosition
        }
    }

    public func setSelectedItemPosition(SelectPosition: Int64) {
        if (this.isCyslic) {
            this.scroller.scrollTo(
                xOffset: 0.0,
                yOffset: Float64(SelectPosition - this.mHalfItemCount + this.mData.size) * this.mItemHeight,
                duration: this.mDuration,
                curve: Curve.Ease
            )
        } else {
            this.scroller.scrollTo(
                xOffset: 0.0,
                yOffset: Float64(SelectPosition) * this.mItemHeight,
                duration: this.mDuration,
                curve: Curve.Ease
            )
        }
    }
}
