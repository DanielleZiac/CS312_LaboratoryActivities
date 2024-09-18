package com.example.demo2_registration;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class RegisterActivity extends AppCompatActivity {

    EditText username,password,email,phone,interest,birthdate,birthtime;
    AutoCompleteTextView country;
    AutoCompleteTextView provinces;
    //Spinner provinces;
    Button btnRegister;
    //ArrayAdapter arrayAdapter,arrayAdapter1;

    String[] Country={"India","Indonesia","Africa","Afghanistan"};
    String[] province={"Region 1", "Region 2", "Region 3", "Region 4", "Region 5", "Region 6", "Region 7", "Region 8", "Region 9", "Region 10", "Region 11", "Region 12", "NCR","CAR","ARIM","CARAGA"};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        EdgeToEdge.enable(this);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
        btnRegister= (Button) findViewById(R.id.btnRegister);

        //AutoCompleteTextView province = findViewById((R.id.autoCompleteTextViewProvinces));

//        ArrayAdapter<String> provinceAdapter = new ArrayAdapter<String>(RegisterActivity.this, android.R.layout.simple_spinner_dropdown_item, province);
//        provinceAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item); // Set dropdown layout for Spinner
//        provinces.setAdapter(provinceAdapter);
//        provinces.setThreshold(1);

        provinces= (AutoCompleteTextView) findViewById(R.id.autoCompleteTextViewProvinces);
        country= (AutoCompleteTextView) findViewById(R.id.autoCompleteTextViewCountry);


        ArrayAdapter<String> provinceAdapter = new ArrayAdapter<>(RegisterActivity.this, android.R.layout.simple_dropdown_item_1line, province);
        provinceAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item); // Set dropdown layout for Spinner
        provinces.setAdapter(provinceAdapter);
        provinces.setThreshold(1);

        ArrayAdapter<String> countryAdapter = new ArrayAdapter<>(RegisterActivity.this, android.R.layout.simple_spinner_dropdown_item, Country);
        countryAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item); // Set dropdown layout for Spinner
        country.setAdapter(countryAdapter); // Set adapter for country AutoCompleteTextView
        country.setThreshold(1);


        //provinces.setAdapter(arrayAdapter);
        //country.setThreshold(1);
        //country.setAdapter(arrayAdapter1);
        btnRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v){
                Toast.makeText(RegisterActivity.this,"Registered successfully ...", Toast.LENGTH_SHORT).show();
            }
        });

        EdgeToEdge.enable(this);setContentView(R.layout.activity_register);

        TextView btn=findViewById(R.id.textViewLogIn);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v){
                startActivity(new Intent(RegisterActivity.this,LoginActivity.class));
            }
        });
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
    }
}