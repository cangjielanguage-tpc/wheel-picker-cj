/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package wheelpicker

public interface OnItemSelectedListener {
        /**
         * 当滚轮选择器数据项被选中时回调该方法
         * 滚动选择器滚动停止后会回调该方法并将当前选中的数据和数据在数据列表中对应的位置返回
         *
         * @param position 当前选中的数据在数据列表中的位置
         * @param data 当前选中的数据
         */
        public func onItemSelected(position: Int64, data: Int64): Unit
}
public interface OnAreaSelectedListener {

        public func onProvinceSelected(provincePos: Int64, provinceName: String): Unit
        public func onCitySelected(cityPos: Int64, cityName: String): Unit
        public func onAreaSelected(areaPos: Int64, areaName: String): Unit
}