/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package wheelpicker

import ohos.state_manage.*
import ohos.state_macro_manage.*

@Component
public class WheelAreaPicker {
    @Link
    var model: WheelAreaPickerModel = WheelAreaPickerModel()
    @State
    var provinceArray: ArrayList<Province> = initializeProvinceOnStartup()
    private var scrollerProvince: Scroller = Scroller()
    private var scrollerCity: Scroller = Scroller()
    private var scrollerArea: Scroller = Scroller()
    private var scrollerProvinceSelected: Scroller = Scroller()
    private var scrollerCitySelected: Scroller = Scroller()
    private var scrollerAreaSelected: Scroller = Scroller()
    private var lastProvincePosition: Float64 = 0.0
    private var lastCityPosition: Float64 = 0.0
    private var lastAreaPosition: Float64 = 0.0

    @State
    @Watch[scrollerProvinceIndexChange]
    var scrollerProvinceIndex: Int64 = 0
    func scrollerProvinceIndexChange() {
        if (this.scrollerProvinceIndex > this.provinceArray.size - 1) {
            this.scrollerProvinceIndex = this.provinceArray.size - 1
        }
    }

    @State
    @Watch[scrollerCityIndexChange]
    var scrollerCityIndex: Int64 = 0
    func scrollerCityIndexChange() {
        if (this.scrollerProvinceIndex > this.provinceArray.size - 1) {
            this.scrollerProvinceIndex = this.provinceArray.size - 1
        }
        if (this.scrollerCityIndex > this.provinceArray[this.scrollerProvinceIndex].cityAndArea.size - 1) {
            this.scrollerCityIndex = this.provinceArray[this.scrollerProvinceIndex].cityAndArea.size - 1
        }
    }

    @State
    @Watch[scrollerAreaIndexChange]
    var scrollerAreaIndex: Int64 = 0
    func scrollerAreaIndexChange() {
        if (this.scrollerProvinceIndex > this.provinceArray.size - 1) {
            this.scrollerProvinceIndex = this.provinceArray.size - 1
        }
        if (this.scrollerCityIndex > this.provinceArray[this.scrollerProvinceIndex].cityAndArea.size - 1) {
            this.scrollerCityIndex = this.provinceArray[this.scrollerProvinceIndex].cityAndArea.size - 1
        }
        if (this.scrollerAreaIndex >
            this.provinceArray[this.scrollerProvinceIndex].cityAndArea[this.scrollerCityIndex].area.size - 1) {
            this.scrollerAreaIndex = this.provinceArray[this.scrollerProvinceIndex].cityAndArea[this.scrollerCityIndex].
                area.size - 1
        }
    }

    @State
    var cityArrayState: ArrayList<String> = ArrayList<String>()

    @State
    var cityAndAreaState: ArrayList<CityAndArea> = (ArrayList<CityAndArea>())

    @State
    var AreaArrayState: Array<String> = []

    @Builder
    func occupyText() {
        ForEach(
            Array(this.model.mHalfItemCount, repeat: 0),
            itemGeneratorFunc: {
                _: Int64, _: Int64 =>
                    Text("")
                    .fontSize(this.model.mItemTextSize)
                    .height(this.model.mItemHeight)
                    .padding(this.model.mSpace)
            }
        )
    }

    protected override func aboutToAppear() {
        this.model.updateVisibleItemCount1()
        this.scrollerProvinceIndex = (this.model.mFirstSelectPosition)

        this.cityAndAreaState = (this.provinceArray[this.scrollerProvinceIndex].cityAndArea)
        for (i in this.cityAndAreaState) {
            this.cityArrayState.add(i.cityName)
        }
        this.AreaArrayState = this.provinceArray[this.scrollerProvinceIndex].cityAndArea[0].area

        Timer.once(
            Duration.millisecond * 100,
            {
                =>
                this.scrollerProvince.scrollTo(
                    xOffset: 0.0,
                    yOffset: this.model.mItemHeight * Float64(this.scrollerProvinceIndex)
                )
                this.scrollerCity.scrollTo(
                    xOffset: 0.0,
                    yOffset: 0.0
                )
                this.scrollerArea.scrollTo(
                    xOffset: 0.0,
                    yOffset: 0.0
                )

            }
        )
        return
    }

    func build() {
        Row() {
            //-------------------------------------Province---------------------------------------
            Stack() {
                Scroll(this.scrollerProvince) {
                    scrollerProvince4()
                }.height(this.model.mWheelHeight)
                .backgroundColor(this.model.scrollBgColor)
                .scrollBar(BarState.Off)
                .zIndex(1)
                .onScroll({
                   offset => onScrollProvinceCityArea(offset)})
                .onScrollEnd({
                   => onScrollEndProvince()})
                .onScrollEdge({
                   edge => onScrollEdgeProvince(edge)})
                isHasIndicator()
                scrollerProvince2()
                isHasAtmospheric()
            }.width(30.percent)
            //-------------------------------------City---------------------------------------------
            Stack() {
                Scroll(this.scrollerCity) {
                    scrollerCity4()
                }.height(this.model.mWheelHeight)
                .backgroundColor(this.model.scrollBgColor)
                .scrollBar(BarState.Off)
                .zIndex(1)
                .onScroll({
                  offset => onScrollProvinceCityArea(offset)})
                .onScrollEnd({
                  => onScrollEndCity()})
                .onScrollEdge({
                  edge => onScrollEdgeCity(edge)})
                isHasIndicator()
                scrollerCity2()
                isHasAtmospheric()
            }.width(30.percent)
            //---------------------------------------------------Area-----------------------------------
            if (!this.model.mHideArea) {
                Stack() {
                    Scroll(this.scrollerArea) {
                        scrollerArea4()
                    }.height(this.model.mWheelHeight)
                    .backgroundColor(this.model.scrollBgColor)
                    .scrollBar(BarState.Off)
                    .zIndex(1)
                    .onScroll({
                       offset => onScrollProvinceCityArea(offset)})
                    .onScrollEnd({
                       => onScrollEndArea()})
                    .onScrollEdge({
                      edge => onScrollEdgeArea(edge)})
                    isHasIndicator()
                    scrollerArea2()
                    isHasAtmospheric()
                }.width(30.percent)
            }
        }
    }

    func onScrollEdgeProvince(edge: Edge){
        this.scrollerProvinceIndex = Int64(this.scrollerProvince.currentOffset().yOffset / this.model.
                mItemHeight)
        // 防止滚到到边缘 onScrollEnd回调函数不触发
        this.cityAndAreaState = (this.provinceArray[this.scrollerProvinceIndex].cityAndArea)
        this.AreaArrayState = this.provinceArray[this.scrollerProvinceIndex].cityAndArea[0].getArea()
    }

    func onScrollEdgeCity(edge: Edge){
        this.scrollerCityIndex = Int64(this.scrollerCity.currentOffset().yOffset / this.model.mItemHeight)
        this.AreaArrayState = this.provinceArray[this.scrollerProvinceIndex].cityAndArea[this.scrollerCityIndex].area
    }

    func onScrollEdgeArea(edge: Edge){
        this.scrollerAreaIndex = Int64(this.scrollerArea.currentOffset().yOffset / this.model.mItemHeight)
    }

    func onScrollProvinceCityArea(offset: OffsetResult){
        let mOffset: Float64 = this.scrollerProvince.currentOffset().yOffset
        this.model.mHalfItemCount = (this.model.mVisibleItem - 1) / 2
        this.lastProvincePosition = if (offset.yOffset == 0.0) {
            this.lastProvincePosition
        } else {
            offset.yOffset
        }
        this.scrollerProvinceSelected.scrollTo(
            xOffset: 0.0,
            yOffset: mOffset,
        )
    }

    @Builder
    func isHasIndicator() {
        if (this.model.hasIndicator) {
            Divider()
            .offset(x: 0.0, y: -this.model.mItemHeight / 2.0)
            .color(this.model.mIndicatorColor)
            .width(100.percent)
            .strokeWidth(this.model.mIndicatorSize)
            .zIndex(2)
            Divider()
            .offset(x: 0.0, y: this.model.mItemHeight / 2.0)
            .color(this.model.mIndicatorColor)
            .width(100.percent)
            .strokeWidth(this.model.mIndicatorSize)
            .zIndex(2)
        }
    }

    @Builder
    func isHasAtmospheric() {
        if (this.model.hasAtmospheric) {
            Flex(FlexParams())
                .width(30.percent)
                .linearGradient(
                    direction: GradientDirection.Top,
                    colors: this.model.atmosphericColor,
                    repeating: false
            ).height(this.model.mWheelHeight)
            .zIndex(3)
            .opacity(0.1)
            .height(this.model.mItemHeight)
        }
    }

    @Builder
    func scrollerProvince2() {
        Column() {
            Scroll(this.scrollerProvinceSelected) {
                Column() {
                    ForEach(
                        this.provinceArray,
                        itemGeneratorFunc: {
                            provinceItem: Province, _: Int64 =>
                                Text(provinceItem.provinceName)
                                .fontFamily(this.model.mFontFamily)
                                .padding(this.model.mSpace)
                                .height(this.model.mItemHeight)
                                .fontColor(this.model.mSelectedItemTextColor)
                                .fontSize(this.model.mItemTextSize)
                        }
                    )
                }.width(100.percent).alignItems(this.model.mAlign)
            }.height(this.model.mItemHeight)
            .scrollBar(BarState.Off)
            .enabled(false)
            .backgroundColor(this.model.scrollBgColor)
        }.backgroundColor(Color.RED).zIndex(2)
    }

    @Builder
    func scrollerCity2() {
        Column() {
            Scroll(this.scrollerCitySelected) {
                Column() {
                    ForEach(
                        this.cityArrayState,
                        itemGeneratorFunc: {
                            val: String, _: Int64 => if (val.size > 5) {
                                Text(val)
                                .padding(this.model.mSpace)
                                .fontSize(this.model.mItemTextSize * 3 / 4)
                                .height(this.model.mItemHeight)
                                .fontColor(this.model.mSelectedItemTextColor)
                                .fontFamily(this.model.mFontFamily)
                            } else {
                                Text(val)
                                .fontSize(this.model.mItemTextSize)
                                .height(this.model.mItemHeight)
                                .fontColor(this.model.mSelectedItemTextColor)
                                .padding(this.model.mSpace)
                                .fontFamily(this.model.mFontFamily)
                            }
                        }
                    )
                }.width(100.percent).alignItems(this.model.mAlign)
            }.height(this.model.mItemHeight)
            .backgroundColor(this.model.scrollBgColor)
            .enabled(false)
            .scrollBar(BarState.Off)
        }.zIndex(2)
        .backgroundColor(Color.RED)
    }

    @Builder
    func scrollerArea2() {
        Column() {
            Scroll(this.scrollerAreaSelected) {
                Column() {
                    ForEach(
                        this.AreaArrayState,
                        itemGeneratorFunc: {
                            area: String, _: Int64 => if (area.size > 5) { //长度超过5，设置更小字体
                                Text(area).fontFamily(this.model.mFontFamily)
                                .fontSize(this.model.mItemTextSize * 3 / 4)
                                .height(this.model.mItemHeight)
                                .padding(this.model.mSpace)
                                .fontColor(this.model.mSelectedItemTextColor)
                            } else {
                                Text(area)
                                .fontColor(this.model.mSelectedItemTextColor)
                                .height(this.model.mItemHeight)
                                .fontSize(this.model.mItemTextSize)
                                .fontFamily(this.model.mFontFamily)
                                .padding(this.model.mSpace)
                            }
                        }
                    )
                }.width(100.percent).alignItems(this.model.mAlign)
            }.height(this.model.mItemHeight)
            .enabled(false)
            .backgroundColor(this.model.scrollBgColor)
            .scrollBar(BarState.Off)
        }.zIndex(2)
        .backgroundColor(Color.RED)
    }

    @Builder
    func scrollerProvince4() {
        Column() {
            this.occupyText()
            ForEach(
                this.provinceArray,
                itemGeneratorFunc: {
                    provinceItem: Province, _: Int64 =>
                        Text("${provinceItem.provinceName}")
                        .fontSize(this.model.mItemTextSize)
                        .height(this.model.mItemHeight)
                        .fontColor(this.model.mItemTextColor)
                        .fontFamily(this.model.mFontFamily)
                        .padding(this.model.mSpace)
                }
            )

            this.occupyText()
        }.width(100.percent)
        .alignItems(this.model.mAlign)
    }

    @Builder
    func scrollerCity4() {
        Column() {
            this.occupyText()
            ForEach(
                this.cityArrayState,
                itemGeneratorFunc: {
                    val: String, _: Int64 => if (val.size > 5) {
                        Text("${val}").fontFamily(this.model.mFontFamily)
                        .fontSize(this.model.mItemTextSize * 3 / 4)
                        .height(this.model.mItemHeight)
                        .fontColor(this.model.mItemTextColor)
                        .padding(this.model.mSpace)
                    } else {
                        Text("${val}").padding(this.model.mSpace)
                        .fontSize(this.model.mItemTextSize)
                        .height(this.model.mItemHeight)
                        .fontColor(this.model.mItemTextColor)
                        .fontFamily(this.model.mFontFamily)
                    }
                }
            )
            this.occupyText()
        }.width(100.percent).alignItems(this.model.mAlign)
    }

    @Builder
    func scrollerArea4() {
        Column() {
            this.occupyText()
            ForEach(
                this.AreaArrayState,
                itemGeneratorFunc: {
                    area: String, _: Int64 => if (area.size > 5) { //长度超过5，设置更小字体
                        Text(area).height(this.model.mItemHeight)
                        .fontSize(this.model.mItemTextSize * 3 / 4)
                        .fontColor(this.model.mItemTextColor)
                        .fontFamily(this.model.mFontFamily)
                        .padding(this.model.mSpace)
                    } else {
                        Text(area).fontColor(this.model.mItemTextColor)
                        .fontSize(this.model.mItemTextSize)
                        .height(this.model.mItemHeight)
                        .fontFamily(this.model.mFontFamily)
                        .padding(this.model.mSpace)
                    }
                }
            )
            this.occupyText()
        }.width(100.percent).alignItems(this.model.mAlign)
    }

    func onScrollEndProvince(){
        let scrollOffset = ((this.scrollerProvince.currentOffset().yOffset) % (this.model.mItemHeight))
        onScrollEndProvince1(scrollOffset)
        this.cityAndAreaState = (this.provinceArray[this.scrollerProvinceIndex].cityAndArea)
        this.cityArrayState = ArrayList<String>()
        for (i in this.cityAndAreaState) {
            this.cityArrayState.add(i.cityName)
        }
        this.AreaArrayState = this.provinceArray[this.scrollerProvinceIndex].cityAndArea[0].area
        this.model.mProvinceName = this.provinceArray[this.scrollerProvinceIndex].provinceName
        this.model.mCityName = this.cityAndAreaState[0].cityName
        this.model.mAreaName = this.AreaArrayState[0]
        if(let Some(mOnAreaSelectedListener) <- this.model.mOnAreaSelectedListener) {
            mOnAreaSelectedListener.onProvinceSelected(this.scrollerProvinceIndex, this.model.mProvinceName)
        }
        this.model.setOnAreaSelectedListener
    }

    func onScrollEndCity(){
        let scrollOffset = Float64(Int64(this.scrollerCity.currentOffset().yOffset) % Int64(this.model.
                    mItemHeight))
        onScrollEndCity1(scrollOffset)
        this.AreaArrayState = this.provinceArray[this.scrollerProvinceIndex].cityAndArea[this.
                scrollerCityIndex].area

        this.model.mProvinceName = this.provinceArray[this.scrollerProvinceIndex].provinceName
        this.model.mCityName = this.cityAndAreaState[this.scrollerCityIndex].cityName
        this.model.mAreaName = this.AreaArrayState[0]

        if(let Some(mOnAreaSelectedListener) <- this.model.mOnAreaSelectedListener) {
            mOnAreaSelectedListener.onCitySelected(this.scrollerCityIndex, this.model.mCityName,)
        }
        this.model.setOnAreaSelectedListener
    }

    func onScrollEndArea(){
        let scrollOffset = Float64(Int64(this.scrollerArea.currentOffset().yOffset) % Int64(this.
                    model.mItemHeight))
        onScrollEndArea1(scrollOffset)
        this.model.mProvinceName = this.provinceArray[this.scrollerProvinceIndex].getProvinceName()
        this.model.mCityName = this.cityAndAreaState[this.scrollerCityIndex].cityName
        this.model.mAreaName = this.AreaArrayState[this.scrollerAreaIndex]

        if(let Some(mOnAreaSelectedListener) <- this.model.mOnAreaSelectedListener) {
            mOnAreaSelectedListener.onAreaSelected(this.scrollerAreaIndex, this.model.mAreaName,)
        }
        this.model.setOnAreaSelectedListener
    }

    func onScrollEndProvince1(scrollOffset: Float64){
        if (scrollOffset > (this.model.mItemHeight / 2.0)) {
            this.scrollerProvince.scrollTo(
                xOffset: 0.0,
                yOffset: this.scrollerProvince.currentOffset().yOffset + this.model.mItemHeight -
                    scrollOffset,
                duration: 100.0,
                curve: Curve.Ease
            )
            this.scrollerProvinceIndex = Int64((this.scrollerProvince.currentOffset().yOffset -
                    scrollOffset) / this.model.mItemHeight + 1.0)
        } else if (scrollOffset > 0.0 && scrollOffset < (this.model.mItemHeight / 2.0)) {
            this.scrollerProvince.scrollTo(
                xOffset: 0.0,
                yOffset: this.scrollerProvince.currentOffset().yOffset - scrollOffset,
                duration: 100.0,
                curve: Curve.Ease
            )
            this.scrollerProvinceIndex = Int64((this.scrollerProvince.currentOffset().yOffset -
                    scrollOffset) / this.model.mItemHeight)
        }
    }

    func onScrollEndCity1(scrollOffset: Float64){
        if (scrollOffset > (this.model.mItemHeight / 2.0)) {
            this.scrollerCity.scrollTo(
                xOffset: 0.0,
                yOffset: this.scrollerCity.currentOffset().yOffset + this.model.mItemHeight -
                    scrollOffset,
                duration: 100.0,
                curve: Curve.Ease
            )
            this.scrollerCityIndex = Int64((this.scrollerCity.currentOffset().yOffset - scrollOffset) /
                    this.model.mItemHeight + 1.0)
        } else if (scrollOffset > 0.0 && scrollOffset < (this.model.mItemHeight / 2.0)) {
            this.scrollerCity.scrollTo(
                xOffset: 0.0,
                yOffset: this.scrollerCity.currentOffset().yOffset - scrollOffset,
                duration: 100.0,
                curve: Curve.Ease
            )
            this.scrollerCityIndex = Int64((this.scrollerCity.currentOffset().yOffset - scrollOffset) /
                    this.model.mItemHeight)
        }
    }

    func onScrollEndArea1(scrollOffset: Float64){
        if (scrollOffset > (this.model.mItemHeight / 2.0)) {
            this.scrollerArea.scrollTo(
                xOffset: 0.0,
                yOffset: this.scrollerArea.currentOffset().yOffset + this.model.mItemHeight -
                    scrollOffset,
                duration: 100.0,
                curve: Curve.Ease
            )
            this.scrollerAreaIndex = Int64((this.scrollerArea.currentOffset().yOffset - scrollOffset) /
                    this.model.mItemHeight + 1.0)
        } else if (scrollOffset > 0.0 && scrollOffset < (this.model.mItemHeight / 2.0)) {
            this.scrollerArea.scrollTo(
                xOffset: 0.0,
                yOffset: this.scrollerArea.currentOffset().yOffset - scrollOffset,
                duration: 100.0,
                curve: Curve.Ease
            )
            this.scrollerAreaIndex = Int64((this.scrollerArea.currentOffset().yOffset - scrollOffset) /
                    this.model.mItemHeight)
        }
    }
}
