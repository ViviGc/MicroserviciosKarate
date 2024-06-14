package Utilidades;

import com.github.javafaker.Faker;

import java.util.Locale;

public class generarData {

    static Faker faker = new Faker(new Locale("es"));

    public static String generarNombre(){
        String nombreAleatorio = faker.name().firstName();

        return nombreAleatorio;
    }


    public static String generarApellido(){
        String nombreAleatorio = faker.name().lastName();

        return nombreAleatorio;
    }

    public static String generarNumero(int valor){
        String numeroAleatorio = faker.number().digits(valor);

        return numeroAleatorio;
    }

    public static String generarbirthdayDate(){
        String Year = "199" + faker.number().digits(1);
        String mes = "0" + faker.number().digits(1);
        String dia = "1" + faker.number().digits(1);

        String fecha = Year +"-"+ mes +"-"+ dia;

        return fecha;
    }

    public static String generarCorreo(int valor){

        String correo = generarNombre() + "_" + generarNumero(valor) + "@gmail.com";

        return correo;
    }

    public static String generarPhone(int valor){

        String phone = "601" + generarNumero(valor);

        return phone;
    }

    public static String generarMobile(int valor){

        String mobile = "31" + generarNumero(valor);

        return mobile;
    }

    public static String generarNumeroyLetra(int valor){
        String numeroAleatorio = "pr" + faker.number().digits(valor);

        return numeroAleatorio;
    }

}

