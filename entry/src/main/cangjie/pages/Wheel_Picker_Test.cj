/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package ohos_app_cangjie_entry.pages

import wheelpicker.*
internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos_app_cangjie_entry.RouterType
import ohos.router.Router

@Entry
@Component
class WheelPickerTest {
    var sample: Array<RouterType> = [
         RouterType("WheelPicker Test", "MyWheelPicker") ,
         RouterType("WheelPicker Test1", "MyWheelPicker1" ),
         RouterType("WheelPicker Test2", "MyWheelPicker2" ),
         RouterType("WheelPicker Test3", "MyWheelPicker3" )
  ]

    func build() {
        Stack(Alignment.TopStart){
            Column() {
                Text("WheelPicker 示例")
                .fontSize(15)
                .width(100.percent)
                .textAlign(TextAlign.Center)
                .fontColor(Color.WHITE)
                .height(50)
                .backgroundColor(Color(0x666060)).margin(bottom: 10)

                List( space: 20, initialIndex: 0 ) {
                    ForEach(this.sample, itemGeneratorFunc: {item: RouterType, count:Int64 =>
                        ListItem() {
                            Text("${item.title}")
                            .width(100.percent).height(50).fontSize(16)
                            .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
                             .onClick({ _ =>
                                Router.push(url: item.page)
                            })
                         }.id("${count}")
                    })
                }.id("list")
                .listDirection(Axis.Vertical)
                .scrollBar(BarState.Off)
                .divider(strokeWidth: 2.px, color: Color(0xFFFFFF), startMargin: 10.px, endMargin: 10.px) // 每行之间的分界线
                .edgeEffect(EdgeEffect.Spring)
                .onScrollIndex({firstIndex: Int32, lastIndex: Int32 =>
                        BaseLog.info("first" + firstIndex.toString())
                        BaseLog.info("last" + lastIndex.toString())
                      })
                .width(90.percent)

                }
            .width(100.percent)
            .height(100.percent)
            .backgroundColor(0xDCDCDC)
            .padding(top: 5.px )
        }
    }
}
