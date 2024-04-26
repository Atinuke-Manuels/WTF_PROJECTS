package com.atinuke.shoppingapp.store.presentation.util.components

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.atinuke.shoppingapp.util.EventBus
import kotlinx.coroutines.launch

fun ViewModel.sendEvent(event: Any) {
    viewModelScope.launch {
        EventBus.sendEvent(event)
    }
}