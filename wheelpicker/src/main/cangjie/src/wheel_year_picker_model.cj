/**
 * Created on 2024/11/23
 */
package wheelpicker

public class WheelYearPickerModel {
    var computeEnd: Bool = false

    var mTextHeight: Float64 = 30.0

    var mSpace: Float64 = 8.0

    var mItemHeight: Float64 = this.mTextHeight + 2.0 * this.mSpace

    var mVisibleItem: Int64 = 9

    var mWheelHeight: Float64 = this.mItemHeight * Float64(this.mVisibleItem)

    var mCenterY: Float64 = this.mWheelHeight / 2.0

    var mItemTextSize: Float64 = 16.0

    var mItemTextColor: Color = Color(0x536D8A)

    var mTextMaxHeight: Float64 = 30.0

    var mSelectedItemTextColor: Color = Color(0xFAFAaa)

    var mIndicatorSize: Float64 = 2.0

    var mIndicatorColor: Color = Color.RED

    var mCurtainColor: Color = Color.WHITE

    var mHalfItemCount = 4

    var mFontFamily: String = ""

    var isCyslic: Bool = false

    var hasIndicator: Bool = true

    var hasAtmospheric: Bool = true

    var hasCurtain: Bool = true

    var mFirstSelectPosition: Int64 = 0

    var mSelectedItemPosition: Int64 = 0

    var mAlign: HorizontalAlign = HorizontalAlign.Center

    var mHideAreal = false

    var yearRangeStart: Int64 = 1972

    var yearRangeEnd: Int64 = 2025

    var scrollBgColor: Color = Color.WHITE

    var mOnItemSelectedListener: ?OnItemSelectedListener = None

    public init(){}

    public func setData(mData: Array<String>): WheelYearPickerModel {
        throw Exception("You can not invoke setData in WheelAreaPicker")
    }

    public func setSelectDays(FirstSelectPosition: Int64): WheelYearPickerModel {
      this.mFirstSelectPosition = FirstSelectPosition
      return this
    }

    public func getSelectDays(): Int64 {
      return this.mFirstSelectPosition
    }

    public func getCurrentDays(): Int64 {
      return this.mSelectedItemPosition
    }

    public func setTextHeight(mTextHeight: Float64): WheelYearPickerModel {
        this.mTextHeight = mTextHeight
        return this
    }

    public func getTextHeight(mTextHeight: Float64): Float64 {
        return this.mTextHeight
    }

    public func setVisibleItemCount(count: Int64): WheelYearPickerModel {
        this.mVisibleItem = count
        return this
    }

    public func getVisibleItemCount(): Int64 {
        return this.mVisibleItem
    }

    public func getItemHeight(): Float64 {
        return this.mItemHeight
    }

     public func setCyclic(isCyslic: Bool): WheelYearPickerModel {
      this.isCyslic = isCyslic
      return this
    }

    public func isCyslicShow(): Bool {
      return this.isCyslic
    }

     public func setSelectedItemTextColor(color: Color): WheelYearPickerModel {
        this.mSelectedItemTextColor = color
        return this
    }

    public func getSelectedItemTextColor(): Color {
        return this.mSelectedItemTextColor
    }

    public func setItemTextColor(color: Color): WheelYearPickerModel {
        this.mItemTextColor = color
        return this
    }

    public func getItemTextColor(): Color {
        return this.mItemTextColor
    }

    public func setItemTextSize(size: Float64): WheelYearPickerModel {
        this.mItemTextSize = size
        return this
    }

    public func getItemTextSize(): Float64 {
        return this.mItemTextSize
    }

    public func setItemSpace(space: Float64): WheelYearPickerModel {
        this.mSpace = space
        return this
    }

    public func getItemSpace(): Float64 {
        return this.mSpace
    }

    public func setIndicator(hasIndicator: Bool): WheelYearPickerModel {
        this.hasIndicator = hasIndicator
        return this
    }

    public func hasIndicatorDivide(): Bool {
        return this.hasIndicator
    }

    public func setIndicatorSize(size: Float64): WheelYearPickerModel {
        this.mIndicatorSize = size
        return this
    }

    public func getIndicatorSize(): Float64 {
        return this.mIndicatorSize
    }

    public func setIndicatorColor(color: Color): WheelYearPickerModel {
        this.mIndicatorColor = color
        return this
    }

    public func getIndicatorColor(): Color {
        return this.mIndicatorColor
    }

    public func setCurtain(hasCurtain: Bool): WheelYearPickerModel {
        this.hasCurtain = hasCurtain
        return this
    }

    public func hasCurtainShow(): Bool {
        return this.hasCurtain
    }

    public func setCurtainColor(color: Color): WheelYearPickerModel {
        this.mCurtainColor = color
        return this
    }

    public func getCurtainColor(): Color {
        return this.mCurtainColor
    }

    public func setAtmospheric(hasAtmospheric: Bool): WheelYearPickerModel {
        this.hasAtmospheric = hasAtmospheric
        return this
    }

    public func hasAtmosphericShow(): Bool {
        return this.hasAtmospheric
    }

    public func setItemAlign(align: HorizontalAlign): WheelYearPickerModel {
        this.mAlign = align
        return this
    }

    public func getItemAlign(): HorizontalAlign {
        return this.mAlign
    }

    public func setFontFamily(fontFamily: String): WheelYearPickerModel {
        this.mFontFamily = fontFamily
        return this
    }

    public func getFontFamily(): String {
        return this.mFontFamily
    }

    public func setScrollBgColor(scrollBgColor: Color): WheelYearPickerModel {
        this.scrollBgColor = scrollBgColor
        return this
    }

    public func setYearRangeStart(yearRangeStart: Int64): WheelYearPickerModel {
        this.yearRangeStart = yearRangeStart
        return this
    }

    public func setYearRangeEnd(yearRangeEnd: Int64): WheelYearPickerModel {
        this.yearRangeEnd = yearRangeEnd
        return this
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

    public func setOnItemSelectedListener(listener: ?OnItemSelectedListener): WheelYearPickerModel {
        this.mOnItemSelectedListener = listener;
        return this
    }
}

