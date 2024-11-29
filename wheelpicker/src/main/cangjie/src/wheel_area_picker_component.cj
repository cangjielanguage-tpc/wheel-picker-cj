/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package wheelpicker

import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.base.Main

@Component
public class WheelAreaPicker {
    @State
    var model: WheelAreaPickerModel = WheelAreaPickerModel()

    private var provinceArray: ArrayList<Province> = initializeProvinceOnStartup()
    private var scrollerProvince: Scroller = Scroller()
    private var scrollerCity: Scroller = Scroller()
    private var scrollerArea: Scroller = Scroller()
    private var scroller1: Scroller = Scroller()
    private var scroller2: Scroller = Scroller()
    private var scroller3: Scroller = Scroller()
    private var lastProvincePosition: Float64 = 0.0
    private var lastCityPosition: Float64 = 0.0
    private var lastAreaPosition: Float64 = 0.0
    private var mHalfItemCount: Int64 = 0

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
        if (this.scrollerCityIndex > this.provinceArray[this.scrollerProvinceIndex].getCityAndArea().size - 1) {
            this.scrollerCityIndex = this.provinceArray[this.scrollerProvinceIndex].getCityAndArea().size - 1
        }
    }

    @State
    @Watch[scrollerAreaIndexChange]
    var scrollerAreaIndex: Int64 = 0
    func scrollerAreaIndexChange() {
        if (this.scrollerProvinceIndex > this.provinceArray.size - 1) {
            this.scrollerProvinceIndex = this.provinceArray.size - 1
        }
        if (this.scrollerCityIndex > this.provinceArray[this.scrollerProvinceIndex].getCityAndArea().size - 1) {
            this.scrollerCityIndex = this.provinceArray[this.scrollerProvinceIndex].getCityAndArea().size - 1
        }
        if (this.scrollerAreaIndex >
            this.provinceArray[this.scrollerProvinceIndex].getCityAndArea()[this.scrollerCityIndex].getArea().size - 1) {
            this.scrollerAreaIndex = this.provinceArray[this.scrollerProvinceIndex].getCityAndArea()[this.
                    scrollerCityIndex].getArea().size - 1
        }
    }

    @State
    var cityAndAreaState: ObservedArrayList<CityAndArea> = ObservedArrayList(this.provinceArray[0].cityAndArea)
    //var cityAndAreaState: ArrayList<CityAndArea> = this.provinceArray[this.scrollerProvinceIndex].cityAndArea

    @State
    var AreaArrayState: Array<String> = (this.provinceArray[0].cityAndArea[0].getArea())
    //var AreaArrayState: Array<String> = this.provinceArray[this.scrollerProvinceIndex].cityAndArea[this.scrollerCityIndex].area

    @State
    var enabledProvince: Bool = true

    @State
    var enabledCity: Bool = true

    @State
    var enabledArea: Bool = true

    protected override func aboutToAppear() {
        this.model.updateVisibleItemCount()
        this.scrollerProvinceIndex = Int64(this.model.mFirstSelectPosition)
    }

    func build() {
        Row() {
            //-------------------------------------Province---------------------------------------
            Stack() {
                Scroll(this.scrollerProvince) {
                    Column() {
                        ForEach(Array(this.model.mHalfItemCount, item: 0),
                            itemGeneratorFunc: {
                            _: Int64, _: Int64 => Text("").fontSize(this.model.mItemTextSize).height(
                                this.model.mItemHeight).padding(this.model.mSpace)
                        })

                        ForEach(this.provinceArray,
                            itemGeneratorFunc: {
                            provinceItem: Province, _: Int64 => Text("${provinceItem.getProvinceName()}").fontSize(
                                this.model.mItemTextSize).height(this.model.mItemHeight).fontColor(
                                this.model.mItemTextColor).fontFamily(this.model.mFontFamily).padding(this.model.mSpace)
                        })

                        ForEach(Array(this.model.mHalfItemCount, item: 0),
                            itemGeneratorFunc: {
                            _: Int64, _: Int64 => Text("").fontSize(this.model.mItemTextSize).height(
                                this.model.mItemHeight).padding(this.model.mSpace)
                        })
                    }.width(100.percent).alignItems(this.model.mAlign)
                }
                    //.enabled(this.enabledProvince)
                    .height(this.model.mWheelHeight).backgroundColor(this.model.scrollBgColor).scrollBar(BarState.Off).
                    onScroll(
                    {
                        offset =>
                        // this.enabledCity = false
                        // this.enabledArea = false
                        this.model.scrollInit(this.scrollerProvince) //初始位置选择
                        let mOffset: Float64 = this.scrollerProvince.currentOffset().yOffset
                        this.model.mHalfItemCount = (this.model.mVisibleItem - 1) / 2
                        this.lastProvincePosition = if (offset.yOffset == 0.0) {
                            this.lastProvincePosition
                        } else {
                            offset.yOffset
                        }
                        this.scroller1.scrollTo(
                            xOffset: 0.0,
                            yOffset: mOffset,
                        )
                    }
                ).onScrollEnd(
                    {
                        =>
                        // this.enabledCity = true
                        // this.enabledArea = true
                        let scrollOffset = ((this.scrollerProvince.currentOffset().yOffset) % (this.
                                    model.mItemHeight))
                        if (scrollOffset > 1.0) {
                            if (this.lastProvincePosition <= 0.0) {
                                this.scrollerProvince.scrollTo(
                                    xOffset: 0.0,
                                    yOffset: this.scrollerProvince.currentOffset().yOffset - scrollOffset,
                                    duration: 100.0,
                                    curve: Curve.Ease
                                )
                                this.scrollerProvinceIndex = Int64((this.scrollerProvince.currentOffset().yOffset -
                                        scrollOffset) / this.model.mItemHeight)
                            } else {
                                this.scrollerProvince.scrollTo(
                                    xOffset: 0.0,
                                    yOffset: this.scrollerProvince.currentOffset().yOffset + this.model.mItemHeight -
                                        scrollOffset,
                                    duration: 100.0,
                                    curve: Curve.Ease
                                )
                                this.scrollerProvinceIndex = Int64((this.scrollerProvince.currentOffset().yOffset -
                                        scrollOffset) / this.model.mItemHeight + 1.0)
                            }
                            let province = this.provinceArray.get(this.scrollerProvinceIndex)
                            if(let Some(province) <- province) {
                                this.cityAndAreaState.set(province.getCityAndArea())
                                let cityAndArea = province.getCityAndArea().get(0)
                                if(let Some(cityAndArea) <- cityAndArea) {
                                    this.AreaArrayState = cityAndArea.getArea()
                                }

                            }


                        }
                        this.model.mProvinceName = this.provinceArray[this.scrollerProvinceIndex].getProvinceName()
                        let cityName = this.cityAndAreaState.get().get(0)
                        if(let Some(cityName) <- cityName) {
                           this.model.mCityName = cityName.getCityName()
                        }
                        this.model.mAreaName = this.AreaArrayState[0]
                    }
                ).onScrollEdge(
                    {
                        edge =>
                        this.scrollerProvinceIndex = Int64(this.scrollerProvince.currentOffset().yOffset / this.model.
                                mItemHeight)
                        // 防止滚到到边缘 onScrollEnd回调函数不触发
                        this.cityAndAreaState.set(this.provinceArray[this.scrollerProvinceIndex].getCityAndArea())
                        this.AreaArrayState = this.provinceArray[this.scrollerProvinceIndex].getCityAndArea()[0].getArea(
                            )
                    }
                )

                if (this.model.hasIndicator) {
                    Divider().offset(x: 0.0, y: -this.model.mItemHeight / 2.0).color(this.model.mIndicatorColor).width(
                        100.percent).strokeWidth(this.model.mIndicatorSize).zIndex(2)
                    Divider().offset(x: 0.0, y: this.model.mItemHeight / 2.0).color(this.model.mIndicatorColor).width(
                        100.percent).strokeWidth(this.model.mIndicatorSize).zIndex(2)
                }

                Column() {
                    Scroll(this.scroller1) {
                        Column() {
                            ForEach(this.provinceArray,
                                itemGeneratorFunc: {
                                provinceItem: Province, _: Int64 => Text(provinceItem.getProvinceName()).fontSize(
                                    this.model.mItemTextSize).height(this.model.mItemHeight).fontColor(
                                    this.model.mSelectedItemTextColor).fontFamily(this.model.mFontFamily).padding(
                                    this.model.mSpace)
                            })
                        }.alignItems(this.model.mAlign)
                    }.height(this.model.mItemHeight).enabled(false).backgroundColor(this.model.scrollBgColor).scrollBar(
                        BarState.Off)
                }

                if (this.model.hasAtmospheric) {
                    Flex(FlexParams()).width(100.percent).height(this.model.mWheelHeight).linearGradient(
                        angle: 0.0,
                        direction: GradientDirection.Top,
                        colors: [(Color(0xffE5DEEB), 0.0), (Color(0x00E5DEEB), 0.5), (Color(0xffE5DEEB), 1.0)]
                    ).zIndex(-1)
                }
                if (this.model.hasCurtain) {
                    Text("").width(100.percent).height(this.model.mItemHeight).opacity(0.5).backgroundColor(
                        this.model.mCurtainColor).enabled(false)
                }
            }.width(30.percent)

            //-------------------------------------City---------------------------------------------
            Stack() {
                Scroll(this.scrollerCity) {
                    Column() {
                        ForEach(Array(this.model.mHalfItemCount, item: 0),
                            itemGeneratorFunc: {
                            _: Int64, _: Int64 => Text("").fontSize(this.model.mItemTextSize).height(
                                this.model.mItemHeight).padding(this.model.mSpace)
                        })

                        ForEach(this.cityAndAreaState,
                            itemGeneratorFunc: {
                            val: CityAndArea, _: Int64 => if (val.getCityName().size > 5) {
                                Text("${val.getCityName()}").fontSize(this.model.mItemTextSize * 3 / 4).height(
                                    this.model.mItemHeight).fontColor(this.model.mItemTextColor).fontFamily(
                                    this.model.mFontFamily).padding(this.model.mSpace)
                            } else {
                                Text("${val.getCityName()}").fontSize(this.model.mItemTextSize).height(
                                    this.model.mItemHeight).fontColor(this.model.mItemTextColor).fontFamily(
                                    this.model.mFontFamily).padding(this.model.mSpace)
                            }
                        })

                        ForEach(Array(this.model.mHalfItemCount, item: 0),
                            itemGeneratorFunc: {
                            _: Int64, _: Int64 => Text("").fontSize(this.model.mItemTextSize).height(
                                this.model.mItemHeight).padding(this.model.mSpace)
                        })
                    }.width(100.percent).alignItems(this.model.mAlign)
                }
                    //.enabled(this.enabledCity)
                    .height(this.model.mWheelHeight).backgroundColor(this.model.scrollBgColor).scrollBar(BarState.Off).
                    onScroll(
                    {
                        offset =>
                        //                  this.enabledProvince = false
                        this.enabledArea = false
                        this.model.scrollInit(this.scrollerCity) //初始位置选择
                        let mOffset: Float64 = this.scrollerCity.currentOffset().yOffset
                        this.model.mHalfItemCount = (this.model.mVisibleItem - 1) / 2
                        this.lastCityPosition = if (offset.yOffset == 0.0) {
                            this.lastCityPosition
                        } else {
                            offset.yOffset
                        }
                        this.scroller2.scrollTo(
                            xOffset: 0.0,
                            yOffset: mOffset,
                        )
                    }
                ).onScrollEnd(
                    {
                        =>
                        //                  this.enabledProvince = true
                        //                  this.enabledArea = true
                        let scrollOffset = Float64(Int64(this.scrollerCity.currentOffset().yOffset) % Int64(this.model.
                                    mItemHeight))
                        if (scrollOffset > 1.0) {
                            if (this.lastCityPosition <= 0.0) { // 小于0，向下滑动，大于0是，是向上滑动
                                this.scrollerCity.scrollTo(
                                    xOffset: 0.0,
                                    yOffset: this.scrollerCity.currentOffset().yOffset - scrollOffset,
                                    duration: 100.0,
                                    curve: Curve.Ease
                                )
                                this.scrollerCityIndex = Int64((this.scrollerCity.currentOffset().yOffset - scrollOffset) /
                                        this.model.mItemHeight)
                            } else {
                                this.scrollerCity.scrollTo(
                                    xOffset: 0.0,
                                    yOffset: this.scrollerCity.currentOffset().yOffset + this.model.mItemHeight -
                                        scrollOffset,
                                    duration: 100.0,
                                    curve: Curve.Ease
                                )
                                this.scrollerCityIndex = Int64((this.scrollerCity.currentOffset().yOffset - scrollOffset) /
                                        this.model.mItemHeight + 1.0)
                            }
                            this.AreaArrayState = this.provinceArray[this.scrollerProvinceIndex].getCityAndArea()[this.
                                    scrollerCityIndex].getArea()
                        }
                        this.model.mProvinceName = this.provinceArray[this.scrollerProvinceIndex].getProvinceName()
                        let name = this.cityAndAreaState[this.scrollerCityIndex]
                        //if (let Some(name) <- name) {
                            this.model.mCityName = name.getCityName()
                        //}
                        this.model.mAreaName = this.AreaArrayState[0]
                    }
                ).onScrollEdge(
                    {
                    edge => this.scrollerProvinceIndex = Int64(this.scrollerCity.currentOffset().yOffset / this.model.
                            mItemHeight)
                })

                if (this.model.hasIndicator) {
                    Divider().offset(x: 0.0, y: -this.model.mItemHeight / 2.0).color(this.model.mIndicatorColor).width(
                        100.percent).strokeWidth(this.model.mIndicatorSize).zIndex(2)
                    Divider().offset(x: 0.0, y: this.model.mItemHeight / 2.0).color(this.model.mIndicatorColor).width(
                        100.percent).strokeWidth(this.model.mIndicatorSize).zIndex(2)
                }

                Column() {
                    Scroll(this.scroller2) {
                        Column() {
                            ForEach(this.cityAndAreaState,
                                itemGeneratorFunc: {
                                val: CityAndArea, _: Int64 => if (val.getCityName().size > 5) {
                                    Text(val.getCityName()).fontSize(this.model.mItemTextSize * 3 / 4).height(
                                        this.model.mItemHeight).fontColor(this.model.mSelectedItemTextColor).fontFamily(
                                        this.model.mFontFamily).padding(this.model.mSpace)
                                } else {
                                    Text(val.getCityName()).fontSize(this.model.mItemTextSize).height(
                                        this.model.mItemHeight).fontColor(this.model.mSelectedItemTextColor).fontFamily(
                                        this.model.mFontFamily).padding(this.model.mSpace)
                                }
                            })
                        }.alignItems(this.model.mAlign)
                    }.height(this.model.mItemHeight).enabled(false).backgroundColor(this.model.scrollBgColor).scrollBar(
                        BarState.Off)
                }

                if (this.model.hasAtmospheric) {
                    Flex(FlexParams()).width(100.percent).height(this.model.mWheelHeight).linearGradient(
                        angle: 0.0,
                        direction: GradientDirection.Top,
                        colors: [(Color(0xffE5DEEB), 0.0), (Color(0x00E5DEEB), 0.5), (Color(0xffE5DEEB), 1.0)]
                    ).zIndex(-1)
                }
                if (this.model.hasCurtain) {
                    Text("").width(100.percent).height(this.model.mItemHeight).opacity(0.5).backgroundColor(
                        this.model.mCurtainColor).enabled(false)
                }
            }.width(30.percent)

            //---------------------------------------------------Area-----------------------------------
            if (!this.model.mHideArea) {
                Stack() {
                    Scroll(this.scrollerArea) {
                        Column() {
                            ForEach(Array(this.model.mHalfItemCount, item: 0),
                                itemGeneratorFunc: {
                                _: Int64, _: Int64 => Text("").fontSize(this.model.mItemTextSize).height(
                                    this.model.mItemHeight).padding(this.model.mSpace)
                            })

                            ForEach(this.AreaArrayState,
                                itemGeneratorFunc: {
                                area: String, _: Int64 => if (area.size > 5) { //长度超过5，设置更小字体
                                    Text(area).fontSize(this.model.mItemTextSize * 3 / 4).height(this.model.mItemHeight).
                                        fontColor(this.model.mItemTextColor).fontFamily(this.model.mFontFamily).padding(
                                        this.model.mSpace)
                                } else {
                                    Text(area).fontSize(this.model.mItemTextSize).height(this.model.mItemHeight).
                                        fontColor(this.model.mItemTextColor).fontFamily(this.model.mFontFamily).padding(
                                        this.model.mSpace)
                                }
                            })

                            ForEach(Array(this.model.mHalfItemCount, item: 0),
                                itemGeneratorFunc: {
                                _: Int64, _: Int64 => Text("").fontSize(this.model.mItemTextSize).height(
                                    this.model.mItemHeight).padding(this.model.mSpace)
                            })
                        }.width(100.percent).alignItems(this.model.mAlign)
                    }
                        //.enabled(this.enabledArea)
                        .height(this.model.mWheelHeight).backgroundColor(this.model.scrollBgColor).scrollBar(BarState.Off).
                        onScroll(
                        {
                            offset =>
                            //                    this.enabledProvince = false
                            //                    this.enabledCity = false
                            this.model.scrollInit(this.scrollerArea) //初始位置选择
                            let mOffset: Float64 = this.scrollerArea.currentOffset().yOffset
                            this.model.mHalfItemCount = (this.model.mVisibleItem - 1) / 2
                            this.lastAreaPosition = if (offset.yOffset == 0.0) {
                                this.lastAreaPosition
                            } else {
                                offset.yOffset
                            }
                            this.scroller3.scrollTo(
                                xOffset: 0.0,
                                yOffset: mOffset,
                            )
                        }
                    ).onScrollEnd(
                        {
                            =>
                            //                    this.enabledProvince = true
                            //                    this.enabledCity = true
                            let scrollOffset = Float64(Int64(this.scrollerArea.currentOffset().yOffset) % Int64(this.
                                        model.mItemHeight))
                            if (scrollOffset > 1.0) {
                                if (this.lastAreaPosition <= 0.0) { // 小于0，向下滑动，大于0是，是向上滑动
                                    this.scrollerArea.scrollTo(
                                        xOffset: 0.0,
                                        yOffset: this.scrollerArea.currentOffset().yOffset - scrollOffset,
                                        duration: 100.0,
                                        curve: Curve.Ease
                                    )
                                    this.scrollerAreaIndex = Int64((this.scrollerArea.currentOffset().yOffset -
                                            scrollOffset) / this.model.mItemHeight)
                                } else {
                                    this.scrollerArea.scrollTo(
                                        xOffset: 0.0,
                                        yOffset: this.scrollerArea.currentOffset().yOffset + this.model.mItemHeight -
                                            scrollOffset,
                                        duration: 100.0,
                                        curve: Curve.Ease
                                    )
                                    this.scrollerAreaIndex = Int64((this.scrollerArea.currentOffset().yOffset -
                                            scrollOffset) / this.model.mItemHeight + 1.0)
                                }
                                this.model.mProvinceName = this.provinceArray[this.scrollerProvinceIndex].
                                    getProvinceName()
                                this.model.mCityName = this.cityAndAreaState[this.scrollerCityIndex].getCityName()
                                this.model.mAreaName = this.AreaArrayState[this.scrollerAreaIndex]
                            }
                        }
                    ).onScrollEdge(
                        {
                        edge => this.scrollerAreaIndex = Int64(this.scrollerArea.currentOffset().yOffset / this.model.
                                mItemHeight)
                    })

                    if (this.model.hasIndicator) {
                        Divider().offset(x: 0.0, y: -this.model.mItemHeight / 2.0).color(this.model.mIndicatorColor).
                            width(100.percent).strokeWidth(this.model.mIndicatorSize).zIndex(2)
                        Divider().offset(x: 0.0, y: this.model.mItemHeight / 2.0).color(this.model.mIndicatorColor).
                            width(100.percent).strokeWidth(this.model.mIndicatorSize).zIndex(2)
                    }
                    Column() {
                        Scroll(this.scroller3) {
                            Column() {
                                ForEach(this.AreaArrayState,
                                    itemGeneratorFunc: {
                                    area: String, _: Int64 => if (area.size > 5) { //长度超过5，设置更小字体
                                        Text(area).fontSize(this.model.mItemTextSize * 3 / 4).height(
                                            this.model.mItemHeight).fontColor(this.model.mSelectedItemTextColor).
                                            fontFamily(this.model.mFontFamily).padding(this.model.mSpace)
                                    } else {
                                        Text(area).fontSize(this.model.mItemTextSize).height(this.model.mItemHeight).
                                            fontColor(this.model.mSelectedItemTextColor).fontFamily(
                                            this.model.mFontFamily).padding(this.model.mSpace)
                                    }
                                })
                            }.alignItems(this.model.mAlign)
                        }.height(this.model.mItemHeight).enabled(false).backgroundColor(this.model.scrollBgColor).
                            scrollBar(BarState.Off)
                    }

                    if (this.model.hasAtmospheric) {
                        Flex(FlexParams()).width(100.percent).height(this.model.mWheelHeight).linearGradient(
                            angle: 0.0,
                            direction: GradientDirection.Top,
                            colors: [(Color(0xffE5DEEB), 0.0), (Color(0x00E5DEEB), 0.5), (Color(0xffE5DEEB), 1.0)]
                        ).zIndex(-1)
                    }
                    if (this.model.hasCurtain) {
                        Text("").width(100.percent).height(this.model.mItemHeight).opacity(0.5).backgroundColor(
                            this.model.mCurtainColor).enabled(false)
                    }
                }.width(30.percent)
            }
        }
    }
}
