package com.atinuke.shoppingapp

import android.os.Bundle
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalLifecycleOwner
import androidx.compose.ui.tooling.preview.Preview
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.repeatOnLifecycle
import androidx.lifecycle.viewmodel.compose.viewModel
import com.atinuke.shoppingapp.store.presentation.products_screen.ProductsScreen
import com.atinuke.shoppingapp.store.presentation.products_screen.component.ProductViewModel
import com.atinuke.shoppingapp.ui.theme.ShoppingAppTheme
import com.atinuke.shoppingapp.util.Event
import com.atinuke.shoppingapp.util.EventBus
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            ShoppingAppTheme {
                val lifecycle = LocalLifecycleOwner.current.lifecycle
                LaunchedEffect(key1 = lifecycle){
                    repeatOnLifecycle(state = Lifecycle.State.STARTED){
                        EventBus.events.collect{event ->
                            if(event is Event.Toast){
                                Toast.makeText(this@MainActivity, event.message, Toast.LENGTH_LONG)
                                    .show()
                            }

                        }
                    }
                }
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    val productViewModel: ProductViewModel= viewModel()
                    AppNavigation(productViewModel)
                }
            }
        }
    }
}

