/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package wheelpicker

internal import ohos.base.*
internal import ohos.component.*

internal import std.collection.ArrayList
internal import ohos.hilog.*

internal import std.convert.*
internal import std.math.trunc

internal import std.math.*
internal import std.sync.*
internal import std.sync.Timer

extend Float64 {
    operator func %(x: Float64): Float64 {
        return this - trunc(this / x) * x
    }
}