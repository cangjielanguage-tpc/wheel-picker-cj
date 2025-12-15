# wheel-picker-cj 特性文档

## 介绍

wheel-picker-cj 可以实现滚轮选择，可以设置多种 UI 效果，实现的选择器有：时间选择器、地区选择器的三级联动、年、月、日选择器、自定义选择器。

## 1 地区选择器

### 1.1 WheelAreaPickerModel Class API Description

地区选择器数据对象

```cangjie
public class WheelAreaPickerModel {
    
    /**
     * 隐藏地区选项
     * 
     * 返回 Unit
     */
    public func hideArea(): Unit

    /**
     * 设置滚动选择器背景颜色，默认 Color.WHITE
     * 
     * 参数 scrollBgColor - 滚动选择器背景颜色
     * 返回 WheelAreaPickerModel - 地区选择器数据对象
     */
    public func setScrollBgColor(scrollBgColor: Color): WheelAreaPickerModel
    
    /**
     * 设置省份选项的初始位置，默认 0
     * 
     * 参数 FirstSelectPosition - 省份选项初始位置索引
     * 返回 WheelAreaPickerModel - 地区选择器数据对象
     */
    public func setSelectedItemPosition(FirstSelectPosition: Int64): WheelAreaPickerModel

    /**
     * 设置文本数据高度，默认 30.0
     * 
     * 参数 mTextHeight - 文本数据高度
     * 返回 WheelAreaPickerModel - 地区选择器数据对象
     */
    public func setTextHeight(mTextHeight: Float64): WheelAreaPickerModel

    /**
     * 设置滚动选择器可见个数，默认 9,若设置的个数 > 总数据 / 2 ,count 默认为 总数据 /2
     * 
     * 参数 count - 滚动选择器可见个数
     * 返回 WheelAreaPickerModel - 地区选择器数据对象
     */
    public func setVisibleItemCount(count: Int64): WheelAreaPickerModel

    /**
     * 设置选中数据的颜色，默认 Color(0x00ff0000)
     * 
     * 参数 Color - 选中数据的颜色
     * 返回 WheelAreaPickerModel - 地区选择器数据对象
     */
    public func setSelectedItemTextColor(color: Color): WheelAreaPickerModel

    /**
     * 设置文本数据的颜色，默认 Color(0x536D8A)
     * 
     * 参数 Color - 文本数据的颜色
     * 返回 WheelAreaPickerModel - 地区选择器数据对象
     */
    public func setItemTextColor(color: Color): WheelAreaPickerModel

    /**
     * 设置文本数据的大小，默认 16,最大为 (setTextHeight * 2) / 3
     * 
     * 参数 size - 文本数据的大小
     * 返回 WheelAreaPickerModel - 地区选择器数据对象
     */
    public func setItemTextSize(size: Int64): WheelAreaPickerModel
    
    /**
     * 设置列表数据上下间隔，默认 8.0
     * 
     * 参数 space - 列表数据上下间隔
     * 返回 WheelAreaPickerModel - 地区选择器数据对象
     */
    public func setItemSpace(space: Float64): WheelAreaPickerModel

    /**
     * 是否设置选中指示器，默认 true
     * 
     * 参数 hasIndicator - true:设置，flase:不设置
     * 返回 WheelAreaPickerModel - 地区选择器数据对象
     */
    public func setIndicator(hasIndicator: Bool): WheelAreaPickerModel

    /**
     * 设置选中指示器上下边框的大小，默认 2
     * 
     * 参数 size - 选中指示器上下边框的大小
     * 返回 WheelAreaPickerModel - 地区选择器数据对象
     */
    public func setIndicatorSize(size: Int64): WheelAreaPickerModel

    /**
     * 设置选中指示器上下边框的颜色，默认 Color.RED
     * 
     * 参数 color - 选中指示器上下边框的颜色
     * 返回 WheelAreaPickerModel - 地区选择器数据对象
     */
    public func setIndicatorColor(color: Color): WheelAreaPickerModel

    /**
     * 是否设置选中幕布，默认 true
     * 
     * 参数 hasCurtain - true:设置，false:不设置
     * 返回 WheelAreaPickerModel - 地区选择器数据对象
     */
    public func setCurtain(hasCurtain: Bool): WheelAreaPickerModel

    /**
     * 设置选中幕布颜色，默认 Color.WHITE
     * 
     * 参数 color - 选中幕布颜色
     * 返回 WheelAreaPickerModel - 地区选择器数据对象
     */
    public func setCurtainColor(color: Color): WheelAreaPickerModel
    
    /**
     * 设置文本数据对齐方式，默认 HorizontalAlign.Center
     * 
     * 参数 align - 文本数据对齐方式，默认居中对齐
     * 返回 WheelAreaPickerModel - 地区选择器数据对象
     */
    public func setItemAlign(align: HorizontalAlign): WheelAreaPickerModel

    /**
     * 设置文本数据字体样式
     * 
     * 参数 fontFamily - 仓颉字体样式
     * 返回 WheelAreaPickerModel - 地区选择器数据对象
     */
    public func setFontFamily(fontFamily: String): WheelAreaPickerModel
    
    /**
     * 设置滚轮选择器是否有空气感
     * 
     * 参数 hasAtmospheric - true(是空气感)/false(不是空气感)
     * 返回 WheelAreaPickerModel - 地区选择器数据对象
     */
    public func setAtmospheric(hasAtmospheric: Bool): WheelAreaPickerModel
    
    /**
     * 设置空气感渐变颜色
     * 
     * 参数 atmosphericColor - 渐变颜色数组
     * 返回 WheelAreaPickerModel - 地区选择器数据对象
     */
    public func setAtmosphericColor(atmosphericColor: Array<(Color, Float64)>): WheelAreaPickerModel
    
    /**
     * 是否设置了空气感
     *
     * 返回 WheelAreaPickerModel - true/false
     */
    public func hasAtmosphericShow(): Bool

    /**
     * 获取文本数据的字体样式。
     * 
     * 返回 String - 文本数据的字体样式
     */
    public func getFontFamily(): String 

    /**
     * 获取选择的省份。
     * 
     * 返回 String - 选择的省份
     */
    public func getProvince(): String

    /**
     * 获取选择的城市。
     * 
     * 返回 String - 选择的城市
     */
    public func getCity(): String

    /**
     * 获取选择的地区。
     * 
     * 返回 String - 选择的地区
     */
    public func getArea(): String

    /**
     * 获取文本数据的高度。
     * 
     * 返回 Float64 - 文本数据的高度
     */
    public func getTextHeight(): Float64

    /**
     * 获取滚动选择器可见个数。
     * 
     * 返回 Int64 - 滚动选择器可见个数
     */
    public func getVisibleItemCount(): Int64

    /**
     * 获取滚轮行的高度。
     * 
     * 返回 Float64 - 滚轮行的高度
     */
    public func getItemHeight(): Float64

    /**
     * 获取选中项文本颜色。
     * 
     * 返回 Color - 选中项文本颜色
     */
    public func getSelectedItemTextColor(): Color

    /**
     * 获取文本颜色。
     * 
     * 返回 Color - 文本颜色
     */
    public func getItemTextColor(): Color

    /**
     * 获取文本字体大小。
     * 
     * 返回 Int64 - 文本字体大小
     */
    public func getItemTextSize(): Int64

    /**
     * 获取列表数据上下间隔。
     * 
     * 返回 Float64 - 列表数据上下间隔
     */
    public func getItemSpace(): Float64

    /**
     * 获取是否设置了指示器。
     * 
     * 返回 Bool - true/false
     */
    public func hasIndicatorDivide(): Bool

    /**
     * 获取指示器上下边框大小。
     * 
     * 返回 Int64 - 指示器上下边框大小
     */
    public func getIndicatorSize(): Int64

    /**
     * 获取指示器上下边框的颜色。
     *  
     * 返回 Color - 指示器上下边框的颜色
     */
    public func getIndicatorColor(): Color

    /**
     * 获取是否设置了幕布。
     * 
     * 返回 Bool - true/false
     */
    public func hasCurtainShow(): Bool

    /**
     * 获取幕布颜色。
     * 
     * 返回 Color - 幕布颜色
     */
    public func getCurtainColor(): Color
    
    /**
     * 获取文本数据对齐方式。
     * 
     * 返回 HorizontalAlign - 文本数据对齐方式
     */
    public func getItemAlign(): HorizontalAlign

    /**
     * 获取选中省份的索引。
     * 
     * 返回 Int64 - 选中省份的索引
     */
    public func getSelectedItemPosition(): Int64
    
    /**
     * 设置地区择器监听事件
     * 
     * 参数 listener - 监听事件
     * 返回 WheelAreaPickerModel - 地区选择器数据对象
     */
    public func setOnAreaSelectedListener(listener: ?OnAreaSelectedListener): WheelAreaPickerModel
}

```

### 1.2 WheelAreaPicker Component API Description

地区选择器组件

```cangjie
@Component
public class WheelAreaPicker {
    @State
    var model: WheelAreaPickerModel
}
```

### 1.3 示例

```cangjie
import wheelpicker.*

internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos.state_macro_manage.*

@Entry
@Component
class MyWheelAreaPicker {
    @State
    var showWheelAreaPicker: WheelAreaPickerModel = WheelAreaPickerModel()

    protected override func aboutToAppear() {
        this.showWheelAreaPicker = this.showWheelAreaPicker
        .setItemTextSize(15)
        .setTextHeight(20.0)
        .setItemAlign(HorizontalAlign.Center)
        .setIndicatorColor(Color.GRAY) //设置选中幕布上下边框颜色
        .setCurtainColor(Color.WHITE) //设置选中幕布颜色
        .setItemTextColor(Color.GRAY) // 设置数据的颜色
        .setSelectedItemTextColor(Color.BLACK) //设置选中的数据颜色
        .setScrollBgColor(Color.WHITE) // 设置滚动组件的颜色
    }

    func build() {
        Column() {
            Flex(
                FlexParams(direction: FlexDirection.Column, alignItems: ItemAlign.Center,
                justifyContent: FlexAlign.Center)
           ) {
              WheelAreaPicker(model: this.showWheelAreaPicker)
            }.width(100.percent)
        }
    }
}
```

## 2 日期选择器

### 2.1 WheelDatePickerModel Class API Description

日期选择器数据对象

```cangjie
public class WheelDatePickerModel {
    
    /**
     * 设置滚动选择器背景颜色，默认 Color.WHITE
     * 
     * 参数 scrollBgColor - 滚动选择器背景颜色
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setScrollBgColor(scrollBgColor: Color): WheelDatePickerModel
    
    /**
     * 设置文本数据高度，默认 30.0
     * 
     * 参数 mTextHeight - 文本数据高度
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setTextHeight(mTextHeight: Float64): WheelDatePickerModel

    /**
     * 设置滚动选择器可见个数，默认 9，若设置的个数 > 总数据 / 2 ,count 默认为 总数据 /2
     * 
     * 参数 count - 滚动选择器可见个数
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setVisibleItemCount(count: Int64): WheelDatePickerModel

    /**
     * 设置是否循环展示，默认 false
     * 
     * 参数 isCyslic - 是否循环展示
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setCyclic(isCyslic: Bool): WheelDatePickerModel

    /**
     * 设置选中数据的颜色，默认 Color(0x00ff0000)
     * 
     * 参数 color - 选中数据的颜色
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setSelectedItemTextColor(color: Color): WheelDatePickerModel

    /**
     * 设置文本数据的颜色，默认 Color(0x536D8A)
     * 
     * 参数 color - 文本数据的颜色
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setItemTextColor(color: Color): WheelDatePickerModel

    /**
     * 设置文本数据的大小，默认 16
     * 
     * 参数 size - 文本数据的大小
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setItemTextSize(size: Int64): WheelDatePickerModel
    
    /**
     * 设置列表数据上下间隔，默认 8.0, 最大值不超过文本数据高度 
     * 
     * 参数 space - 列表数据上下间隔
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setItemSpace(space: Float64): WheelDatePickerModel

    /**
     * 是否设置选中指示器，默认 true
     * 
     * 参数 hasIndicator - true:设置，flase:不设置
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setIndicator(hasIndicator: Bool): WheelDatePickerModel

    /**
     * 设置选中指示器上下边框的大小，默认 2
     * 
     * 参数 size - 选中指示器上下边框的大小
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setIndicatorSize(size: Int64): WheelDatePickerModel

    /**
     * 设置选中指示器上下边框的颜色，默认 Color.RED
     * 
     * 参数 color - 选中指示器上下边框的颜色
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setIndicatorColor(color: Color): WheelDatePickerModel

    /**
     * 设置选中幕布颜色，默认 Color.WHITE
     * 
     * 参数 color - 选中幕布颜色
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setCurtainColor(color: Color): WheelDatePickerModel
    
    /**
     * 设置年文本数据对齐方式，默认 HorizontalAlign.Center
     * 
     * 参数 align - 文本数据对齐方式，默认居中对齐
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setItemAlignYear(align: HorizontalAlign): WheelDatePickerModel

    /**
     * 设置月文本数据对齐方式，默认 HorizontalAlign.Center
     * 
     * 参数 align - 文本数据对齐方式，默认居中对齐
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setItemAlignMonth(align: HorizontalAlign): WheelDatePickerModel

    /**
     * 设置日文本数据对齐方式，默认 HorizontalAlign.Center
     * 
     * 参数 align - 文本数据对齐方式，默认居中对齐
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setItemAlignDay(align: HorizontalAlign): WheelDatePickerModel

    /**
     * 设置文本数据字体样式
     * 
     * 参数 fontFamily - 仓颉字体样式
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setFontFamily(fontFamily: String): WheelDatePickerModel

    /**
     * 设置年选择项开始年份,开始年份应该 <= 结束年份
     * 
     * 参数 yearStart - 年选择项开始年份
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setYearStart(yearStart: Int64): WheelDatePickerModel

    /**
     * 设置年选择项结束年份,若结束年份 <= 开始年份，则只显示开始年份
     * 
     * 参数 yearEnd - 年选择项结束年份
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setYearEnd(yearEnd: Int64): WheelDatePickerModel

    /**
     * 设置年选择项开始位置索引
     * 
     * 参数 mFirstSelectYearPosition - 年选择项开始位置索引，若开始位置 < 0,默认 0
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setSelectedYear(mFirstSelectYearPosition: Int64): WheelDatePickerModel

    /**
     * 设置月选择项开始位置索引
     * 
     * 参数 mFirstSelectMonthPosition - 月选择项开始位置，若开始位置 < 0,默认 0
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setSelectedMonth(mFirstSelectMonthPosition: Int64): WheelDatePickerModel

    /**
     * 设置日选择项开始位置索引
     * 
     * 参数 mFirstSelectDayPosition - 日选择项开始位置索引，若开始位置 < 0,默认 0
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
    public func setSelectedDay(mFirstSelectDayPosition: Int64): WheelDatePickerModel
    
    /**
     * 设置滚轮选择器是否有空气感
     * 
     * 参数 hasAtmospheric - true(是空气感)/false(不是空气感)
     * 返回 WheelAreaPickerModel - 日期选择器数据对象
     */
    public func setAtmospheric(hasAtmospheric: Bool): WheelDatePickerModel
    
    /**
     * 设置空气感渐变颜色
     * 
     * 参数 atmosphericColor - 渐变颜色数组
     * 返回 WheelAreaPickerModel - 日期选择器数据对象
     */
    public func setAtmosphericColor(atmosphericColor: Array<(Color, Float64)>): WheelDatePickerModel
    
    /**
     * 是否设置了空气感
     *
     * 返回 Bool - true/false
     */
    public func hasAtmosphericShow(): Bool
    
    /**
     * 获取选中项文本颜色。
     * 
     * 返回 Color - 选中项文本颜色
     */
    public func getSelectedItemTextColor(): Color


    /**
     * 获取滚轮行的高度。
     * 
     * 返回 Float64 - 滚轮行的高度
     */
    public func getItemHeight(): Float64

    /**
     * 获取滚动选择器可见个数。
     * 
     * 返回 Int64 - 滚动选择器可见个数
     */
    public func getVisibleItemCount(): Int64

    /**
     * 获取文本数据的高度。
     *
     * 参数 mTextHeight - 文本数据高度
     * 
     * 返回 Float64 - 文本数据的高度
     */
    public func getTextHeight(mTextHeight: Float64): Float64

    /**
     * 获取文本颜色。
     * 
     * 返回 Color - 文本颜色
     */
    public func getItemTextColor(): Color

    /**
     * 获取文本字体大小。
     * 
     * 返回 Float64 - 文本字体大小
     */
    public func getItemTextSize(): Float64

    /**
     * 获取列表数据上下间隔。
     * 
     * 返回 Float64 - 列表数据上下间隔
     */
    public func getItemSpace(): Float64

    /**
     * 获取指示器上下边框大小。
     * 
     * 返回 Float64 - 指示器上下边框大小
     */
    public func getIndicatorSize(): Float64

    /**
     * 获取指示器上下边框的颜色。
     *  
     * 返回 Color - 指示器上下边框的颜色
     */
    public func getIndicatorColor(): Color

    /**
     * 获取幕布颜色。
     * 
     * 返回 Color - 幕布颜色
     */
    public func getCurtainColor(): Color

    /**
     * 获取文本数据的字体样式。
     * 
     * 返回 String - 文本数据的字体样式
     */
    public func getFontFamily(): String 

    /**
     * 获取年文本数据的字体对齐方式。
     * 
     * 返回 HorizontalAlign - 年文本数据的字体对齐方式
     */
    public func getItemAlignYear(): HorizontalAlign

    /**
     * 获取月文本数据的字体对齐方式。
     * 
     * 返回 HorizontalAlign - 月文本数据的字体样式
     */
    public func getItemAlignMonth(): HorizontalAlign

    /**
     * 获取日文本数据的字体对齐方式。
     * 
     * 返回 HorizontalAlign - 日文本数据的字体样式
     */
    public func getItemAlignDay(): HorizontalAlign

    /**
     * 获取开始年份。
     * 
     * 返回 Int64 - 开始年份
     */
    public func getYearStart(): Int64

    /**
     * 获取结束年份。
     * 
     * 返回 Int64 - 结束年份
     */
    public func getYearEnd(): Int64

    /**
     * 获取首次显示年份位置索引。
     * 
     * 返回 Int64 - 首次显示年份位置索引
     */
    public func getSelectedYear(): Int64

    /**
     * 获取当前选择年份位置索引。
     * 
     * 返回 Int64 - 当前选择年份位置索引
     */
    public func getCurrentYear(): Int64

    /**
     * 获取首次显示月位置索引。
     * 
     * 返回 Int64 - 首次显示月位置索引
     */
    public func getSelectedMonth(): Int64

    /**
     * 获取当前选择月份位置索引。
     * 
     * 返回 Int64 - 当前选择月份位置索引
     */
    public func getCurrentMonth(): Int64

    /**
     * 获取首次显示日期位置索引。
     * 
     * 返回 Int64 - 首次显示日期位置索引
     */
    public func getSelectedDay(): Int64

    /**
     * 获取当前选择日期位置索引。
     * 
     * 返回 Int64 - 获取当前选择日期位置索引
     */
    public func getCurrentDay(): Int64

    /**
     * 获取当前选择的年份。
     * 
     * 返回 Int64 - 当前选择的年份
     */
    public func getYear(): Int64

    /**
     * 获取当前选择的月份。
     * 
     * 返回 Int64 - 当前选择的月份
     */
    public func getMonth(): Int64

    /**
     * 获取当前选择的日期。
     * 
     * 返回 String - 当前选择的日期
     */
    public func getCurrentDate(): String

    /**
     * 获取是否循环展示
     * 
     * 返回 Bool - true/false
     */
    public func isCyslicShow(): Bool
	
	/**
     * 设置日期选择器监听事件
     * 
     * 参数 listener - 监听事件
     * 返回 WheelDatePickerModel - 日期选择器数据对象
     */
	public func setOnDateSelectedListener(listener: ?OnDateSelectedListener): WheelDatePickerModel 

}

```

### 2.2 WheelDatePicker Component API Description

日期选择器数组件

@Component
public class WheelDatePicker {
    @Link
    var model: WheelDatePickerModel
}

### 2.3 示例

```cangjie
import wheelpicker.*

internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.router.*
import ohos.prompt_action.*


@Entry
@Component
class MyWheelDatePicker {
    @State
    var showWheelDatePicker: WheelDatePickerModel = WheelDatePickerModel()

    protected override func aboutToAppear() {
       this.showWheelDatePicker = this.showWheelDatePicker
        .setItemTextSize(15.0) //设置文本大小
        .setTextHeight(30.0)  //设置文本高度
        .setItemSpace(10.0)  //设置文本间隔
        .setItemAlignYear(HorizontalAlign.Center) //年文本居中显示
        .setItemAlignMonth(HorizontalAlign.Center) //年文本居中显示
        .setItemAlignDay(HorizontalAlign.Center) //年文本居中显示
        .setVisibleItemCount(9)  //设置显示的条数
        .setIndicatorColor(Color.GRAY) //设置选中幕布上下边框颜色
        .setIndicatorSize(2.0)  //设置选中幕布上下边框宽度
        .setCurtainColor(Color.WHITE) //设置选中幕布颜色
        .setItemTextColor(Color.GRAY) // 设置数据的颜色
        .setSelectedItemTextColor(Color.BLACK) //设置选中的数据颜色
        .setScrollBgColor(Color.WHITE) // 设置滚动组件的颜色
        .setCyclic(false) //是否开启循环
        .setYearStart(1992) //设置开始年份
        .setYearEnd(2025) //设置结束年份

    }

    func build() {
        Column() {
            Flex(FlexParams(
                    direction: FlexDirection.Column,
                    alignItems: ItemAlign.Center,
                    justifyContent: FlexAlign.Center
                )) {
                WheelDatePicker(model: this.showWheelDatePicker)
            }.width(100.percent)
        }
    }
}

```

## 3 自定义选择器

### 3.1 WheelPickerModel Class API Description

自定义选择器数据对象

```cangjie

public class WheelPickerModel {

    /**
     * 设置滚动选择器背景颜色，默认 Color.WHITE
     * 
     * 参数 scrollBgColor - 滚动选择器背景颜色
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setScrollBgColor(scrollBgColor: Color): WheelPickerModel

    /**
     * 设置自定义选择器数据
     * 
     * 参数 mData - 自定义选择器数据
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setData(mData: Array<String>): WheelPickerModel
   
    /**
     * 选择的数据展示
     * 
     * 参数 mSelectDataShow - 选择的数据展示回调函数
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setSelectDataShow(mSelectDataShow: (text: String) -> Unit): WheelPickerModel

    /**
     * 首次显示数据项索引
     * 
     * 参数 FirstSelectPosition - 首次显示数据项索引
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setFirstSelectedItemPosition(FirstSelectPosition: Int64): WheelPickerModel
    
    /**
     * 设置文本数据高度，默认 30.0
     * 
     * 参数 mTextHeight - 文本数据高度
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setTextHeight(mTextHeight: Float64): WheelPickerModel

    /**
     * 设置滚动选择器可见个数，默认 9，若设置的个数 > 总数据 / 2 ,count 默认为 总数据 /2
     * 
     * 参数 count - 滚动选择器可见个数
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setVisibleItemCount(count: Int64): WheelPickerModel

    /**
     * 设置是否循环展示，默认 false
     * 
     * 参数 isCyslic - 是否循环展示
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setCyclic(isCyslic: Bool): WheelPickerModel

    /**
     * 设置选中数据的颜色，默认 Color(0x00ff0000)
     * 
     * 参数 color - 选中数据的颜色
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setSelectedItemTextColor(color: Color): WheelPickerModel

    /**
     * 设置文本数据的颜色，默认 Color(0x536D8A)
     * 
     * 参数 color - 文本数据的颜色
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setItemTextColor(color: Color): WheelPickerModel

    /**
     * 设置文本数据的大小，默认 16
     * 
     * 参数 size - 文本数据的大小
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setItemTextSize(size: Float64): WheelPickerModel
    
    /**
     * 设置列表数据上下间隔，默认 8.0
     * 
     * 参数 space - 列表数据上下间隔
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setItemSpace(space: Float64): WheelPickerModel

    /**
     * 是否设置选中指示器，默认 true
     * 
     * 参数 hasIndicator - true:设置，flase:不设置
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setIndicator(hasIndicator: Bool): WheelPickerModel

    /**
     * 设置选中指示器上下边框的大小，默认 2
     * 
     * 参数 size - 选中指示器上下边框的大小
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setIndicatorSize(size: Float64): WheelPickerModel

    /**
     * 设置选中指示器上下边框的颜色，默认 Color.RED
     * 
     * 参数 color - 选中指示器上下边框的颜色
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setIndicatorColor(color: Color): WheelPickerModel

    /**
     * 设置选中幕布颜色，默认 Color.WHITE
     * 
     * 参数 color - 选中幕布颜色
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setCurtainColor(color: Color): WheelPickerModel

    /**
     * 设置文本数据对齐方式，默认 HorizontalAlign.Center
     * 
     * 参数 align - 文本数据对齐方式，默认居中对齐
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setItemAlign(align: HorizontalAlign): WheelPickerModel

    /**
     * 设置文本数据字体样式
     * 
     * 参数 fontFamily - 仓颉字体样式
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setFontFamily(fontFamily: String): WheelPickerModel
    
    /**
     * 设置滚轮选择器是否有空气感
     * 
     * 参数 hasAtmospheric - true(是空气感)/false(不是空气感)
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setAtmospheric(hasAtmospheric: Bool): WheelPickerModel
    
    /**
     * 设置空气感渐变颜色
     * 
     * 参数 atmosphericColor - 渐变颜色数组
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
    public func setAtmosphericColor(atmosphericColor: Array<(Color, Float64)>): WheelPickerModel
    
    /**
     * 是否设置了空气感
     *
     * 返回 Bool - true/false
     */
    public func hasAtmosphericShow(): Bool
    
    /**
     * 获取当前选择的位置索引
     * 
     * 返回 Int64 - 当前选择的位置索引
     */
    public func getCurrentItemPosition(): Int64

    /**
     * 获取当前选择的数据
     * 
     * 返回 String - 当前选择的数据
     */
    public func getCurrentItemData(): String

    /**
     * 获取文本数据的高度。
     *
     * 参数 mTextHeight - 文本高度
     * 
     * 返回 Float64 - 文本数据的高度
     */
    public func getTextHeight(mTextHeight: Float64): Float64

    /**
     * 获取滚动选择器可见个数。
     * 
     * 返回 Int64 - 滚动选择器可见个数
     */
    public func getVisibleItemCount(): Int64

    /**
     * 获取滚轮行的高度。
     * 
     * 返回 Float64 - 滚轮行的高度
     */
    public func getItemHeight(): Float64
    
    /**
     * 获取是否循环展示
     * 
     * 返回 Bool - true/false
     */
    public func isCyslicShow(): Bool

    /**
     * 获取选中项文本颜色。
     * 
     * 返回 Color - 选中项文本颜色
     */
    public func getSelectedItemTextColor(): Color

    /**
     * 获取文本颜色。
     * 
     * 返回 Color - 文本颜色
     */
    public func getItemTextColor(): Color 

    /**
     * 获取文本字体大小。
     * 
     * 返回 Float64 - 文本字体大小
     */
    public func getItemTextSize(): Float64

    /**
     * 获取列表数据上下间隔。
     * 
     * 返回 Float64 - 列表数据上下间隔
     */
    public func getItemSpace(): Float64

    /**
     * 获取是否设置了指示器。
     * 
     * 返回 Bool - true/false
     */
    public func hasIndicatorDivide(): Bool 

    /**
     * 获取指示器上下边框大小。
     * 
     * 返回 Float64 - 指示器上下边框大小
     */
    public func getIndicatorSize(): Float64

    /**
     * 获取指示器上下边框的颜色。
     *  
     * 返回 Color - 指示器上下边框的颜色
     */
    public func getIndicatorColor(): Color 

    /**
     * 获取幕布颜色。
     * 
     * 返回 Color - 幕布颜色
     */
    public func getCurtainColor(): Color

    /**
     * 获取文本数据对齐方式。
     * 
     * 返回 HorizontalAlign - 文本数据对齐方式
     */
    public func getItemAlign(): HorizontalAlign 

    /**
     * 获取文本数据的字体样式。
     * 
     * 返回 String - 文本数据的字体样式
     */
    public func getFontFamily(): String

    /**
     * 设置选项的初始位置，默认 0
     * 
     * 参数 SelectPosition - 选项的初始位置
     * 返回 WheelPickerModel - 选择器数据对象
     */
    public func setSelectedItemPosition(SelectPosition: Int64): WheelPickerModel
	
	/**
     * 设置自定义选择器监听事件
     * 
     * 参数 listener - 监听事件
     * 返回 WheelPickerModel - 自定义选择器数据对象
     */
	public func setOnItemSelectedListener(listener: ?OnSelectedListener): WheelPickerModel 
}

```

### 3.2 WheelPicker Component API Description

自定义选择器组件

```cangjie
@Component
public class WheelPicker {
    @Link
    var model: WheelPickerModel
}
```

### 3.3 示例

```cangjie
import wheelpicker.*

internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.router.*
import ohos.prompt_action.*
import std.math.*
import std.random.*

@Entry
@Component
class MyWheelPicker {
    @State
    var showWheelPickerLeft: WheelPickerModel = WheelPickerModel()
    @State
    var showWheelPickerMiddle: WheelPickerModel = WheelPickerModel()
    @State
    var showWheelPickerRight: WheelPickerModel = WheelPickerModel()

    private var arr: Array<String> = [
        "AigeStudio",
        "Aige",
        "爱哥",
        "الحب  اخي",
        "jeg elsker",
        "xiBa",
        "Amor de irmão",
        "armastan",
        "愛の兄",
        "xiOngD",
        "любовь - братa",
        "miłość bracie",
        "Liebe",
        "Lamour",
        "rakastan sinua",
        "láska..",
        "dragostea.",
        "jag älskar",
        "ljubezen, brat.",
        "愛哥",
        "bieLie",
        "αγάπη μου",
        "a szerelem.",
        "Amore, fratello."
    ]

    @State
    var randomNumber: Int64 = Int64(floor(Random().nextFloat64() * Float64(this.arr.size - 1)))
    @State
    var randomSelect: String = this.arr[0]

    protected override func aboutToAppear() {
        this.randomSelect = this.arr[randomNumber]

        this.showWheelPickerLeft = this.showWheelPickerLeft
        .setItemAlign(HorizontalAlign.End)
        .setData(this.arr)
        .setCurtainColor(Color.WHITE)
        .setCyclic(true)
        .setFontFamily("")
        .setIndicatorColor(Color.RED)
        .setIndicatorSize(1.0)
        .setItemSpace(8.0)
        .setItemTextColor(Color(0x536D8A))
        .setItemTextSize(15.0)
        .setSelectedItemTextColor(Color.GREEN)
        .setTextHeight(20.0)
        .setVisibleItemCount(7)
        .setSelectDataShow({
            text: String => PromptAction.showToast(message: "Left:" + text)
        })

        this.showWheelPickerMiddle = this.showWheelPickerMiddle
        .setItemAlign(HorizontalAlign.Center)
        .setItemTextSize(15.0)
        .setData(this.arr)
        .setSelectedItemTextColor(Color.BLUE)
        .setSelectDataShow({
            text: String => PromptAction.showToast(message: "Centre:" + text);
        })

        this.showWheelPickerRight = this.showWheelPickerRight
        .setItemAlign(HorizontalAlign.Start)
        .setItemTextSize(15.0)
        .setSelectedItemTextColor(Color.GRAY)
        .setData(this.arr)
        .setSelectDataShow({
            text: String => PromptAction.showToast(message: "Right:" + text);
        })
    }

    func build() {
        Column() {
            Flex(
                FlexParams(
                    direction: FlexDirection.Column,
                    alignItems: ItemAlign.Center,
                    justifyContent: FlexAlign.Start
                )
            ) {
                Button("go to:${this.randomSelect}")
                .height(70)
                .padding(10)
                .fontSize(24)
                .margin(bottom: 10)
                .onClick({
                        =>
                        this.showWheelPickerMiddle.setSelectedItemPosition(this.randomNumber)
                        this.randomNumber = Int64(floor(Random().nextFloat64() * Float64(this.arr.size - 1)))
                        this.randomSelect = this.arr[this.randomNumber]
                 })

                Flex(FlexParams(justifyContent: FlexAlign.Center)) {
                    Row() {
                        WheelPicker(model: this.showWheelPickerLeft)
                        WheelPicker(model: this.showWheelPickerMiddle)
                        WheelPicker(model: this.showWheelPickerRight)
                    }
                }
            }.width(100.percent)
        }
    }
}

```

## 4 年选择器
 
### 4.1 WheelYearPickerModel Class API Description

年选择器数据对象

```cangjie
public class WheelYearPickerModel {

    /**
     * 年选择器数据对象初始化
     */
    public init()

    /**
     * 设置首次选择项的初始位置索引。
     * 
     * 参数 FirstSelectPosition - 首次选择项的初始位置索引
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setSelectDays(FirstSelectPosition: Int64): WheelYearPickerModel

    /**
     * 获取首次选择项的初始位置索引。
     * 
     * 返回 Int64 - 首次选择项的初始位置索引
     */
    public func getSelectDays(): Int64

    /**
     * 获取当前选中项的索引。
     * 
     * 返回 Int64 - 当前选中项的索引
     */
    public func getCurrentDays(): Int64

    /**
     * 设置文本数据高度，默认 30.0
     * 
     * 参数 mTextHeight - 文本数据高度
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setTextHeight(mTextHeight: Float64): WheelYearPickerModel

    /**
     * 获取文本数据的高度。
     * 
     * 参数 mTextHeight - 文本数据高度
     * 返回 Float64 - 文本数据的高度
     */
    public func getTextHeight(mTextHeight: Float64): Float64

    /**
     * 设置滚动选择器可见个数，默认 9，若设置的个数 > 总数据 / 2 ,count 默认为 总数据 /2
     * 
     * 参数 count - 滚动选择器可见个数
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setVisibleItemCount(count: Int64): WheelYearPickerModel
    
    /**
     * 设置滚轮选择器是否有空气感
     * 
     * 参数 hasAtmospheric - true(是空气感)/false(不是空气感)
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setAtmospheric(hasAtmospheric: Bool): WheelYearPickerModel
    
    /**
     * 设置空气感渐变颜色
     * 
     * 参数 atmosphericColor - 渐变颜色数组
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setAtmosphericColor(atmosphericColor: Array<(Color, Float64)>): WheelYearPickerModel
    
    /**
     * 是否设置了空气感
     *
     * 返回 Bool - true/false
     */
    public func hasAtmosphericShow(): Bool
    
    /**
     * 获取滚动选择器可见个数。
     * 
     * 返回 Int64 - 滚动选择器可见个数
     */
    public func getVisibleItemCount(): Int64

    /**
     * 获取滚轮行的高度。
     * 
     * 返回 Float64 - 滚轮行的高度
     */
    public func getItemHeight(): Float64

    /**
     * 设置是否循环展示，默认 false
     * 
     * 参数 isCyslic - 是否循环展示
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setCyclic(isCyslic: Bool): WheelYearPickerModel

    /**
     * 获取是否循环展示
     * 
     * 返回 Bool - true/false
     */
    public func isCyslicShow(): Bool 

    /**
     * 设置选中数据的颜色，默认 Color(0x00ff0000)
     * 
     * 参数 color - 选中数据的颜色
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setSelectedItemTextColor(color: Color): WheelYearPickerModel

    /**
     * 获取选中项文本颜色。
     * 
     * 返回 Color - 选中项文本颜色
     */
    public func getSelectedItemTextColor(): Color

    /**
     * 设置文本数据的颜色，默认 Color(0x536D8A)
     * 
     * 参数 color - 文本数据的颜色
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setItemTextColor(color: Color): WheelYearPickerModel

    /**
     * 获取文本颜色。
     * 
     * 返回 Color - 文本颜色
     */
    public func getItemTextColor(): Color

    /**
     * 设置文本数据的大小，默认 16
     * 
     * 参数 size - 文本数据的大小
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setItemTextSize(size: Float64): WheelYearPickerModel

    /**
     * 获取文本字体大小。
     * 
     * 返回 Float64 - 文本字体大小
     */
    public func getItemTextSize(): Float64
    
    /**
     * 设置列表数据上下间隔，默认 8.0
     * 
     * 参数 space - 列表数据上下间隔
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setItemSpace(space: Float64): WheelYearPickerModel

    /**
     * 获取列表数据上下间隔。
     * 
     * 返回 Float64 - 列表数据上下间隔
     */
    public func getItemSpace(): Float64

    /**
     * 是否设置选中指示器，默认 true
     * 
     * 参数 hasIndicator - true:设置，flase:不设置
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setIndicator(hasIndicator: Bool): WheelYearPickerModel

    /**
     * 获取是否设置了指示器。
     * 
     * 返回 Bool - true/false
     */
    public func hasIndicatorDivide(): Bool

    /**
     * 设置选中指示器上下边框的大小，默认 2
     * 
     * 参数 size - 选中指示器上下边框的大小
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setIndicatorSize(size: Float64): WheelYearPickerModel

    /**
     * 获取指示器上下边框大小。
     * 
     * 返回 Float64 - 指示器上下边框大小
     */
    public func getIndicatorSize(): Float64

    /**
     * 设置选中指示器上下边框的颜色，默认 Color.RED
     * 
     * 参数 color - 选中指示器上下边框的颜色
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setIndicatorColor(color: Color): WheelYearPickerModel

    /**
     * 获取指示器上下边框的颜色。
     *  
     * 返回 Color - 指示器上下边框的颜色
     */
    public func getIndicatorColor(): Color

    /**
     * 设置选中幕布颜色，默认 Color.WHITE
     * 
     * 参数 color - 选中幕布颜色
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setCurtainColor(color: Color): WheelYearPickerModel

    /**
     * 获取幕布颜色。
     * 
     * 返回 Color - 幕布颜色
     */
    public func getCurtainColor(): Color
    
    /**
     * 设置文本数据对齐方式，默认 HorizontalAlign.Center
     * 
     * 参数 align - 文本数据对齐方式，默认居中对齐
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setItemAlign(align: HorizontalAlign): WheelYearPickerModel

    /**
     * 获取文本数据对齐方式。
     * 
     * 返回 HorizontalAlign - 文本数据对齐方式
     */
    public func getItemAlign(): HorizontalAlign

    /**
     * 设置文本数据字体样式
     * 
     * 参数 fontFamily - 仓颉字体样式
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setFontFamily(fontFamily: String): WheelYearPickerModel

    /**
     * 获取文本数据的字体样式。
     * 
     * 返回 String - 文本数据的字体样式
     */
    public func getFontFamily(): String

    /**
     * 设置滚动选择器背景颜色，默认 Color.WHITE
     * 
     * 参数 scrollBgColor - 滚动选择器背景颜色
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setScrollBgColor(scrollBgColor: Color): WheelYearPickerModel
    
    /**
     * 设置开始年份
     * 
     * 参数 yearRangeStart - 开始年份
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setYearRangeStart(yearRangeStart: Int64): WheelYearPickerModel

    /**
     * 设置结束年份
     * 
     * 参数 yearRangeEnd - 结束年份
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setYearRangeEnd(yearRangeEnd: Int64): WheelYearPickerModel

    /**
     * 设置年选择器监听事件
     * 
     * 参数 listener - 监听事件
     * 返回 WheelYearPickerModel - 年选择器数据对象
     */
    public func setOnItemSelectedListener(listener: ?OnItemSelectedListener): WheelYearPickerModel
}

```
 
### 4.2 WheelYearPicker Component API Description

年选择器组件

```cangjie
@Component
public class WheelYearPicker {
    @State
    var model: WheelYearPickerModel
}
```

### 4.3 示例

```cangjie
import wheelpicker.*

internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.router.*
import ohos.prompt_action.*


@Entry
@Component
class MyWheelYearPicker {
    @State
    var showWheelYearPicker: WheelYearPickerModel = WheelYearPickerModel()

    protected override func aboutToAppear() {
       this.showWheelYearPicker = this.showWheelYearPicker
        .setItemTextSize(15.0)
        .setTextHeight(20.0)
        .setItemAlign(HorizontalAlign.Center)
        .setIndicatorColor(Color.GRAY) //设置选中幕布上下边框颜色
        .setCurtainColor(Color.WHITE) //设置选中幕布颜色
        .setItemTextColor(Color.GRAY) // 设置数据的颜色
        .setSelectedItemTextColor(Color.BLACK) //设置选中的数据颜色
        .setScrollBgColor(Color.WHITE) // 设置滚动组件的颜色
        .setYearRangeStart(1972)   // 设置开始年份
        .setYearRangeEnd(2025)     // 设置结束年份
        .setOnItemSelectedListener(MyOnItemSelectedListener())
    }

    func build() {
        Column() {
            Flex(FlexParams(
                    direction: FlexDirection.Column,
                    alignItems: ItemAlign.Center,
                    justifyContent: FlexAlign.Center
                )) {
                WheelYearPicker(model: this.showWheelYearPicker)
            }.width(100.percent)
        }
    }
}

public class MyOnItemSelectedListener <: OnItemSelectedListener {
     public func onItemSelected(position: Int64, data: Int64): Unit {
         PromptAction.showToast(message: "选中索引：${position}，选中值：${data}")
     }
}
```

## 5 月选择器
 
### 5.1 WheelMonthPickerModel Class API Description

月选择器数据对象

```cangjie
public class WheelMonthPickerModel {
    /**
     * 月选择器数据对象初始化
     */
    public init() {}
    
    /**
     * 设置滚动选择器背景颜色，默认 Color.WHITE
     * 
     * 参数 scrollBgColor - 滚动选择器背景颜色
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setScrollBgColor(scrollBgColor: Color): WheelMonthPickerModel

    /**
     * 首次显示数据项索引
     * 
     * 参数 FirstSelectPosition - 首次显示数据项索引
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setFirstSelectedItemPosition(FirstSelectPosition: Int64): WheelMonthPickerModel

    /**
     * 获取选中项份的索引。
     * 
     * 返回 Int64 - 选中项份的索引
     */
    public func getSelectedItemPosition(): Int64

    /**
     * 获取当前选择的位置索引
     * 
     * 返回 Int64 - 当前选择的位置索引
     */
    public func getCurrentItemPosition(): Int64 

    /**
     * 获取当前选择的数据
     * 
     * 返回 String - 当前选择的数据
     */
    public func getCurrentItemData(): String

    /**
     * 设置文本数据高度，默认 30.0
     * 
     * 参数 mTextHeight - 文本数据高度
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setTextHeight(mTextHeight: Float64): WheelMonthPickerModel

    /**
     * 获取文本数据的高度。
     * 
     * 返回 Float64 - 文本数据的高度
     */ 
    public func getTextHeight(mTextHeight: Float64): Float64 

    /**
     * 设置滚动选择器可见个数，默认 9，若设置的个数 > 总数据 / 2 ,count 默认为 总数据 /2
     * 
     * 参数 count - 滚动选择器可见个数
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setVisibleItemCount(count: Int64): WheelMonthPickerModel

    /**
     * 获取滚动选择器可见个数。
     * 
     * 返回 Int64 - 滚动选择器可见个数
     */
    public func getVisibleItemCount(): Int64 

    /**
     * 获取滚轮行的高度。
     * 
     * 返回 Float64 - 滚轮行的高度
     */
    public func getItemHeight(): Float64

    /**
     * 设置是否循环展示，默认 false
     * 
     * 参数 isCyslic - 是否循环展示
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setCyclic(isCyslic: Bool): WheelMonthPickerModel

    /**
     * 获取是否循环展示
     * 
     * 返回 Bool - true/false
     */
    public func isCyslicShow(): Bool

    /**
     * 设置选中数据的颜色，默认 Color(0x00ff0000)
     * 
     * 参数 color - 选中数据的颜色
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setSelectedItemTextColor(color: Color): WheelMonthPickerModel

    /**
     * 获取选中项的颜色
     * 
     * 返回 Color - 选中项的颜色
     */
    public func getSelectedItemTextColor(): Color 

    /**
     * 设置文本数据的颜色，默认 Color(0x536D8A)
     * 
     * 参数 color - 文本数据的颜色
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setItemTextColor(color: Color): WheelMonthPickerModel

    /**
     * 获取文本颜色。
     * 
     * 返回 Color - 文本颜色
     */
    public func getItemTextColor(): Color

    /**
     * 设置文本数据的大小，默认 16
     * 
     * 参数 size - 文本数据的大小
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setItemTextSize(size: Float64): WheelMonthPickerModel
    
    /**
     * 设置滚轮选择器是否有空气感
     * 
     * 参数 hasAtmospheric - true(是空气感)/false(不是空气感)
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setAtmospheric(hasAtmospheric: Bool): WheelMonthPickerModel
    
    /**
     * 设置空气感渐变颜色
     * 
     * 参数 atmosphericColor - 渐变颜色数组
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setAtmosphericColor(atmosphericColor: Array<(Color, Float64)>): WheelMonthPickerModel
    
    /**
     * 是否设置了空气感
     *
     * 返回 Bool - true/false
     */
    public func hasAtmosphericShow(): Bool
    
    /**
     * 获取文本字体大小。
     * 
     * 返回 Float64 - 文本字体大小
     */
    public func getItemTextSize(): Float64
    
    /**
     * 设置列表数据上下间隔，默认 8.0
     * 
     * 参数 space - 列表数据上下间隔
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setItemSpace(space: Float64): WheelMonthPickerModel

    /**
     * 获取列表数据上下间隔。
     * 
     * 返回 Float64 - 列表数据上下间隔
     */
    public func getItemSpace(): Float64

    /**
     * 是否设置选中指示器，默认 true
     * 
     * 参数 hasIndicator - true:设置，flase:不设置
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setIndicator(hasIndicator: Bool): WheelMonthPickerModel

    /**
     * 获取是否设置了指示器。
     * 
     * 返回 Bool - true/false
     */
    public func hasIndicatorDivide(): Bool

    /**
     * 设置选中指示器上下边框的大小，默认 2
     * 
     * 参数 size - 选中指示器上下边框的大小
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setIndicatorSize(size: Float64): WheelMonthPickerModel

    /**
     * 获取指示器上下边框大小。
     * 
     * 返回 Float64 - 指示器上下边框大小
     */
    public func getIndicatorSize(): Float64 

    /**
     * 设置选中指示器上下边框的颜色，默认 Color.RED
     * 
     * 参数 color - 选中指示器上下边框的颜色
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setIndicatorColor(color: Color): WheelMonthPickerModel

    /**
     * 获取指示器上下边框的颜色。
     *  
     * 返回 Color - 指示器上下边框的颜色
     */
    public func getIndicatorColor(): Color

    /**
     * 设置选中幕布颜色，默认 Color.WHITE
     * 
     * 参数 color - 选中幕布颜色
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setCurtainColor(color: Color): WheelMonthPickerModel

    /**
     * 获取幕布颜色。
     * 
     * 返回 Color - 幕布颜色
     */
    public func getCurtainColor(): Color
    
    /**
     * 设置文本数据对齐方式，默认 HorizontalAlign.Center
     * 
     * 参数 align - 文本数据对齐方式，默认居中对齐
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setItemAlign(align: HorizontalAlign): WheelMonthPickerModel

    /**
     * 获取文本数据对齐方式。
     * 
     * 返回 HorizontalAlign - 文本数据对齐方式
     */
    public func getItemAlign(): HorizontalAlign

    /**
     * 设置文本数据字体样式
     * 
     * 参数 fontFamily - 仓颉字体样式
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setFontFamily(fontFamily: String): WheelMonthPickerModel

    /**
     * 获取文本数据的字体样式。
     * 
     * 返回 String - 文本数据的字体样式
     */
    public func getFontFamily(): String


    /**
     * 设置选项的初始位置，默认 0
     * 
     * 参数 SelectPosition - 选项的初始位置
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setSelectedItemPosition(SelectPosition: Int64) :WheelMonthPickerModel

    /**
     * 设置月选择器监听事件
     * 
     * 参数 listener - 监听事件
     * 返回 WheelMonthPickerModel - 月选择器数据对象
     */
    public func setOnItemSelectedListener(listener: ?OnItemSelectedListener): WheelMonthPickerModel
}

```

### 5.2 WheelMonthPicker Component API Descriptio

月选择器组件

```cangjie
@Component
public class WheelMonthPicker {
    @State
    var model: WheelMonthPickerModel = WheelMonthPickerModel()
}
```
### 5.3 示例

```cangjie

import wheelpicker.*

internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.router.*
import ohos.prompt_action.*


@Entry
@Component
class MyWheelMonthPicker {
    @State
    var showWheelMonthPicker: WheelMonthPickerModel = WheelMonthPickerModel()

    protected override func aboutToAppear() {
       this.showWheelMonthPicker = this.showWheelMonthPicker
        .setItemTextSize(15.0)
        .setTextHeight(30.0)
        .setVisibleItemCount(9)
        .setItemAlign(HorizontalAlign.Center)
        .setIndicatorColor(Color.GRAY) //设置选中幕布上下边框颜色
        .setCurtainColor(Color.WHITE) //设置选中幕布颜色
        .setItemTextColor(Color.GRAY) // 设置数据的颜色
        .setSelectedItemTextColor(Color.BLACK) //设置选中的数据颜色
        .setScrollBgColor(Color.WHITE) // 设置滚动组件的颜色
        .setOnItemSelectedListener(MyOnItemSelectedListener())
        .setCyclic(true)
    }

    func build() {
        Column() {
            Flex(FlexParams(
                    direction: FlexDirection.Column,
                    alignItems: ItemAlign.Center,
                    justifyContent: FlexAlign.Center
                )) {
                WheelMonthPicker(model: this.showWheelMonthPicker)
            }.width(100.percent)
        }
    }
}
```

## 6 日选择器

### 6.1 WheelDayPickerModel Class API Description

日选择器数据对象

```cangjie
public class WheelDayPickerModel {
    /**
     * 日日选择器数据对象初始化
     */
    public init()

    /**
     * 设置年和月，年份 <= 0，默认 1949；月份 <= 0 默认 1
     * 
     * 参数 year - 年份
     * 参数 month - 月份
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */
    public func setYearAndMonth(year: Int64, month: Int64): WheelDayPickerModel
    
    /**
     * 设置滚动选择器背景颜色，默认 Color.WHITE
     * 
     * 参数 scrollBgColor - 滚动选择器背景颜色
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */
    public func setScrollBgColor(scrollBgColor: Color): WheelDayPickerModel

    /**
     * 获取当前选择的位置索引
     * 
     * 返回 Int64 - 当前选择的位置索引
     */
    public func getCurrentItemPosition(): Int64

    /**
     * 获取当前选择的数据
     * 
     * 返回 String - 当前选择的数据
     */
    public func getCurrentItemData(): String

    /**
     * 设置文本数据高度，默认 30.0
     * 
     * 参数 mTextHeight - 文本数据高度
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */
    public func setTextHeight(mTextHeight: Float64): WheelDayPickerModel

    /**
     * 获取文本数据的高度。
     * 
     * 返回 Float64 - 文本数据的高度
     */ 
    public func getTextHeight(mTextHeight: Float64): Float64 

    /**
     * 设置滚动选择器可见个数，默认 9，若设置的个数 > 总数据 / 2 ,count 默认为 总数据 /2
     * 
     * 参数 count - 滚动选择器可见个数
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */
    public func setVisibleItemCount(count: Int64): WheelDayPickerModel

    /**
     * 获取滚动选择器可见个数。
     * 
     * 返回 Int64 - 滚动选择器可见个数
     */
    public func getVisibleItemCount(): Int64
    
    /**
     * 获取滚轮行的高度。
     * 
     * 返回 Float64 - 滚轮行的高度
     */
    public func getItemHeight(): Float64 

    /**
     * 设置是否循环展示，默认 false
     * 
     * 参数 isCyslic - 是否循环展示
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */
    public func setCyclic(isCyslic: Bool): WheelDayPickerModel 
    
    /**
     * 设置滚轮选择器是否有空气感
     * 
     * 参数 hasAtmospheric - true(是空气感)/false(不是空气感)
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */
    public func setAtmospheric(hasAtmospheric: Bool): WheelDayPickerModel
    
    /**
     * 设置空气感渐变颜色
     * 
     * 参数 atmosphericColor - 渐变颜色数组
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */
    public func setAtmosphericColor(atmosphericColor: Array<(Color, Float64)>): WheelDayPickerModel
    
    /**
     * 是否设置了空气感
     *
     * 返回 Bool - true/false
     */
    public func hasAtmosphericShow(): Bool
    
    /**
     * 获取是否循环展示
     * 
     * 返回 Bool - true/false
     */
    public func isCyslicShow(): Bool

    /**
     * 设置选中数据的颜色，默认 Color(0x00ff0000)
     * 
     * 参数 color - 选中数据的颜色
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */
    public func setSelectedItemTextColor(color: Color): WheelDayPickerModel

    /**
     * 获取选中项的颜色
     * 
     * 返回 Color - 选中项的颜色
     */
    public func getSelectedItemTextColor(): Color

    /**
     * 设置文本数据的颜色，默认 Color(0x536D8A)
     * 
     * 参数 color - 文本数据的颜色
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */
    public func setItemTextColor(color: Color): WheelDayPickerModel 

    /**
     * 获取文本颜色。
     * 
     * 返回 Color - 文本颜色
     */
    public func getItemTextColor(): Color

    /**
     * 设置文本数据的大小，默认 16
     * 
     * 参数 size - 文本数据的大小
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */
    public func setItemTextSize(size: Float64): WheelDayPickerModel 

    /**
     * 获取文本字体大小。
     * 
     * 返回 Float64 - 文本字体大小
     */
    public func getItemTextSize(): Float64
    
    /**
     * 设置列表数据上下间隔，默认 8.0
     * 
     * 参数 space - 列表数据上下间隔
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */
    public func setItemSpace(space: Float64): WheelDayPickerModel

    /**
     * 获取列表数据上下间隔。
     * 
     * 返回 Float64 - 列表数据上下间隔
     */
    public func getItemSpace(): Float64

    /**
     * 是否设置选中指示器，默认 true
     * 
     * 参数 hasIndicator - true:设置，flase:不设置
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */
    public func setIndicator(hasIndicator: Bool): WheelDayPickerModel

    /**
     * 获取是否设置了指示器。
     * 
     * 返回 Bool - true/false
     */
    public func hasIndicatorDivide(): Bool

    /**
     * 设置选中指示器上下边框的大小，默认 2
     * 
     * 参数 size - 选中指示器上下边框的大小
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */
    public func setIndicatorSize(size: Float64): WheelDayPickerModel

    /**
     * 获取指示器上下边框大小。
     * 
     * 返回 Float64 - 指示器上下边框大小
     */
    public func getIndicatorSize(): Float64

    /**
     * 设置选中指示器上下边框的颜色，默认 Color.RED
     * 
     * 参数 color - 选中指示器上下边框的颜色
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */
    public func setIndicatorColor(color: Color): WheelDayPickerModel

    /**
     * 获取指示器上下边框的颜色。
     *  
     * 返回 Color - 指示器上下边框的颜色
     */
    public func getIndicatorColor(): Color

    /**
     * 设置选中幕布颜色，默认 Color.WHITE
     * 
     * 参数 color - 选中幕布颜色
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */
    public func setCurtainColor(color: Color): WheelDayPickerModel 

    /**
     * 获取幕布颜色。
     * 
     * 返回 Color - 幕布颜色
     */
    public func getCurtainColor(): Color
    
    /**
     * 设置文本数据对齐方式，默认 HorizontalAlign.Center
     * 
     * 参数 align - 文本数据对齐方式，默认居中对齐
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */
    public func setItemAlign(align: HorizontalAlign): WheelDayPickerModel 

    /**
     * 获取文本数据对齐方式。
     * 
     * 返回 HorizontalAlign - 文本数据对齐方式
     */
    public func getItemAlign(): HorizontalAlign

    /**
     * 设置文本数据字体样式
     * 
     * 参数 fontFamily - 仓颉字体样式
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */
    public func setFontFamily(fontFamily: String): WheelDayPickerModel

    /**
     * 获取文本数据的字体样式。
     * 
     * 返回 String - 文本数据的字体样式
     */
    public func getFontFamily(): String

    /**
     * 设置选项的初始位置，默认 0,若 < 0 ,默认 为 0
     * 
     * 参数 SelectPosition - 选项的初始位置
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */    
    public func setSelectedItemPosition(SelectPosition: Int64): WheelDayPickerModel

    /**
     * 设置日选择器监听事件
     * 
     * 参数 listener - 监听事件
     * 返回 WheelDayPickerModel - 日选择器数据对象
     */
    public func setOnItemSelectedListener(listener: ?OnItemSelectedListener): WheelDayPickerModel
}

```
### 6.2 WheelDayPicker Component API Description

日选择器组件

```cangjie
@Component
public class WheelDayPicker {
    @State
    var model: WheelDayPickerModel = WheelDayPickerModel()
}
```
### 6.3 示例

```cangjie
import wheelpicker.*

internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.router.*
import ohos.prompt_action.*


@Entry
@Component
class MyWheelDayPicker {
    @State
    var showWheelDayPicker: WheelDayPickerModel = WheelDayPickerModel()

    protected override func aboutToAppear() {
       this.showWheelDayPicker = this.showWheelDayPicker
        .setItemTextSize(15.0)
        .setTextHeight(30.0)
        .setVisibleItemCount(9)
        .setItemAlign(HorizontalAlign.Center)
        .setIndicatorColor(Color.GRAY) //设置选中幕布上下边框颜色
        .setCurtainColor(Color.WHITE) //设置选中幕布颜色
        .setItemTextColor(Color.GRAY) // 设置数据的颜色
        .setSelectedItemTextColor(Color.BLACK) //设置选中的数据颜色
        .setScrollBgColor(Color.WHITE) // 设置滚动组件的颜色
        .setOnItemSelectedListener(MyOnItemSelectedListener())
        .setCyclic(false)
        .setYearAndMonth(2024, 2)

    }

    func build() {
        Column() {
            Flex(FlexParams(
                    direction: FlexDirection.Column,
                    alignItems: ItemAlign.Center,
                    justifyContent: FlexAlign.Center
                )) {
                WheelDayPicker(model: this.showWheelDayPicker)
            }.width(100.percent)
        }
    }
}
```

## 7 滚轮选择器数据项时回调监听

### 7.1 OnItemSelectedListener Class API Description

滚轮选择器数据项时回调监听

```cangjie
public class OnItemSelectedListener {
    
    /**
     * 选择器监听事件
     * 
     * 参数 position - 选择器索引
     * 参数 data - 选中的数据
     * 返回 Unit
     */
    public func onItemSelected(position: Int64, data: Int64): Unit
}
```







