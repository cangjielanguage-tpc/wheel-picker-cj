/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package wheelpicker

import ohos.state_manage.*
import ohos.state_macro_manage.*

@Component
public class WheelYearPicker {
    @State
    var model: WheelYearPickerModel = WheelYearPickerModel()
    private var scroller: Scroller = Scroller()
    private var scroller1: Scroller = Scroller()
    @State
    var YearsArray: ArrayList<SolarCalendar> = ArrayList<SolarCalendar>()
    private var lastYearPosition: Float64 = 0.0
    private var dividerIndex: Int64 = 0

    @Builder
    func scrollIndex(textColor: Color) {
        Column() {
            if (!this.model.isCyslic) {
                ForEach(this.YearsArray,
                    itemGeneratorFunc: {
                    solarYearItem: SolarCalendar, _: Int64 => Text("${solarYearItem.year}").fontSize(
                        this.model.mTextHeight).height(this.model.mItemHeight).fontColor(textColor).fontFamily(
                        this.model.mFontFamily).padding(this.model.mSpace)
                })
            } else if (this.model.mVisibleItem < this.YearsArray.size) {
                ForEach(Array(3, repeat: 0),
                    itemGeneratorFunc: {
                    _: Int64, _: Int64 => ForEach(this.YearsArray,
                        itemGeneratorFunc: {
                        solarYearItem: SolarCalendar, _: Int64 => Text("${solarYearItem.year}").fontSize(
                            this.model.mTextHeight).height(this.model.mItemHeight).fontColor(textColor).fontFamily(
                            this.model.mFontFamily).padding(this.model.mSpace)
                    })
                })
            } else {
                ForEach(Array(Int64(ceil(Float64(this.model.mVisibleItem / this.YearsArray.size)) * 3.0), repeat: 0),
                    itemGeneratorFunc: {
                    item: Int64, _: Int64 => ForEach(this.YearsArray,
                        itemGeneratorFunc: {
                        solarYearItem: SolarCalendar, _: Int64 => Text("${solarYearItem.year}").fontSize(
                            this.model.mItemTextSize).height(this.model.mItemHeight).fontColor(textColor).fontFamily(
                            this.model.mFontFamily).padding(this.model.mSpace)
                    })
                })
            }
        }.width(60.percent).alignItems(this.model.mAlign)
    }

    protected override func aboutToAppear() {
        this.YearsArray = initializeSolarCalendar(this.model.yearRangeStart, this.model.yearRangeEnd)
        this.model.updateVisibleItemCount()
    }

    func build() {
        Row() {
            Stack() {
                Scroll(this.scroller) {
                    Column() {
                        // todo
                        if (!this.model.isCyslic) {
                            ForEach(Array(this.model.mHalfItemCount, repeat: 0),
                                itemGeneratorFunc: {
                                item: Int64, _: Int64 => Text("UPBLANK").fontSize(this.model.mItemTextSize).height(
                                    this.model.mItemHeight).padding(this.model.mSpace)
                            })
                        }
                        this.scrollIndex(this.model.mItemTextColor)
                        if (!this.model.isCyslic) {
                            ForEach(Array(this.model.mHalfItemCount, repeat: 0),
                                itemGeneratorFunc: {
                                item: Int64, _: Int64 => Text("DOWNBLANK").fontSize(this.model.mItemTextSize).height(
                                    this.model.mItemHeight).padding(this.model.mSpace)
                            })
                        }
                    }
                }
                .height(this.model.mWheelHeight)
                .backgroundColor(this.model.scrollBgColor)
                .scrollBar(BarState.Off)
                .zIndex(1)
                .onScroll({
                   offset => onScroll(offset)
                }).onScrollEnd({
                    =>  onScrollEnd()
                }).onScrollEdge({
                    edge => onScrollEdge(edge) // 滚动功能和添加循环效果
                }).onAppear({ => onAppear()})
                isHasIndicator()
                scrollIndexModel()
                isHasAtmospheric()
            }.align(Alignment.Center)
        }
    }

    @Builder
    func isHasIndicator() {
        if (this.model.hasIndicator) {
            Divider().offset(x: 0.0, y: -this.model.mItemHeight / 2.0).color(this.model.mIndicatorColor).width(
               50.percent).strokeWidth(this.model.mIndicatorSize).zIndex(2)
            Divider().offset(x: 0.0, y: this.model.mItemHeight / 2.0).color(this.model.mIndicatorColor).width(
               50.percent).strokeWidth(this.model.mIndicatorSize).zIndex(2)
        }
    }

    @Builder
    func isHasAtmospheric() {
        if (this.model.hasAtmospheric) {
            Flex(FlexParams())
                .height(this.model.mWheelHeight)
                .width(30.percent)
                .linearGradient(
                    direction: GradientDirection.Top,
                    colors: this.model.atmosphericColor,
                    repeating: false
            )
            .height(this.model.mItemHeight)
            .zIndex(3)
            .opacity(0.1)
        }
    }

    @Builder
    func scrollIndexModel() {
        Column() {
            Scroll(this.scroller1) {
                Column() {
                    this.scrollIndex(this.model.mSelectedItemTextColor)
                }
            }.height(this.model.mItemHeight).enabled(false).backgroundColor(this.model.mCurtainColor).scrollBar(
                BarState.Off)
        }.zIndex(2)
        .backgroundColor(Color.RED)
    }

    func onScroll(offset: OffsetResult) {
        let mOffset: Float64 = this.scroller.currentOffset().yOffset
        this.lastYearPosition = if (offset.yOffset == 0.0) {
            this.lastYearPosition
        } else {
            offset.yOffset
        }

        if (this.model.isCyslic) {
            this.scroller1.scrollTo(
                xOffset: 0.0,
                yOffset: mOffset + Float64(this.model.mHalfItemCount) * this.model.mItemHeight,
            )
        } else {
            this.scroller1.scrollTo(
                xOffset: 0.0,
                yOffset: mOffset,
            )
        }
    }

    func onScrollEnd() {
        let scrollOffset: Float64 = this.scroller.currentOffset().yOffset % Float64(
            this.model.mItemHeight)
        if (scrollOffset > 1.0) {
            if (this.lastYearPosition <= 0.0) { // 小于0，向下滑动，大于0是，是向上滑动
                this.scroller.scrollTo(
                    xOffset: 0.0,
                    yOffset: this.scroller.currentOffset().yOffset - scrollOffset,
                    duration: 100.0,
                    curve: Curve.Ease
                )
                this.model.mSelectedItemPosition = Int64(((this.scroller.currentOffset().yOffset - scrollOffset) /
                    this.model.mItemHeight) % Float64(this.YearsArray.size))
            } else {
                this.scroller.scrollTo(
                    xOffset: 0.0,
                    yOffset: this.scroller.currentOffset().yOffset + this.model.mItemHeight -
                        scrollOffset,
                    duration: 100.0,
                    curve: Curve.Ease
                )
                this.model.mSelectedItemPosition = Int64(((this.scroller.currentOffset().yOffset - scrollOffset) /
                    this.model.mItemHeight + 1.0) % Float64(this.YearsArray.size))
            }
        }
        if(let Some(mOnItemSelectedListener) <- this.model.mOnItemSelectedListener) {
            mOnItemSelectedListener.onItemSelected(this.model.mSelectedItemPosition, this.YearsArray[this.model.mSelectedItemPosition].year)
        }
        this.model.setOnItemSelectedListener
    }

    func onScrollEdge(edge: Edge) {
        if (this.model.isCyslic) {
            let scollerBack = ceil(
                (floor(Float64(this.model.mVisibleItem / this.YearsArray.size)) * 3.0) / 2.0 + 1.0) *
                Float64(this.YearsArray.size) * this.model.mItemHeight
            match (edge) {
                case Edge.Top => this.scroller.scrollTo(
                    xOffset: 0.0,
                    yOffset: scollerBack,
                    duration: 0.0,
                    curve: Curve.Ease
                )
                case Edge.Bottom => this.scroller.scrollTo(
                    xOffset: 0.0,
                    yOffset: scollerBack - Float64(2 * this.model.mHalfItemCount + 1) * Float64(this.model.
                            mItemHeight),
                    duration: 0.0,
                    curve: Curve.Ease
                )
                case _ => ()
            }
        }
    }

    func onAppear() {
        this.model.scrollInit(this.scroller1) //初始位置选择s
        var mOffset: Float64 = Float64(this.model.mFirstSelectPosition) * this.model.mItemHeight
        //let mOffset: Float64 = this.scroller.currentOffset().yOffset
        if (this.model.isCyslic) {
            this.scroller1.scrollTo(
                xOffset: 0.0,
                yOffset: mOffset + Float64(this.model.mHalfItemCount) * this.model.mItemHeight,
            )
            this.scroller.scrollTo(
                xOffset: 0.0,
                yOffset: mOffset,
            )
        } else {
//                            mOffset += Float64(this.model.mHalfItemCount) * this.model.mItemHeight
            this.scroller.scrollTo(
                xOffset: 0.0,
                yOffset: mOffset,
            )
        }
    }
}
