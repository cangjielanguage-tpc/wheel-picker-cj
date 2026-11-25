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
        .setData(this.arr)
        .setItemTextSize(15.0)
        .setTextHeight(30.0)
        .setVisibleItemCount(9)
        .setItemAlign(HorizontalAlign.End)
        .setIndicatorColor(Color.RED)
        .setCurtainColor(Color.WHITE)
        .setItemTextColor(Color.GRAY) // 设置数据的颜色
        .setSelectedItemTextColor(Color.GREEN)
        .setScrollBgColor(Color.WHITE) // 设置滚动组件的颜色
        .setOnItemSelectedListener(MyOnItemSelectedListener1())
        .setCyclic(false)
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
                Button("go to:Wheel Picker").id("MyWheelPicker")
                .height(70)
                .padding(10)
                .fontSize(24)
                .margin(bottom: 10)
                .onClick({
                        =>
                        this.showWheelPickerLeft.setSelectedItemPosition(this.randomNumber)
                        this.showWheelPickerRight.setSelectedItemPosition(this.randomNumber)
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

public class MyOnItemSelectedListener1 <: OnSelectedListener {
     public func onItemSelected(position: Int64, data: String): Unit {
         PromptAction.showToast(message: "选中索引：${position}，选中值：${data}")
     }
}

public class MyOnItemSelectedListener2 <: OnSelectedListener {
     public func onItemSelected(position: Int64, data: String): Unit {
         PromptAction.showToast(message: "选中索引：${position}，选中值：${data}")
     }
}

public class MyOnItemSelectedListener3 <: OnSelectedListener {
     public func onItemSelected(position: Int64, data: String): Unit {
         PromptAction.showToast(message: "选中索引：${position}，选中值：${data}")
     }
}
