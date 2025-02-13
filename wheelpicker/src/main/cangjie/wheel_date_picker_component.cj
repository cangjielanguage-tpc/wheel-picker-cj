/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package wheelpicker

import ohos.state_manage.*
import ohos.state_macro_manage.*


@Component
public class WheelDatePicker {
    @Link
    var model: WheelDatePickerModel = WheelDatePickerModel()
    @State
    var YearsArray: ArrayList<SolarCalendar> = ArrayList<SolarCalendar>()
    @State
    var yearChange: Int64 = 0
    @State
    var monthChange: Int64 = 0
    @State
    var dayChange: Int64 = 0

    @State
    var yearChangeIndex: Int64 = 0
    @State
    var monthChangeIndex: Int64 = 0
    @State
    var dayChangeIndex: Int64 = 0

    @State var lastYearPosition: Float64 = 0.0
    @State var lastMonthPosition: Float64 = 0.0
    @State var lastDayPosition: Float64 = 0.0

    var scrollerYear: Scroller = Scroller()
    var scrollerMonth: Scroller = Scroller()
    var scrollerDay: Scroller = Scroller()
    var scrollerYearColor: Scroller = Scroller()
    var scrollerMonthColor: Scroller = Scroller()
    var scrollerDayColor: Scroller = Scroller()

    @Builder
    func occupyText() {
        ForEach(
            Array(this.model.mHalfItemCount, item: 0),
            itemGeneratorFunc: {
                _: Int64, _: Int64 => Text("").fontSize(this.model.mItemTextSize).height(this.model.mItemHeight).padding(
                    this.model.mSpace)
            }
        )
    }

    @Builder
    func scrollYearIndex(textColor: Color) {
        Column() {
            if (!this.model.isCyslic) {
                ForEach(
                    this.YearsArray,
                    itemGeneratorFunc: {
                        solarYearItem: SolarCalendar, _: Int64 => Text("${solarYearItem.year}").fontSize(this.model.mItemTextSize).height(
                            this.model.mItemHeight).fontColor(textColor).fontFamily(this.model.mFontFamily).padding(
                            this.model.mSpace)
                    }
                )
            } else if (this.model.mVisibleItem < this.YearsArray.size) {
                ForEach(
                    Array(3, item: 0),
                    itemGeneratorFunc: {
                        _: Int64, _: Int64 => ForEach(
                            this.YearsArray,
                            itemGeneratorFunc: {
                                solarYearItem: SolarCalendar, _: Int64 => Text("${solarYearItem.year}").fontSize(this.model.mItemTextSize).height(
                                    this.model.mItemHeight).fontColor(textColor).fontFamily(this.model.mFontFamily).
                                    padding(this.model.mSpace)
                            }
                        )
                    }
                )
            } else {
                ForEach(
                    Array(Int64(ceil(Float64(this.model.mVisibleItem / this.YearsArray.size)) * 3.0), item: 0),
                    itemGeneratorFunc: {
                        _: Int64, _: Int64 => ForEach(
                            this.YearsArray,
                            itemGeneratorFunc: {
                                solarYearItem: SolarCalendar, _: Int64 => Text("${solarYearItem.year}").fontSize(this.model.mItemTextSize).height(
                                    this.model.mItemHeight).fontColor(textColor).fontFamily(this.model.mFontFamily).
                                    padding(this.model.mSpace)
                            }
                        )
                    }
                )
            }
        }.width(30.percent).alignItems(this.model.mAlignYear)
    }

    @Builder
    func scrollMonthIndex(textColor: Color) {
        Column() {
            if (!this.model.isCyslic) {
                ForEach(
                    this.YearsArray[yearChangeIndex].monthAndDay,
                    itemGeneratorFunc: {
                        monthAndDay: MonthAndDay, _: Int64 => Text("${monthAndDay.month}").fontSize(this.model.mItemTextSize).height(
                            this.model.mItemHeight).fontColor(textColor).fontFamily(this.model.mFontFamily).padding(
                            this.model.mSpace)
                    }
                )
            } else if (this.model.mVisibleItem < this.YearsArray[yearChangeIndex].monthAndDay.size) {
                ForEach(
                    Array(3, item: 0),
                    itemGeneratorFunc: {
                        _: Int64, _: Int64 => ForEach(
                            this.YearsArray[yearChangeIndex].monthAndDay,
                            itemGeneratorFunc: {
                                monthAndDay: MonthAndDay, _: Int64 => Text("${monthAndDay.month}").fontSize(this.model.mItemTextSize).height(
                                    this.model.mItemHeight).fontColor(textColor).fontFamily(this.model.mFontFamily).
                                    padding(this.model.mSpace)
                            }
                        )
                    }
                )
            } else {
                ForEach(
                    Array(Int64(ceil(Float64(this.model.mVisibleItem / this.YearsArray[yearChangeIndex].monthAndDay.size)) * 3.0), item: 0),
                    itemGeneratorFunc: {
                        _: Int64, _: Int64 => ForEach(
                            this.YearsArray[yearChangeIndex].monthAndDay,
                            itemGeneratorFunc: {
                                monthAndDay: MonthAndDay, _: Int64 => Text("${monthAndDay.month}").fontSize(this.model.mItemTextSize).height(
                                    this.model.mItemHeight).fontColor(textColor).fontFamily(this.model.mFontFamily).
                                    padding(this.model.mSpace)
                            }
                        )
                    }
                )
            }
        }.width(30.percent).alignItems(this.model.mAlignYear)
    }

    @Builder
    func scrollDayIndex(textColor: Color) {
        Column() {
            if (!this.model.isCyslic) {
                ForEach(
                    this.YearsArray[yearChangeIndex].monthAndDay[monthChangeIndex].days,
                    itemGeneratorFunc: {
                        day: String, _: Int64 => Text(day).fontSize(this.model.mItemTextSize).height(
                            this.model.mItemHeight).fontColor(textColor).fontFamily(this.model.mFontFamily).padding(
                            this.model.mSpace)
                    }
                )
            } else if (this.model.mVisibleItem < this.YearsArray[yearChangeIndex].monthAndDay[monthChangeIndex].days.size) {
                ForEach(
                    Array(3, item: 0),
                    itemGeneratorFunc: {
                        _: Int64, _: Int64 => ForEach(
                            this.YearsArray[yearChangeIndex].monthAndDay[monthChangeIndex].days,
                            itemGeneratorFunc: {
                                day: String, _: Int64 => Text(day).fontSize(this.model.mItemTextSize).height(
                                    this.model.mItemHeight).fontColor(textColor).fontFamily(this.model.mFontFamily).
                                    padding(this.model.mSpace)
                            }
                        )
                    }
                )
            } else {
                ForEach(
                    Array(Int64(ceil(Float64(this.model.mVisibleItem / this.YearsArray[yearChangeIndex].monthAndDay[monthChangeIndex].days.size)) * 3.0), item: 0),
                    itemGeneratorFunc: {
                        _: Int64, _: Int64 => ForEach(
                            this.YearsArray[yearChangeIndex].monthAndDay[monthChangeIndex].days,
                            itemGeneratorFunc: {
                                day: String, _: Int64 => Text(day).fontSize(this.model.mItemTextSize).height(
                                    this.model.mItemHeight).fontColor(textColor).fontFamily(this.model.mFontFamily).
                                    padding(this.model.mSpace)
                            }
                        )
                    }
                )
            }
        }.width(30.percent).alignItems(this.model.mAlignYear)
    }

    protected override func aboutToAppear() {
        this.YearsArray = initializeSolarCalendar(this.model.yearRangeStart, this.model.yearRangeEnd)
        this.yearChangeIndex = this.model.mFirstSelectYearPosition
        this.monthChangeIndex = this.model.mFirstSelectMonthPosition
        this.dayChangeIndex = this.model.mFirstSelectDayPosition

        this.model.updateVisibleItemCount()

        Timer.once(
            Duration.millisecond * 100,
            {
                =>
                this.model.updateVisibleItemCount()
                if (this.model.isCyslic) {
                    this.scrollerYear.scrollTo(
                        xOffset: 0.0,
                        yOffset: this.model.mItemHeight * Float64(this.model.mFirstSelectYearPosition)
                    )

                    this.scrollerMonth.scrollTo(
                        xOffset: 0.0,
                        yOffset: this.model.mItemHeight * Float64(this.model.mFirstSelectMonthPosition)
                    )

                    this.scrollerDay.scrollTo(
                        xOffset: 0.0,
                        yOffset: this.model.mItemHeight * Float64(this.model.mFirstSelectDayPosition)
                    )
                } else {
                    this.scrollerYear.scrollTo(
                        xOffset: 0.0,
                        yOffset: this.model.mItemHeight * Float64(this.model.mFirstSelectYearPosition)
                    )

                    this.scrollerMonth.scrollTo(
                        xOffset: 0.0,
                        yOffset: this.model.mItemHeight * Float64(this.model.mFirstSelectMonthPosition)
                    )

                    this.scrollerDay.scrollTo(
                        xOffset: 0.0,
                        yOffset: this.model.mItemHeight * Float64(this.model.mFirstSelectDayPosition)
                    )
                }


                let mOffsetYear: Float64 = this.scrollerYear.currentOffset().yOffset
                let mOffsetMonth: Float64 = this.scrollerMonth.currentOffset().yOffset
                let mOffsetDay: Float64 = this.scrollerDay.currentOffset().yOffset
                if (this.model.isCyslic) {
                    this.scrollerYearColor.scrollTo(
                        xOffset: 0.0,
                        yOffset: mOffsetYear + Float64(this.model.mHalfItemCount) * this.model.mItemHeight,
                    )
                    this.scrollerMonthColor.scrollTo(
                        xOffset: 0.0,
                        yOffset: mOffsetMonth + Float64(this.model.mHalfItemCount) * this.model.mItemHeight,
                    )
                    this.scrollerDayColor.scrollTo(
                        xOffset: 0.0,
                        yOffset: mOffsetDay + Float64(this.model.mHalfItemCount) * this.model.mItemHeight,
                    )
                 } else {
                    this.scrollerYearColor.scrollTo(
                        xOffset: 0.0,
                        yOffset: mOffsetYear,
                    )
                    this.scrollerMonthColor.scrollTo(
                        xOffset: 0.0,
                        yOffset: mOffsetMonth,
                    )
                    this.scrollerDayColor.scrollTo(
                        xOffset: 0.0,
                        yOffset: mOffsetDay,
                    )
                }

            }
        )

        return
    }

    protected override func aboutToDisappear() {
        if (this.model.isCyslic) {
            this.yearChange = (this.model.solarLatestYearIndex) % this.YearsArray.size
            this.dayChange = (this.model.solarLatestDayIndex + this.model.mHalfItemCount) % this.YearsArray[this.yearChange].monthAndDay[(this.model.solarLatestMonthIndex)%12].days.size

            this.model.mDate = "${this.YearsArray[this.yearChange].year}" + "-" + "${this.YearsArray[this.yearChange].monthAndDay[(this.model.solarLatestMonthIndex)%12].month}" + "-" + "${this.YearsArray[this.yearChange].monthAndDay[(this.model.solarLatestMonthIndex + this.model.mHalfItemCount)%12].days[this.dayChange]}"
        } else {
            this.model.mDate = "${this.YearsArray[this.model.solarLatestYearIndex].year}" + "-" + "${this.YearsArray[this.model.solarLatestYearIndex].monthAndDay[this.model.solarLatestMonthIndex].month}" + "-" + "${this.YearsArray[this.model.solarLatestYearIndex].monthAndDay[this.model.solarLatestMonthIndex].days[this.model.solarLatestDayIndex]}"
        }
    }

    func build() {
        Row() {
            //--------------------------------Year--------------------------------------
            Stack() {
                Scroll(this.scrollerYear) {
                    Column() {
                        if (!this.model.isCyslic) {
                            this.occupyText()
                        }
                        this.scrollYearIndex(this.model.mItemTextColor)
                        if (!this.model.isCyslic) {
                            this.occupyText()
                        }
                    }
                }.height(this.model.mWheelHeight).backgroundColor(this.model.scrollBgColor).scrollBar(BarState.Off)
                .onScroll({
                    offset =>
                    let mOffset: Float64 = this.scrollerYear.currentOffset().yOffset
                    this.model.mHalfItemCount = (this.model.mVisibleItem - 1) / 2
                    this.lastYearPosition = if(offset.yOffset == 0.0) { this.lastYearPosition } else { offset.yOffset }
                    if (this.model.isCyslic) {
                        this.scrollerYearColor.scrollTo(
                            xOffset: 0.0,
                            yOffset: mOffset + Float64(this.model.mHalfItemCount) * this.model.mItemHeight,
                        )
                    } else {
                        this.scrollerYearColor.scrollTo(
                            xOffset: 0.0,
                            yOffset: mOffset,
                        )
                    }
                })
                .onScrollEnd({
                    =>
                    let scrollOffset: Float64 = this.scrollerYear.currentOffset().yOffset % this.model.mItemHeight
                    if (scrollOffset > (this.model.mItemHeight / 2.0)) {
                        this.model.solarLatestYearIndex = Int64(((
                        this.scrollerYear.currentOffset()
                        .yOffset - scrollOffset) / this.model.mItemHeight + 1.0) % Float64(this.YearsArray.size))

                        this.scrollerYear.scrollTo(
                            xOffset: 0.0,
                            yOffset: this.scrollerYear.currentOffset().yOffset - scrollOffset + this.model.
                                        mItemHeight,
                            duration: 100.0,
                            curve: Curve.Linear
                        )
                    } else if(scrollOffset > 0.0 && scrollOffset < (this.model.mItemHeight / 2.0)) {
                        this.model.solarLatestYearIndex = Int64(((
                        this.scrollerYear.currentOffset()
                        .yOffset - scrollOffset) / this.model.mItemHeight) % Float64(this.YearsArray.size))

                        this.scrollerYear.scrollTo(
                            xOffset: 0.0,
                            yOffset: this.scrollerYear.currentOffset().yOffset - scrollOffset,
                            duration: 100.0,
                            curve: Curve.Linear
                        )
                    }
                    let lastDaySize: Int64 = this.YearsArray[this.model.solarLatestYearIndex].monthAndDay[this.model.solarLatestMonthIndex].days.size

                    if(this.model.solarLatestMonthIndex == 1 && (Float64(lastDaySize) * (this.model.mTextHeight + 2.0 * this.model.mSpace)) == this.lastDayPosition) {
                        this.model.solarLatestDayIndex = lastDaySize - 1
                    }
                        
                    if (this.model.isCyslic) {
                        this.yearChange = (this.model.solarLatestYearIndex + this.model.mHalfItemCount) % this.YearsArray.size
                        this.monthChange = (this.model.solarLatestMonthIndex + this.model.mHalfItemCount)%12
                        this.dayChange = (this.model.solarLatestDayIndex + this.model.mHalfItemCount) % this.YearsArray[this.yearChange].monthAndDay[this.monthChange].days.size
                        this.model.mDate = "${this.YearsArray[this.yearChange].year}" + "-" + "${this.YearsArray[this.yearChange].monthAndDay[this.monthChange].month}" + "-" + "${this.YearsArray[this.yearChange].monthAndDay[this.monthChange].days[this.dayChange]}"
                        this.yearChangeIndex = this.yearChange
                        this.monthChangeIndex = this.monthChange
                     } else {
                        this.yearChangeIndex = this.model.solarLatestYearIndex
                        this.monthChangeIndex = this.model.solarLatestMonthIndex
                        this.model.mDate = "${this.YearsArray[this.model.solarLatestYearIndex].year}" + "-" + "${this.YearsArray[this.model.solarLatestYearIndex].monthAndDay[this.model.solarLatestMonthIndex].month}" + "-" + "${this.YearsArray[this.model.solarLatestYearIndex].monthAndDay[this.model.solarLatestMonthIndex].days[this.model.solarLatestDayIndex]}"

                    }

                })
                .onScrollEdge({
                    edge =>
                    if (this.model.isCyslic) {
                        let scollerBack: Float64 = ceil(
                            (floor(Float64(this.model.mVisibleItem / this.YearsArray.size)) * 3.0) / 2.0 + 1.0) *
                            Float64(this.YearsArray.size) * this.model.mItemHeight
                        match (edge) {
                            case Edge.Top => this.scrollerYear.scrollTo(
                                xOffset: 0.0,
                                yOffset: scollerBack,
                                duration: 0.0,
                                curve: Curve.Linear
                            )
                            case Edge.Bottom => this.scrollerYear.scrollTo(
                                xOffset: 0.0,
                                yOffset: scollerBack - Float64(2 * this.model.mHalfItemCount + 1) * this.model.
                                    mItemHeight,
                                duration: 0.0,
                                curve: Curve.Linear
                            )
                            case _ => ()
                        }
                    }
                })

                if (this.model.hasIndicator) {
                    Divider()
                    .offset( x: 0.0, y: -this.model.mItemHeight / 2.0 )
                    .color(this.model.mIndicatorColor)
                    .width(30.percent)
                    .strokeWidth(this.model.mIndicatorSize)
                    .zIndex(2)
                    Divider()
                    .offset( x: 0.0, y: this.model.mItemHeight / 2.0 )
                    .color(this.model.mIndicatorColor)
                    .width(30.percent)
                    .strokeWidth(this.model.mIndicatorSize)
                    .zIndex(2)
                }

                Column(){
                    Scroll(this.scrollerYearColor) {
                        Column() {
                            this.scrollYearIndex(this.model.mSelectedItemTextColor)
                        }
                    }.height(this.model.mItemHeight).enabled(false).backgroundColor(this.model.mCurtainColor).scrollBar(BarState.Off)
                }

                if (this.model.hasAtmospheric) {
                    Flex(FlexParams())
                    .width(30.percent)
                    .height(this.model.mWheelHeight)
                    .linearGradient(
                        angle: 0.0,
                        direction: GradientDirection.Top,
                        colors: this.model.atmosphericColor
                    )
                }

            }

            //--------------------------------month--------------------------------------

            Stack() {
                Scroll(this.scrollerMonth) {
                    Column() {
                        if (!this.model.isCyslic) {
                            this.occupyText()
                        }
                        this.scrollMonthIndex(this.model.mItemTextColor)
                        if (!this.model.isCyslic) {
                            this.occupyText()
                        }
                    }
                }.height(this.model.mWheelHeight).backgroundColor(this.model.scrollBgColor).scrollBar(BarState.Off)
                .onScroll({
                    offset =>
                    let mOffset: Float64 = this.scrollerMonth.currentOffset().yOffset
                    this.model.mHalfItemCount = (this.model.mVisibleItem - 1) / 2
                    this.lastMonthPosition = if(offset.yOffset == 0.0) { this.lastMonthPosition } else { offset.yOffset }
                    if (this.model.isCyslic) {
                        this.scrollerMonthColor.scrollTo(
                            xOffset: 0.0,
                            yOffset: mOffset + Float64(this.model.mHalfItemCount) * this.model.mItemHeight,
                        )
                    } else {
                        this.scrollerMonthColor.scrollTo(
                            xOffset: 0.0,
                            yOffset: mOffset,
                        )
                    }
                })
                .onScrollEnd({
                    =>
                    let scrollOffset: Float64 = this.scrollerMonth.currentOffset().yOffset % this.model.mItemHeight
                    if (scrollOffset > (this.model.mItemHeight / 2.0)) {
                        this.model.solarLatestMonthIndex = Int64(((
                        this.scrollerMonth.currentOffset()
                        .yOffset - scrollOffset) / this.model.mItemHeight + 1.0) % Float64(this.YearsArray[this.model.solarLatestYearIndex].monthAndDay.size))

                        this.scrollerMonth.scrollTo(
                            xOffset: 0.0,
                            yOffset: this.scrollerMonth.currentOffset().yOffset - scrollOffset + this.model.
                                        mItemHeight,
                            duration: 100.0,
                            curve: Curve.Linear
                        )
                    } else if(scrollOffset > 0.0 && scrollOffset < (this.model.mItemHeight / 2.0)) {
                        this.model.solarLatestMonthIndex = Int64(((
                        this.scrollerMonth.currentOffset()
                        .yOffset - scrollOffset) / this.model.mItemHeight) % Float64(this.YearsArray[this.model.solarLatestYearIndex].monthAndDay.size))

                        this.scrollerMonth.scrollTo(
                            xOffset: 0.0,
                            yOffset: this.scrollerMonth.currentOffset().yOffset - scrollOffset,
                            duration: 100.0,
                            curve: Curve.Linear
                        )
                    }

                    if (this.model.isCyslic) {
                        // 处理 所选月份的天数小于之前INDEX
                        this.yearChange = (this.model.solarLatestYearIndex + this.model.mHalfItemCount) % this.YearsArray.size
                        this.monthChange = (this.model.solarLatestMonthIndex + this.model.mHalfItemCount)%12
                        let dayLength: Int64 = this.YearsArray[this.yearChange].monthAndDay[this.monthChange].days.size - 1
                        if (this.model.solarLatestDayIndex > dayLength) {
                            this.model.solarLatestDayIndex = dayLength;
                        }
                        this.model.mDate = "${this.YearsArray[this.yearChange].year}" + "-" + "${this.YearsArray[this.yearChange].monthAndDay[this.monthChange].month}" + "-" + "${this.YearsArray[this.yearChange].monthAndDay[this.monthChange].days[this.dayChange]}"
                        this.yearChangeIndex = this.yearChange
                        this.monthChangeIndex = this.monthChange
                   } else {
                        // 处理 所选月份的天数小于之前INDEX
                        let dayLength: Int64 = this.YearsArray[this.model.solarLatestYearIndex].monthAndDay[(this.model.solarLatestMonthIndex)].days.size - 1
                        if (this.model.solarLatestDayIndex > dayLength) {
                            this.model.solarLatestDayIndex = dayLength
                        }
                        this.yearChangeIndex = this.model.solarLatestYearIndex
                        this.monthChangeIndex = this.model.solarLatestMonthIndex
                        this.model.mDate = "${this.YearsArray[this.model.solarLatestYearIndex].year}" + "-" + "${this.YearsArray[this.model.solarLatestYearIndex].monthAndDay[this.model.solarLatestMonthIndex].month}" + "-" + "${this.YearsArray[this.model.solarLatestYearIndex].monthAndDay[this.model.solarLatestMonthIndex].days[this.model.solarLatestDayIndex]}"
                   }


                })
                .onScrollEdge({
                    edge =>
                    if (this.model.isCyslic) {
                        let scollerBack: Float64 = ceil(
                            (floor(Float64(this.model.mVisibleItem / this.YearsArray[this.model.solarLatestYearIndex].monthAndDay.size)) * 3.0) / 2.0 + 1.0) *
                            Float64(this.YearsArray[this.model.solarLatestYearIndex].monthAndDay.size) * this.model.mItemHeight
                        match (edge) {
                            case Edge.Top => this.scrollerMonth.scrollTo(
                                xOffset: 0.0,
                                yOffset: scollerBack,
                                duration: 0.0,
                                curve: Curve.Linear
                            )
                            case Edge.Bottom => this.scrollerMonth.scrollTo(
                                xOffset: 0.0,
                                yOffset: scollerBack - Float64(2 * this.model.mHalfItemCount + 1) * this.model.
                                    mItemHeight,
                                duration: 0.0,
                                curve: Curve.Linear
                            )
                            case _ => ()
                        }
                    }
                })

                if (this.model.hasIndicator) {
                    Divider().offset(x: 0.0, y: -this.model.mItemHeight / 2.0).color(this.model.mIndicatorColor).width(
                        30.percent).strokeWidth(this.model.mIndicatorSize).zIndex(2)
                    Divider().offset(x: 0.0, y: this.model.mItemHeight / 2.0).color(this.model.mIndicatorColor).width(
                        30.percent).strokeWidth(this.model.mIndicatorSize).zIndex(2)
                }
                Column() {
                    Scroll(this.scrollerMonthColor) {
                        Column() {
                            this.scrollMonthIndex(this.model.mSelectedItemTextColor)
                        }
                    }.height(this.model.mItemHeight).enabled(false).backgroundColor(this.model.mCurtainColor).scrollBar(
                        BarState.Off)
                }

                if (this.model.hasAtmospheric) {
                    Flex(FlexParams())
                    .width(30.percent)
                    .height(this.model.mWheelHeight)
                    .linearGradient(
                        angle: 0.0,
                        direction: GradientDirection.Top,
                        colors: this.model.atmosphericColor
                    )
                }
            }

            //------------------------------------------------------day-------------------------------------------------------

            Stack() {
                Scroll(this.scrollerDay) {
                    Column() {
                        if (!this.model.isCyslic) {
                            this.occupyText()
                        }
                        this.scrollDayIndex(this.model.mItemTextColor)
                        if (!this.model.isCyslic) {
                            this.occupyText()
                        }
                    }
                }.height(this.model.mWheelHeight).backgroundColor(this.model.scrollBgColor).scrollBar(BarState.Off)
                .onScroll({
                    offset =>
                    let mOffset: Float64 = this.scrollerDay.currentOffset().yOffset
                    this.model.mHalfItemCount = (this.model.mVisibleItem - 1) / 2
                    this.lastDayPosition = if(offset.yOffset == 0.0) { this.lastDayPosition } else { offset.yOffset }
                    if (this.model.isCyslic) {
                        this.scrollerDayColor.scrollTo(
                            xOffset: 0.0,
                            yOffset: mOffset + Float64(this.model.mHalfItemCount) * this.model.mItemHeight,
                        )
                    } else {
                        this.scrollerDayColor.scrollTo(
                            xOffset: 0.0,
                            yOffset: mOffset,
                        )
                    }
                })
                 .onScrollEnd({
                    =>
                    let scrollOffset: Float64 = this.scrollerDay.currentOffset().yOffset % this.model.mItemHeight
                    if (scrollOffset > (this.model.mItemHeight / 2.0)) {
                        this.model.solarLatestDayIndex = Int64(((
                        this.scrollerDay.currentOffset()
                        .yOffset - scrollOffset) / this.model.mItemHeight + 1.0) % Float64(this.YearsArray[this.model.solarLatestYearIndex].monthAndDay[this.model.solarLatestMonthIndex].days.size))

                        this.scrollerDay.scrollTo(
                            xOffset: 0.0,
                            yOffset: this.scrollerDay.currentOffset().yOffset - scrollOffset + this.model.
                                        mItemHeight,
                            duration: 100.0,
                            curve: Curve.Linear
                        )
                    } else if(scrollOffset > 0.0 && scrollOffset < (this.model.mItemHeight / 2.0)) {
                        this.model.solarLatestDayIndex = Int64(((
                        this.scrollerDay.currentOffset()
                        .yOffset - scrollOffset) / this.model.mItemHeight) % Float64(this.YearsArray[this.model.solarLatestYearIndex].monthAndDay[this.model.solarLatestMonthIndex].days.size))

                        this.scrollerDay.scrollTo(
                            xOffset: 0.0,
                            yOffset: this.scrollerDay.currentOffset().yOffset - scrollOffset,
                            duration: 100.0,
                            curve: Curve.Linear
                        )
                    }

                    if (this.model.isCyslic) {
                        this.yearChange = (this.model.solarLatestYearIndex + this.model.mHalfItemCount) % this.YearsArray.size
                        this.dayChange = (this.model.solarLatestDayIndex + this.model.mHalfItemCount) % this.YearsArray[this.yearChange].monthAndDay[(this.model.solarLatestMonthIndex + this.model.mHalfItemCount)%12].days.size
                        this.model.mDate = "${this.YearsArray[this.yearChange].year}" + "-" + "${this.YearsArray[this.yearChange].monthAndDay[(this.model.solarLatestMonthIndex + this.model.mHalfItemCount)%12].month}" + "-" + "${this.YearsArray[this.yearChange].monthAndDay[this.model.solarLatestMonthIndex].days[this.dayChange]}"
                  } else {
                        this.model.mDate = "${this.YearsArray[this.model.solarLatestYearIndex].year}" + "-" + "${this.YearsArray[this.model.solarLatestYearIndex].monthAndDay[this.model.solarLatestMonthIndex].month}" + "-" + "${this.YearsArray[this.model.solarLatestYearIndex].monthAndDay[this.model.solarLatestMonthIndex].days[this.model.solarLatestDayIndex]}"
                  }

                })
                .onScrollEdge({
                    edge =>
                    if (this.model.isCyslic) {
                        let scollerBack: Float64 = ceil(
                            (floor(Float64(this.model.mVisibleItem / this.YearsArray[this.model.solarLatestYearIndex].monthAndDay[this.model.solarLatestMonthIndex].days.size)) * 3.0) / 2.0 + 1.0) *
                            Float64(this.YearsArray[this.model.solarLatestYearIndex].monthAndDay[this.model.solarLatestMonthIndex].days.size) * this.model.mItemHeight
                        match (edge) {
                            case Edge.Top => this.scrollerDay.scrollTo(
                                xOffset: 0.0,
                                yOffset: scollerBack,
                                duration: 0.0,
                                curve: Curve.Linear
                            )
                            case Edge.Bottom => this.scrollerDay.scrollTo(
                                xOffset: 0.0,
                                yOffset: scollerBack - Float64(2 * this.model.mHalfItemCount + 1) * this.model.
                                    mItemHeight,
                                duration: 0.0,
                                curve: Curve.Linear
                            )
                            case _ => ()
                        }
                    }
                })
                if (this.model.hasIndicator) {
                    Divider()
                        .offset( x: 0.0, y: -this.model.mItemHeight / 2.0 )
                        .color(this.model.mIndicatorColor)
                        .width(30.percent)
                        .strokeWidth(this.model.mIndicatorSize)
                        .zIndex(2)
                        Divider()
                        .offset( x: 0.0, y: this.model.mItemHeight / 2.0 )
                        .color(this.model.mIndicatorColor)
                        .width(30.percent)
                        .strokeWidth(this.model.mIndicatorSize)
                        .zIndex(2)
                    }

                Column(){
                    Scroll(this.scrollerDayColor) {
                        Column() {
                            this.scrollDayIndex(this.model.mSelectedItemTextColor)
                        }
                    }.height(this.model.mItemHeight).enabled(false).backgroundColor(this.model.mCurtainColor).scrollBar(BarState.Off)
                }

                if (this.model.hasAtmospheric) {
                    Flex(FlexParams())
                    .width(30.percent)
                    .height(this.model.mWheelHeight)
                    .linearGradient(
                        angle: 0.0,
                        direction: GradientDirection.Top,
                        colors: this.model.atmosphericColor
                    )
                }
            }
        }
    }
}
