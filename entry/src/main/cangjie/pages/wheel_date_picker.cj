/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package ohos_app_cangjie_entry.pages

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
//        .setSelectedYear(5) //设置选择年份索引
//        .setSelectedMonth(1) //设置选择月份索引
//        .setSelectedDay(15) //设置选择日索引
        //.setLinearGradientColor([(Color.WHITE, 0.0),(Color(0xf3e5f5), 0.3), (Color(0xffffff), 0.5)])

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
