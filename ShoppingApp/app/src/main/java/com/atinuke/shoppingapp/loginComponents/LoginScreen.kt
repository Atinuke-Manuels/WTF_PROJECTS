package com.atinuke.shoppingapp.loginComponents

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Lock
import androidx.compose.material.icons.filled.Person
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavController

@Composable
fun LoginScreen(navController: NavController) {
    var password by rememberSaveable { mutableStateOf("")}
    var userName by rememberSaveable { mutableStateOf("")}
    val isImeVisible by rememberImeState()

    GradientBox(modifier = Modifier.fillMaxSize()) {
        Column(
            modifier = Modifier.fillMaxSize(),
            horizontalAlignment = Alignment.CenterHorizontally
        ){
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .fillMaxHeight(if(isImeVisible) 0f else 0.35f),
                contentAlignment = Alignment.Center
            ){
                Text(
                    text = "Welcome to Animation",
                    style = MaterialTheme.typography.headlineMedium,
                    color = Color.White
                )
            }
            Column (
                modifier = Modifier
                    .fillMaxSize()
                    .clip(RoundedCornerShape(topStart = 40.dp, topEnd = 40.dp))
                    .background(Color.White),
                horizontalAlignment = Alignment.CenterHorizontally
            ){
                if(isSmallScreenHeight()){
                    Spacer(modifier = Modifier.fillMaxSize(0.05f))
                }else{
                    Spacer(modifier = Modifier.fillMaxSize(0.1f))
                }
                Text(
                    text = "Login",
                    style = MaterialTheme.typography.headlineMedium,
                    color = Color.Black
                )
                if(isSmallScreenHeight()){
                    Spacer(modifier = Modifier.fillMaxSize(0.05f))
                }else{
                    Spacer(modifier = Modifier.fillMaxSize(0.1f))
                }
                MyTextField(
                    modifier = Modifier.padding(horizontal = 16.dp),
                    value = userName,
                    label = "Username",
                    onValueChange = {titleInput -> userName = titleInput},
                    keyboardOptions = KeyboardOptions(),
                    keyboardActions = KeyboardActions(),
                    trailingIcon = Icons.Default.Person
                )
                Spacer(modifier = Modifier.height(20.dp))
                MyTextField(
                    modifier = Modifier.padding(horizontal = 16.dp),
                    value = password,
                    label = "Password",
                    onValueChange = {titleInput -> password = titleInput},
                    keyboardOptions = KeyboardOptions(),
                    keyboardActions = KeyboardActions(),
                    trailingIcon = Icons.Default.Lock
                )
                Box(modifier = Modifier
                    .fillMaxSize()
                    .padding(horizontal = 16.dp), contentAlignment = Alignment.CenterStart){
                    Button(
                        onClick = { /*TODO*/ },
                        modifier = Modifier.fillMaxWidth(),
                        enabled = if (password == "" || userName == "") false else true,
                        colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF1491CA), contentColor = Color.White),
                        shape = RoundedCornerShape(10.dp)
                        ) {
                        Text(
                            text = "Login",
                            style = TextStyle(fontSize = 18.sp, fontWeight = FontWeight(500))
                            )
                    }
                }
            }
        }
    }

}