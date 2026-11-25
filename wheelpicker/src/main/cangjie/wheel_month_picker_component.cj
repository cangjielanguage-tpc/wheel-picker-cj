/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package wheelpicker

import ohos.state_manage.*
import ohos.state_macro_manage.*

@Component
public class WheelMonthPicker {
    private var scrollerDirection: Float64 = 0.0
    @State
    var model: WheelMonthPickerModel = WheelMonthPickerModel()

    @Builder
    func scrollIndex(textColor: Color) {
        Column() {
            if (!this.model.isCyslic) {
                ForEach(
                    this.model.mData,
                    itemGeneratorFunc: {
                        item: Int64, _: Int64 => Text(item.toString()).fontSize(this.model.mTextHeight)
                        .padding(this.model.mSpace).height(this.model.mItemHeight).fontColor(textColor)
                        .fontFamily(this.model.mFontFamily)
                    }
                )
            } else if (this.model.mVisibleItem < this.model.mData.size) {
                ForEach(
                    Array(3, repeat: 0),
                    itemGeneratorFunc: {
                        _: Int64, _: Int64 => ForEach(
                            this.model.mData,
                            itemGeneratorFunc: {
                                item: Int64, _: Int64 => Text(item.toString()).fontSize(this.model.mTextHeight).height(
                                    this.model.mItemHeight).padding(this.model.mSpace).fontColor(textColor)
                                    .fontFamily(this.model.mFontFamily)
                            }
                        )
                    }
                )
            } else {
                ForEach(
                    Array(Int64(3.0 * ceil(Float64(this.model.mVisibleItem / this.model.mData.size))), repeat: 0),
                    itemGeneratorFunc: {
                        _: Int64, _: Int64 => ForEach(
                            this.model.mData,
                            itemGeneratorFunc: {
                                item: Int64, _: Int64 => Text(item.toString()).padding(this.model.mSpace)
                                .fontSize(this.model.mTextHeight).height(this.model.mItemHeight).fontColor(textColor)
                                .fontFamily(this.model.mFontFamily)
                            }
                        )
                    }
                )
            }
        }.width(60.percent).alignItems(this.model.mAlign)
    }

    @Builder
    func occupyText() {
        ForEach(
            Array(this.model.mHalfItemCount, repeat: 0),
            itemGeneratorFunc: {
                _: Int64, _: Int64 => Text("").padding(this.model.mSpace).fontSize(this.model.mItemTextSize)
                .height(this.model.mItemHeight)
            }
        )
    }

    protected override func aboutToAppear() {
        this.model.updateVisibleItemCount()
    }

    func customOnAppear() {
            let mOffset: Float64 = Float64(this.model.mFirstSelectPosition) * this.model.mItemHeight
            if (this.model.isCyslic) {
                this.model.scroller1.scrollTo(
                    xOffset: 0.0,
                    yOffset: mOffset,
                )
                this.model.scroller.scrollTo(
                    xOffset: 0.0,
                    yOffset: mOffset + Float64(this.model.mHalfItemCount) * this.model.mItemHeight,
                )
            } else {
                this.model.scroller.scrollTo(
                    xOffset: 0.0,
                    yOffset: mOffset,
                )
            }
    }

    func build() {
        Row() {
            Stack() {
                Scroll(this.model.scroller) {
                    scrollIndexColumn()
                }
                .zIndex(1)
                .height(this.model.mWheelHeight).backgroundColor(this.model.scrollBgColor).scrollBar(BarState.Off)
                .onScroll({
                    offset => onScroll1(offset)
                }).onScrollEnd({
                        => onScrollEnd1()
                }).onScrollEdge({
                    edge => onScrollEdge(edge)
                }).onAppear({=>customOnAppear()})
                isHasIndicator1()
                scrollIndexModel1()
                isHasAtmospheric1()
            }.align(Alignment.Center)
        }
    }

    @Builder
    func scrollIndexColumn() {
        Column() {
            if (!this.model.isCyslic) {
                this.occupyText()
            }
            this.scrollIndex(this.model.mItemTextColor)
            if (!this.model.isCyslic) {
                this.occupyText()
            }
        }
    }

    @Builder
    func scrollIndexModel1() {
        Column() {
            Scroll(this.model.scroller1) {
                Column() {
                    this.scrollIndex(this.model.mSelectedItemTextColor)
                }
            }.enabled(false).height(this.model.mItemHeight).backgroundColor(this.model.mCurtainColor).scrollBar(
                BarState.Off)
        }.backgroundColor(Color.RED).zIndex(2)
    }

    @Builder
    func isHasIndicator1() {
        if (this.model.hasIndicator) {
            Divider().offset(x: 0.0, y: -this.model.mItemHeight / 2.0).zIndex(2)
                .color(this.model.mIndicatorColor).width(30.percent).strokeWidth(this.model.mIndicatorSize)
            Divider().offset(x: 0.0, y: this.model.mItemHeight / 2.0).color(this.model.mIndicatorColor)
                .width(30.percent).strokeWidth(this.model.mIndicatorSize).zIndex(2)
        }
    }

    @Builder
    func isHasAtmospheric1() {
        if (this.model.hasAtmospheric) {
            Flex(FlexParams()).zIndex(3)
                .opacity(0.1).width(30.percent)
                .height(this.model.mWheelHeight)
                .linearGradient(
                    direction: GradientDirection.Top,
                    colors: this.model.atmosphericColor,
                    repeating: false
                ).height(this.model.mItemHeight)
        }
    }

    func onScroll1(offset: OffsetResult) {
        let mOffset: Float64 = this.model.scroller.currentOffset().yOffset
        if (this.model.isCyslic) {
            this.model.scroller1.scrollTo(
                xOffset: 0.0,
                yOffset: mOffset + this.model.mItemHeight * Float64(this.model.mHalfItemCount),
            )
        } else {
            this.model.scroller1.scrollTo(
                xOffset: 0.0,
                yOffset: mOffset,
            )
        }
    }

    func onScrollEnd1() {
        let scrollOffset: Float64 = this.model.scroller.currentOffset().yOffset % this.model.mItemHeight
        if (scrollOffset > (this.model.mItemHeight / 2.0)) {
            onScrollEnd2(scrollOffset)
            onScrollEnd3(scrollOffset)
        } else if (scrollOffset > 0.0 && scrollOffset < (this.model.mItemHeight / 2.0)) {
            onScrollEnd4(scrollOffset)
            onScrollEnd5(scrollOffset)
        }
        if(let Some(mOnItemSelectedListener) <- this.model.mOnItemSelectedListener) {
            mOnItemSelectedListener.onItemSelected(this.model.mSelectedItemPosition, this.model.mData[this.model.mSelectedItemPosition])
        }
        this.model.setOnItemSelectedListener
    }

    func onScrollEnd2(scrollOffset2: Float64) {
        if (scrollerDirection <= 0.0) {
            this.model.scroller.scrollTo(
                xOffset: 0.0,
                yOffset: this.model.scroller.currentOffset().yOffset + this.model.mItemHeight - scrollOffset2,
                duration: this.model.mDuration,
                curve: Curve.Ease
            )
            this.model.mSelectedItemPosition = Int64(((this.model.scroller.currentOffset().yOffset -
                    scrollOffset2) / this.model.mItemHeight + 1.0) % Float64(this.model.mData.size))
        }
    }

    func onScrollEnd3(scrollOffset3: Float64) {
        if (this.model.isCyslic) {
            this.model.mSelectedItemPosition = Int64((this.model.mHalfItemCount
                + this.model.mSelectedItemPosition) % this.model.mData.size)
            this.model.mSelectedData = this.model.mData[this.model.mSelectedItemPosition].toString()
        } else {
            this.model.mSelectedData = this.model.mData[Int64((this.model.mSelectedItemPosition) %
                        this.model.mData.size)].toString()
        }
    }

    func onScrollEnd4(scrollOffset4: Float64) {
        if (this.scrollerDirection <= 0.0) { // 小于0，向下滑动，大于0是，是向上滑动
            this.model.scroller.scrollTo(
                xOffset: 0.0,
                yOffset: this.model.scroller.currentOffset().yOffset - scrollOffset4,
                duration: this.model.mDuration,
                curve: Curve.Ease
            )
            this.model.mSelectedItemPosition = Int64(((this.model.scroller.currentOffset().yOffset -
                    scrollOffset4) / this.model.mItemHeight) % Float64(this.model.mData.size))
        }
    }

    func onScrollEnd5(scrollOffset: Float64) {
        if (this.model.isCyslic) {
            this.model.mSelectedItemPosition = Int64((this.model.mSelectedItemPosition + this.model.
                    mHalfItemCount) % this.model.mData.size)
            this.model.mSelectedData = this.model.mData[this.model.mSelectedItemPosition].toString()
        } else {
            this.model.mSelectedData = this.model.mData[this.model.mSelectedItemPosition].toString()
        }
    }

    func onScrollEdge(edge: Edge) {
        if (this.model.isCyslic) {
            let scollerBack: Float64 = ceil(
                (floor(Float64(this.model.mVisibleItem / this.model.mData.size)) * 3.0) / 2.0 + 1.0)
                * this.model.mItemHeight * Float64(this.model.mData.size)
            match (edge) {
                case Edge.Top => this.model.scroller.scrollTo(
                    xOffset: 0.0,
                    yOffset: scollerBack,
                    duration: 0.0,
                    curve: Curve.Ease
                )
                case Edge.Bottom => this.model.scroller.scrollTo(
                    xOffset: 0.0,
                    yOffset: scollerBack - Float64(1 + 2 * this.model.mHalfItemCount)
                        * this.model.mItemHeight,
                    duration: 0.0,
                    curve: Curve.Ease
                )
                case _ => ()
            }
        }
    }
}
