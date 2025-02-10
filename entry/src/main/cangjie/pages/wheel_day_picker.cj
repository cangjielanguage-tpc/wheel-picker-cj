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
        //.setItemSpace(20.0)
        //this.showWheelDayPicker.setSelectedItemPosition(3)

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
