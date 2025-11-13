/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package wheelpicker

import ohos.state_manage.*
import ohos.state_macro_manage.*

@Component
public class WheelPicker {
    @Link
    var model: WheelPickerModel = WheelPickerModel()
    private var scrollSwitch: Bool = true
    private var scrollOffset: Float64 = 0.0

    @Builder
    func occupyText() {
        ForEach(
            Array(this.model.mHalfItemCount, repeat: 0),
            itemGeneratorFunc: {
                _: Int64, _: Int64 => Text("").height(this.model.mItemHeight).padding(this.model.mSpace)
                    .fontSize(this.model.mItemTextSize)
            }
        )
    }
    @Builder
    func scrollIndex5(textColor: Color) {
        Column() {
            if (!this.model.isCyslic) {
                ForEach(
                    this.model.mData,
                    itemGeneratorFunc: {
                        item: String, _: Int64 => Text("${item}").fontSize(this.model.mItemTextSize).height(
                            this.model.mItemHeight).fontColor(textColor).fontFamily(this.model.mFontFamily).padding(
                            this.model.mSpace)
                    }
                )
            } else if (this.model.mVisibleItem < this.model.mData.size) {
                ForEach(
                    Array(3, repeat: 0),
                    itemGeneratorFunc: {
                        _: Int64, _: Int64 => ForEach(
                            this.model.mData,
                            itemGeneratorFunc: {
                                item: String, _: Int64 => Text("${item}").fontSize(this.model.mItemTextSize).height(
                                    this.model.mItemHeight).fontColor(textColor).fontFamily(this.model.mFontFamily).
                                    padding(this.model.mSpace)
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
                                item: String, _: Int64 => Text("${item}").fontSize(this.model.mItemTextSize).height(
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
            Duration.millisecond * 100,
            {
                =>
                this.model.scrollInit(this.model.scroller)
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
                      yOffset: mOffset,
                    )
                }
            }
        )
        return
    }
    func build() {
        Row() {
            Stack(){
                Scroll(this.model.scroller) {
                    Column() {
                        if (!this.model.isCyslic) {
                            this.occupyText()
                        }
                        this.scrollIndex5(this.model.mItemTextColor)
                        if (!this.model.isCyslic) {
                            this.occupyText()
                        }
                    }
                 }
                .zIndex(1)
                .height(this.model.mWheelHeight)
                .backgroundColor(this.model.scrollBgColor)
                .scrollBar(BarState.Off)
                .onTouch({ event =>
                    match (event.eventType) {
                    	case TouchType.Up => this.scrollSwitch = true
                        case _ =>()
                    }
                })
                .onScroll({ offset => onScroll(offset)
                })
                .onScrollEnd({ => onScrollEnd()
                    })
                .onScrollEdge({edge =>
                    onScrollEdge(edge)
                })
                //------------------------选中边框线------------------
                isHasIndicator()
                //--------------------选中项------------------
                scrollerModel5()
                isHasAtmospheric5()
            }
        }
    }

    func onScroll(offset: OffsetResult){
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

    func onScrollEnd1(){
        if (this.model.isCyslic) {
            this.model.mSelectedItemPosition = Int64(((this.model.scroller.currentOffset()
              .yOffset - this.scrollOffset) / this.model.mItemHeight + 1.0) % Float64(this.model.mData.size) + Float64(this.model.mHalfItemCount)) % this.model.mData.size
            this.model.mSelectedData = this.model.mData[this.model.mSelectedItemPosition]
        } else {
            this.model.mSelectedItemPosition = Int64((
              this.model.scroller.currentOffset()
                .yOffset - this.scrollOffset) / this.model.mItemHeight + 1.0) % this.model.mData.size
            this.model.mSelectedData = this.model.mData[(this.model.mSelectedItemPosition)%this.model.mData.size]
        }
    }

    func onScrollEnd2(){
        if (this.model.isCyslic) {
            this.model.mSelectedItemPosition = (this.model.mSelectedItemPosition + this.model.mHalfItemCount) % this.model.mData.size
            this.model.mSelectedData = this.model.mData[this.model.mSelectedItemPosition]
        } else {
            this.model.mSelectedData = this.model.mData[this.model.mSelectedItemPosition]
        }
    }

    func onScrollEnd(){
        if (this.scrollSwitch) {
            this.scrollSwitch = false
            this.scrollOffset = this.model.scroller.currentOffset().yOffset % this.model.mItemHeight
            if (this.scrollOffset >= (this.model.mItemHeight - 1.0) && this.scrollOffset <= 1.0) {
                return
            }
            if (this.scrollOffset >= (this.model.mItemHeight / 2.0) && this.scrollOffset < (this.model.mItemHeight - 1.0)) {
                this.model.scroller.scrollTo(
                    xOffset: 0.0,
                    yOffset: this.model.scroller.currentOffset().yOffset - this.scrollOffset + this.model.mItemHeight,
                    duration: this.model.mDuration,
                    curve: Curve.Ease
                )
                onScrollEnd1()
                this.model.mSelectDataShow(this.model.mSelectedData)
            } else if (this.scrollOffset > 1.0 && this.scrollOffset < (this.model.mItemHeight / 2.0)) {
                this.model.scroller.scrollTo(
                    xOffset: 0.0,
                    yOffset: this.model.scroller.currentOffset().yOffset - this.scrollOffset,
                    duration: this.model.mDuration,
                    curve: Curve.Ease
                )
                this.model.mSelectedItemPosition = Int64((
                this.model.scroller.currentOffset()
                  .yOffset - this.scrollOffset) / this.model.mItemHeight) % this.model.mData.size
                onScrollEnd2()
                this.model.mSelectDataShow(this.model.mSelectedData)
            }
        }
    }

    func onScrollEdge(edge: Edge) {
        if (this.model.isCyslic) {
            let scollerBack = ceil((floor(Float64(this.model.mVisibleItem / this.model.mData.size)) * 3.0) / 2.0 + 1.0) * Float64(this.model.mData.size) * this.model.mItemHeight
            match (edge) {
                case Edge.Top => this.model.scroller.scrollTo(
                    xOffset: 0.0,
                    yOffset: scollerBack,
                    duration: 0.0,
                    curve: Curve.Linear
                )
                case Edge.Bottom => this.model.scroller.scrollTo(
                    xOffset: 0.0,
                    yOffset: scollerBack - Float64(2 * this.model.mHalfItemCount + 1) * this.model.
                        mItemHeight,
                    duration: 0.0,
                    curve: Curve.Linear
                )
                case _ => ()
            }
        }
    }

    @Builder
    func isHasIndicator() {
        if (this.model.hasIndicator) {
            Divider()
            .offset( x: 0.0, y: -this.model.mItemHeight / 2.0 )
            .width(30.percent)
            .strokeWidth(this.model.mIndicatorSize)
            .zIndex(2).color(this.model.mIndicatorColor)
            Divider()
            .color(this.model.mIndicatorColor)
            .width(30.percent)
            .strokeWidth(this.model.mIndicatorSize)
            .zIndex(2).offset( x: 0.0, y: this.model.mItemHeight / 2.0 )
        }
    }

    @Builder
    func scrollerModel5() {
        Column() {
            Scroll(this.model.scroller1) {
                Column() {
                  this.scrollIndex5(this.model.mSelectedItemTextColor)
                }
            }.enabled(false)
            .height(this.model.mItemHeight)
            .backgroundColor(this.model.mCurtainColor)
            .scrollBar(BarState.Off)
        }.backgroundColor(Color.RED).zIndex(2)
    }

    @Builder
    func isHasAtmospheric5() {
        if (this.model.hasAtmospheric) {
            Flex(FlexParams())
                .width(30.percent)
                .height(this.model.mWheelHeight)
                .linearGradient(
                    direction: GradientDirection.Top,
                    colors: this.model.atmosphericColor,
                    repeating: false
            ).height(this.model.mItemHeight)
            .zIndex(3)
            .opacity(0.1)
        }
    }
}