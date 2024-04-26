package com.atinuke.shoppingapp.store.data.repository

import arrow.core.Either
import com.atinuke.shoppingapp.store.data.mapper.toNetworkError
import com.atinuke.shoppingapp.store.data.remote.ProductsApi
import com.atinuke.shoppingapp.store.domain.model.NetworkError
import com.atinuke.shoppingapp.store.domain.model.Product
import com.atinuke.shoppingapp.store.domain.repository.ProductsRepository
import javax.inject.Inject

class ProductsRepositoryImpl @Inject constructor(private val productsApi: ProductsApi) : ProductsRepository {
    override suspend fun getProducts(): Either<NetworkError, List<Product>> {
        return Either.catch {
            productsApi.getProducts()
        }.mapLeft { it.toNetworkError() }
    }
}