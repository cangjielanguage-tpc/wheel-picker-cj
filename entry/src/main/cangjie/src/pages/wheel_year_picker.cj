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
class MyWheelYearPicker {
    @State
    var showWheelYearPicker: WheelYearPickerModel = WheelYearPickerModel()

    protected override func aboutToAppear() {
       this.showWheelYearPicker = this.showWheelYearPicker
        .setAtmospheric(true)
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
        .setAtmospheric(true)
        .setOnItemSelectedListener(MyOnItemSelectedListener())
        //.setCyclic(true)
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

class MyOnItemSelectedListener <: OnItemSelectedListener {
     public func onItemSelected(picker: WheelYearPickerModel, position: Int64, data: Int64): Unit {
         PromptAction.showToast(message: "选中索引：${position}，选中年份：${data}")
     }
}