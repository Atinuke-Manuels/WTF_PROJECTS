package com.atinuke.onboarding_project

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)


        var homeSignIn : Button = findViewById(R.id.home_sigIn)

        homeSignIn.setOnClickListener{
            var intent = Intent(this, SignIn::class.java)

            startActivity(intent)
        }


        var registerBtn: Button = findViewById(R.id.home_register)

        registerBtn.setOnClickListener{
            var intent = Intent(this, Register::class.java)

            startActivity(intent)

        }
    }

}