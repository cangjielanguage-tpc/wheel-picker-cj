/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package wheelpicker

import ohos.state_manage.*
import ohos.state_macro_manage.*

@Component
public class WheelDayPicker {
    private var scrollerDirection: Float64 = 0.0
    @State
    var model: WheelDayPickerModel = WheelDayPickerModel()

    @Builder
    func occupyText() {
        ForEach(
            Array(this.model.mHalfItemCount, repeat: 0),
            itemGeneratorFunc: {
                _: Int64, _: Int64 => Text("").fontSize(this.model.mItemTextSize).padding(this.model.mSpace)
                    .height(this.model.mItemHeight)
            }
        )
    }

    @Builder
    func scrollIndex1(textColor: Color) {
        Column() {
            if (!this.model.isCyslic) {
                ForEach(
                    this.model.mData,
                    itemGeneratorFunc: {
                        item: Int64, _: Int64 => Text("${item}").fontSize(this.model.mItemTextSize).height(
                            this.model.mItemHeight).fontColor(textColor).fontFamily(this.model.mFontFamily).padding(
                            this.model.mSpace).align(Alignment.Center)
                    }
                )
            } else if (this.model.mVisibleItem < this.model.mData.size) {
                ForEach(
                    Array(3, repeat: 0),
                    itemGeneratorFunc: {
                        _: Int64, _: Int64 => ForEach(
                            this.model.mData,
                            itemGeneratorFunc: {
                                item: Int64, _: Int64 => Text("${item}").fontSize(this.model.mItemTextSize).height(
                                    this.model.mItemHeight).fontColor(textColor).fontFamily(this.model.mFontFamily).
                                    padding(this.model.mSpace).align(Alignment.Center)
                            }
                        )
                    }
                )
            } else {
                ForEach(
                    Array(Int64(ceil(Float64(this.model.mVisibleItem / this.model.mData.size)) * 3.0), repeat: 0),
                    itemGeneratorFunc: {
                        _: Int64, _: Int64 => ForEach(
                            this.model.mData,
                            itemGeneratorFunc: {
                                item: Int64, _: Int64 => Text("${item}").fontSize(this.model.mItemTextSize).height(
                                    this.model.mItemHeight).fontColor(textColor).fontFamily(this.model.mFontFamily).
                                    padding(this.model.mSpace).align(Alignment.Center)
                            }
                        )
                    }
                )
            }
        }.width(60.percent).alignItems(this.model.mAlign)
    }

    protected override func aboutToAppear() {
        this.model.updateVisibleItemCount1()
    }

    func build() {
        Row() {
            Stack() {
                Scroll(this.model.scroller) {
                    scrollIndexColumn1()
                }
                .height(this.model.mWheelHeight).backgroundColor(this.model.scrollBgColor).scrollBar(BarState.Off)
                .zIndex(1)
                .onScroll({
                   offset => onScroll5(offset)
                }).onScrollEnd({
                        => onScrollEnd0()
                }).onScrollEdge({
                    edge => onScrollEdge(edge)
                }).onAppear({ => onAppear()
                })
                isHasIndicator()
                scrollModel()
                isHasAtmospheric2()
            }.align(Alignment.Center)
        }
    }

    @Builder
    func scrollIndexColumn1() {
        Column() {
            if (!this.model.isCyslic) {
                this.occupyText()
            }
            this.scrollIndex1(this.model.mItemTextColor)
            if (!this.model.isCyslic) {
                this.occupyText()
            }
        }
    }

    func onAppear() {
        this.model.scrollInit(this.model.scroller1)
        var mOffset: Float64 = Float64(this.model.mSelectedItemPosition) * this.model.mItemHeight
        var yOffset = 0.0
        if(this.model.mSelectedItemPosition < 0 || this.model.mData.size < this.model.mSelectedItemPosition){
            mOffset = Float64(this.model.mData.size) * this.model.mItemHeight
            yOffset = mOffset - Float64(this.model.mHalfItemCount + 1) * this.model.mItemHeight
        } else if (this.model.mSelectedItemPosition == 0){
            yOffset = 1.0
        } else {
            yOffset = mOffset + Float64(this.model.mData.size - this.model.mHalfItemCount) * this.model.mItemHeight
        }
        isCyslic(mOffset, yOffset)
        onAppear1()
    }

    func onAppear1() {
        if(this.model.mSelectedItemPosition < 0 || this.model.mData.size < this.model.mSelectedItemPosition){
            onAppear2()
        } else {
            onAppear3()
        }
        this.model.setOnItemSelectedListener
    }

    func onAppear2() {
        if(let Some(mOnItemSelectedListener) <- this.model.mOnItemSelectedListener) {
            mOnItemSelectedListener.onItemSelected(this.model.mData.size -1, this.model.mData[this.model.mData.size - 1])
        }
    }

    func onAppear3() {
        if(let Some(mOnItemSelectedListener) <- this.model.mOnItemSelectedListener) {
            mOnItemSelectedListener.onItemSelected(this.model.mSelectedItemPosition, this.model.mData[this.model.mSelectedItemPosition])
        }
    }

    @Builder
    func scrollModel(){
        Column() {
            Scroll(this.model.scroller1) {
                Column() {
                    this.scrollIndex1(this.model.mSelectedItemTextColor)
                }
            }.height(this.model.mItemHeight).enabled(false).backgroundColor(this.model.mCurtainColor).scrollBar(
                BarState.Off)
        }.zIndex(2)
        .backgroundColor(Color.RED)
    }

    func isCyslic(mOffset: Float64, yOffset: Float64){
        if (this.model.isCyslic) {
            this.model.scroller1.scrollTo(
                xOffset: 0.0,
                yOffset: mOffset + Float64(this.model.mData.size - this.model.mHalfItemCount) * this.model.mItemHeight,
            )
            this.model.scroller.scrollTo(
                xOffset: 0.0,
                yOffset:  yOffset,
            )
        } else {
            this.model.scroller.scrollTo(
                xOffset: 0.0,
                yOffset: mOffset,
            )
        }
    }

    func onScroll5(offset: OffsetResult) {
        let mOffset: Float64 = this.model.scroller.currentOffset().yOffset
        if (this.model.isCyslic) {
            this.model.scroller1.scrollTo(
                xOffset: 0.0,
                yOffset: mOffset + Float64(this.model.mHalfItemCount) * this.model.mItemHeight,
            )
        } else {
            this.model.scroller1.scrollTo(
                xOffset: 0.0,
                yOffset: mOffset,
            )
        }
    }

    func onScrollEnd0() {
        let scrollOffset: Float64 = this.model.scroller.currentOffset().yOffset % this.model.mItemHeight
        if (scrollOffset > (this.model.mItemHeight / 2.0)) {
            onScrollEnd1(scrollOffset)
            onScrollEnd2(scrollOffset)
        } else if (scrollOffset > 0.0 && scrollOffset < (this.model.mItemHeight / 2.0)) {
            onScrollEnd4(scrollOffset)
        }
        if(let Some(mOnItemSelectedListener) <- this.model.mOnItemSelectedListener) {
            mOnItemSelectedListener.onItemSelected(this.model.mSelectedItemPosition, this.model.mData[this.model.mSelectedItemPosition])
        }
        this.model.setOnItemSelectedListener
    }

    func onScrollEnd1(scrollOffset: Float64) {
        if (scrollerDirection <= 0.0) {
            this.model.scroller.scrollTo(
                xOffset: 0.0,
                yOffset: this.model.scroller.currentOffset().yOffset - scrollOffset + this.model.
                    mItemHeight,
                duration: this.model.mDuration,
                curve: Curve.Ease
            )
            this.model.mSelectedItemPosition = Int64(((this.model.scroller.currentOffset().yOffset -
                    scrollOffset) / this.model.mItemHeight + 1.0) % Float64(this.model.mData.size))
        }
    }

    func onScrollEnd2(scrollOffset: Float64) {
        if (this.model.isCyslic) {
            this.model.mSelectedItemPosition = Int64((this.model.mSelectedItemPosition + this.model.
                    mHalfItemCount) % this.model.mData.size)
            this.model.mSelectedData = this.model.mData[this.model.mSelectedItemPosition].toString()
        } else {
            this.model.mSelectedData = this.model.mData[Int64((this.model.mSelectedItemPosition) %
                        this.model.mData.size)].toString()
        }
    }

    func onScrollEnd4(scrollOffset: Float64) {
        if (this.scrollerDirection <= 0.0) { // 小于0，向下滑动，大于0是，是向上滑动
            this.model.scroller.scrollTo(
                xOffset: 0.0,
                yOffset: this.model.scroller.currentOffset().yOffset - scrollOffset,
                duration: this.model.mDuration,
                curve: Curve.Ease
            )
            this.model.mSelectedItemPosition = Int64(((this.model.scroller.currentOffset().yOffset -
                    scrollOffset) / this.model.mItemHeight) % Float64(this.model.mData.size))
        }
    }

    func onScrollEdge(edge: Edge) {
        if (this.model.isCyslic) {
            let scollerBack: Float64 = ceil(
                (floor(Float64(this.model.mVisibleItem / this.model.mData.size)) * 3.0) / 2.0 + 1.0) *
                Float64(this.model.mData.size) * this.model.mItemHeight
            match (edge) {
                case Edge.Top => this.model.scroller.scrollTo(
                    xOffset: 0.0,
                    yOffset: scollerBack,
                    duration: 0.0,
                    curve: Curve.Ease
                )
                case Edge.Bottom => this.model.scroller.scrollTo(
                    xOffset: 0.0,
                    yOffset: scollerBack - Float64(2 * this.model.mHalfItemCount + 1) * this.model.
                        mItemHeight,
                    duration: 0.0,
                    curve: Curve.Ease
                )
                case _ => ()
            }
        }
    }

    @Builder
    func isHasIndicator() {
        if (this.model.hasIndicator) {
            Divider().offset(x: 0.0, y: -this.model.mItemHeight / 2.0).color(this.model.mIndicatorColor).width(
                30.percent).strokeWidth(this.model.mIndicatorSize).zIndex(2)
            Divider().offset(x: 0.0, y: this.model.mItemHeight / 2.0).color(this.model.mIndicatorColor).width(
                30.percent).strokeWidth(this.model.mIndicatorSize).zIndex(2)
        }
    }

    @Builder
    func isHasAtmospheric2() {
        if (this.model.hasAtmospheric) {
            Flex(FlexParams()).height(this.model.mWheelHeight)
                .width(30.percent)
                .linearGradient(
                    direction: GradientDirection.Top,
                    colors: this.model.atmosphericColor,
                    repeating: false
                ).opacity(0.1)
                .zIndex(3)
                .height(this.model.mItemHeight)
        }
    }
}
