package com.atinuke.shoppingapp.store.presentation.products_screen

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.staggeredgrid.LazyVerticalStaggeredGrid
import androidx.compose.foundation.lazy.staggeredgrid.StaggeredGridCells
import androidx.compose.foundation.lazy.staggeredgrid.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.ExitToApp
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.FloatingActionButton
import androidx.compose.material3.Icon
import androidx.compose.material3.Scaffold
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.navigation.NavController
import com.atinuke.shoppingapp.Routes
import com.atinuke.shoppingapp.store.presentation.products_screen.component.ProductCard
import com.atinuke.shoppingapp.store.presentation.products_screen.component.ProductViewModel
import com.atinuke.shoppingapp.store.presentation.util.components.LoadingDialog
import com.atinuke.shoppingapp.store.presentation.util.components.MyTopAppBar

@Composable
internal fun ProductsScreen(  viewModel: ProductViewModel = hiltViewModel(), navController: NavController){

    val state by viewModel.state.collectAsStateWithLifecycle()
    ProductsContent(state = state, navController = navController)
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ProductsContent(
    state: ProductsViewState,
    navController: NavController
){
    LoadingDialog(isLoading = state.isLoading)
    Scaffold (
        modifier = Modifier.fillMaxSize(),
        topBar = { MyTopAppBar(title = "Products")}
    ){
        LazyVerticalStaggeredGrid(
            modifier = Modifier.padding(top = it.calculateTopPadding()),
            columns = StaggeredGridCells.Fixed(2),
            horizontalArrangement = Arrangement.spacedBy(10.dp),
            verticalItemSpacing = 10.dp
            ){
                items(state.products){product ->
                    ProductCard(product = product)
                }
        }
        FloatingActionButton(
            onClick = {
                navController.navigate(Routes.loginRoute)
            },
            shape = CircleShape,
            containerColor = Color.Cyan
        ) {
            Icon(imageVector = Icons.Filled.ArrowBack, contentDescription = "Back",
            )
        }
    }
}