/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package wheelpicker

import ohos.state_manage.*
import ohos.state_macro_manage.*

@Component
public class WheelDayPicker {
    @State
    var model: WheelDayPickerModel = WheelDayPickerModel()
    private var scrollerDirection: Float64 = 0.0

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
    func scrollIndex(textColor: Color) {
        Column() {
            if (!this.model.isCyslic) {
                ForEach(
                    this.model.mData,
                    itemGeneratorFunc: {
                        item: Int64, _: Int64 => Text("${item}").fontSize(this.model.mItemTextSize).height(
                            this.model.mItemHeight).fontColor(textColor).fontFamily(this.model.mFontFamily).padding(
                            this.model.mSpace)
                    }
                )
            } else if (this.model.mVisibleItem < this.model.mData.size) {
                ForEach(
                    Array(3, item: 0),
                    itemGeneratorFunc: {
                        _: Int64, _: Int64 => ForEach(
                            this.model.mData,
                            itemGeneratorFunc: {
                                item: Int64, _: Int64 => Text("${item}").fontSize(this.model.mItemTextSize).height(
                                    this.model.mItemHeight).fontColor(textColor).fontFamily(this.model.mFontFamily).
                                    padding(this.model.mSpace)
                            }
                        )
                    }
                )
            } else {
                ForEach(
                    Array(Int64(ceil(Float64(this.model.mVisibleItem / this.model.mData.size)) * 3.0), item: 0),
                    itemGeneratorFunc: {
                        _: Int64, _: Int64 => ForEach(
                            this.model.mData,
                            itemGeneratorFunc: {
                                item: Int64, _: Int64 => Text("${item}").fontSize(this.model.mItemTextSize).height(
                                    this.model.mItemHeight).fontColor(textColor).fontFamily(this.model.mFontFamily).
                                    padding(this.model.mSpace)
                            }
                        )
                    }
                )
            }
        }.width(30.percent).alignItems(this.model.mAlign)
    }

    protected override func aboutToAppear() {
        this.model.updateVisibleItemCount()
        Timer.once(
            Duration.microsecond * 300,
            {
                =>
                this.model.scrollInit(this.model.scroller1)
                let mOffset: Float64 = this.model.scroller.currentOffset().yOffset
                if (this.model.isCyslic) {
                    this.model.scroller1.scrollTo(
                        xOffset: 0.0,
                        yOffset: mOffset + Float64(this.model.mHalfItemCount) * this.model.mItemHeight,
                    )
                    this.model.scroller.scrollTo(
                        xOffset: 0.0,
                        yOffset: 1.0,
                    )
                } else {
                    this.model.scroller1.scrollTo(
                        xOffset: 0.0,
                        yOffset: mOffset + this.model.mItemHeight * Float64(this.model.mSelectedItemPosition),
                    )
                }
            }
        )
        return
    }

    func build() {
        Row() {
            Stack() {
                Scroll(this.model.scroller) {
                    Column() {
                        if (!this.model.isCyslic) {
                            this.occupyText()
                        }
                        this.scrollIndex(this.model.mItemTextColor)
                        if (!this.model.isCyslic) {
                            this.occupyText()
                        }
                    }
                }.height(this.model.mWheelHeight).backgroundColor(this.model.scrollBgColor).scrollBar(BarState.Off).
                    onScroll(
                    {
                        offset =>
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
                ).onScrollEnd(
                    {
                        =>
                        let scrollOffset: Float64 = this.model.scroller.currentOffset().yOffset % this.model.mItemHeight
                        if (scrollOffset > (this.model.mItemHeight / 2.0)) {
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
                            if (this.model.isCyslic) {
                                this.model.mSelectedItemPosition = Int64((this.model.mSelectedItemPosition + this.model.
                                        mHalfItemCount) % this.model.mData.size)
                                this.model.mSelectedData = this.model.mData[this.model.mSelectedItemPosition].toString()
                            } else {
                                this.model.mSelectedData = this.model.mData[Int64((this.model.mSelectedItemPosition) %
                                            this.model.mData.size)].toString()
                            }
                        } else if (scrollOffset > 0.0 && scrollOffset < (this.model.mItemHeight / 2.0)) {
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
                            if (this.model.isCyslic) {
                                this.model.mSelectedItemPosition = Int64((this.model.mSelectedItemPosition + this.model.
                                        mHalfItemCount) % this.model.mData.size)
                                this.model.mSelectedData = this.model.mData[this.model.mSelectedItemPosition].toString()
                            } else {
                                this.model.mSelectedData = this.model.mData[this.model.mSelectedItemPosition].toString()
                            }
                        }

                        if(let Some(mOnItemSelectedListener) <- this.model.mOnItemSelectedListener) {
                            mOnItemSelectedListener.onItemSelected(this.model.mSelectedItemPosition, this.model.mData[this.model.mSelectedItemPosition])
                        }
                        this.model.setOnItemSelectedListener
                    }
                ).onScrollEdge(
                    {
                    edge =>
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
                })

                if (this.model.hasIndicator) {
                    Divider().offset(x: 0.0, y: -this.model.mItemHeight / 2.0).color(this.model.mIndicatorColor).width(
                        30.percent).strokeWidth(this.model.mIndicatorSize).zIndex(2)
                    Divider().offset(x: 0.0, y: this.model.mItemHeight / 2.0).color(this.model.mIndicatorColor).width(
                        30.percent).strokeWidth(this.model.mIndicatorSize).zIndex(2)
                }
                Column() {
                    Scroll(this.model.scroller1) {
                        Column() {
                            this.scrollIndex(this.model.mSelectedItemTextColor)
                        }
                    }.height(this.model.mItemHeight).enabled(false).backgroundColor(this.model.mCurtainColor).scrollBar(
                        BarState.Off)
                }

                if (this.model.hasAtmospheric) {
                    Flex(FlexParams(direction: FlexDirection.Column)).width(30.percent).height(this.model.mWheelHeight).
                        linearGradient(
                        angle: 0.0,
                        direction: GradientDirection.Top,
                        colors: [(Color(0xffE5DEEB), 0.0), (Color(0x00E5DEEB), 0.5), (Color(0xffE5DEEB), 1.0)]
                    ).zIndex(-1)
                }
            }
        }
    }
}
