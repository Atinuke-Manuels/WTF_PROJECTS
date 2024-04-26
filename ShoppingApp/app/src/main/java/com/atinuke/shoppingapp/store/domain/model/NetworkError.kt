package com.atinuke.shoppingapp.store.domain.model

data class NetworkError(
    val error: ApiError,
    val t : Throwable? = null
)

enum class ApiError(val message: String){
        NetworkError("Network Error"),
        UnknownError("Unknown Error"),
        unknownResponse("Unknown Response")
}
