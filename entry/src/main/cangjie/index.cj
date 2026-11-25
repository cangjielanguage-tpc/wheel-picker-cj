/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package ohos_app_cangjie_entry

internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.router.*
import wheelpicker.*

struct RouterType {
    var title: String = ""
    var page: String = ""
    public RouterType(title: String, page: String) {
        this.page = page
        this.title = title
    }
}

@Entry
@Component
class EntryView {
     var sample: Array<RouterType> = [
         RouterType("WheelPicker Test", "WheelPickerTest") ,
         RouterType("WheelAreaPicker Test", "MyWheelAreaPicker" ),
         RouterType("WheelDatePicker Test", "MyWheelDatePicker"),
         RouterType("WheelDayPicker Test", "MyWheelDayPicker") ,
         RouterType("WheelMonthPicker Test", "MyWheelMonthPicker") ,
         RouterType("WheelYearPicker Test", "MyWheelYearPicker" )
  ]

    func build() {
        Stack(Alignment.TopStart){
            Column() {
                Text("wheelPicker 示例")
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
