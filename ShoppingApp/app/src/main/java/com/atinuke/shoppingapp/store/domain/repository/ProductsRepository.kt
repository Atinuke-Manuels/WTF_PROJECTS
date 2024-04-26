package com.atinuke.shoppingapp.store.domain.repository

import arrow.core.Either
import com.atinuke.shoppingapp.store.domain.model.NetworkError
import com.atinuke.shoppingapp.store.domain.model.Product

interface ProductsRepository {

    // Either takes in 2 params the first is the error , while the second is what should be displayed if successful
    suspend fun getProducts() : Either<NetworkError, List<Product>>
}