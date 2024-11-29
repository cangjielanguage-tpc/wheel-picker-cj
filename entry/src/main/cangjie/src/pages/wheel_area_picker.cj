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

@Entry
@Component
class MyWheelAreaPicker {
    @State
    var showWheelAreaPicker: WheelAreaPickerModel = WheelAreaPickerModel()

    protected override func aboutToAppear() {
        this.showWheelAreaPicker = this.showWheelAreaPicker
        .setAtmospheric(true)
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
