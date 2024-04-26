package com.atinuke.shoppingapp.store.presentation.products_screen

import com.atinuke.shoppingapp.store.domain.model.Product

data class ProductsViewState(
    val isLoading: Boolean = false,
    val products: List<Product> = emptyList(),
    val error: String? = null
)
