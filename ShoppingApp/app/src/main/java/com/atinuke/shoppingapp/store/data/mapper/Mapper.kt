package com.atinuke.shoppingapp.store.data.mapper

import com.atinuke.shoppingapp.store.domain.model.ApiError
import com.atinuke.shoppingapp.store.domain.model.NetworkError
import retrofit2.HttpException
import java.io.IOException

fun Throwable.toNetworkError(): NetworkError{
    val error = when(this){
        is IOException -> ApiError.NetworkError
        is HttpException -> ApiError.unknownResponse
        else -> ApiError.UnknownError
    }
    return NetworkError(
        error = error,
        t = this
    )

}