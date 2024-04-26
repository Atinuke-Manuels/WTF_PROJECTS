package com.atinuke.shoppingapp.store.data.remote

import com.atinuke.shoppingapp.store.domain.model.Product
import retrofit2.http.GET

interface ProductsApi {


    @GET("products")
    suspend fun getProducts(): List<Product>
}