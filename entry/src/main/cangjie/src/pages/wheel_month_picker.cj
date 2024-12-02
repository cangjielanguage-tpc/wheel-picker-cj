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
class MyWheelMonthPicker {
    @State
    var showWheelMonthPicker: WheelMonthPickerModel = WheelMonthPickerModel()

    protected override func aboutToAppear() {
       this.showWheelMonthPicker = this.showWheelMonthPicker
        .setAtmospheric(true)
        .setItemTextSize(15.0)
        .setTextHeight(30.0)
        .setVisibleItemCount(9)
        .setItemAlign(HorizontalAlign.Center)
        .setIndicatorColor(Color.GRAY) //设置选中幕布上下边框颜色
        .setCurtainColor(Color.WHITE) //设置选中幕布颜色
        .setItemTextColor(Color.GRAY) // 设置数据的颜色
        .setSelectedItemTextColor(Color.BLACK) //设置选中的数据颜色
        .setScrollBgColor(Color.WHITE) // 设置滚动组件的颜色
        .setAtmospheric(true)
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
