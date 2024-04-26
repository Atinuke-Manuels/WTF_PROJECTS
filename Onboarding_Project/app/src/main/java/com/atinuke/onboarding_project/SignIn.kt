package com.atinuke.onboarding_project

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import org.w3c.dom.Text

class SignIn : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_sign_in)

        var signInBtn : Button = findViewById(R.id.signIn)

        signInBtn.setOnClickListener{

            var intent = Intent(this, MainActivity::class.java)

            startActivity(intent)
        }


        var register: TextView = findViewById(R.id.sign_in_register)

        register.setOnClickListener{
            var intent = Intent(this, Register::class.java)

            startActivity(intent)
        }
    }
}