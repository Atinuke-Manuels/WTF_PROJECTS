package com.atinuke.shoppingapp

import androidx.compose.runtime.Composable
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.atinuke.shoppingapp.loginComponents.LoginScreen
import com.atinuke.shoppingapp.store.presentation.products_screen.ProductsScreen
import com.atinuke.shoppingapp.store.presentation.products_screen.component.ProductViewModel

@Composable
fun AppNavigation(productViewModel: ProductViewModel){
    val navController = rememberNavController()

    NavHost(navController = navController, startDestination = "login" ){
        composable(Routes.loginRoute){
            LoginScreen(navController)
        }
        composable(Routes.productsRoute){
            ProductsScreen(productViewModel, navController)
        }
    }
}

object Routes{
    var loginRoute = "login"
    var productsRoute = "products"

}