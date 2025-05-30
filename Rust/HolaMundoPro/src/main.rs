use std::io;
use chrono::Local;

fn main(){
    let mut nombre = String::new();
    let mut mensaje = String::new();
    let fecha = Local::now();

    println!("Ingresa tu nombre:");
    io::stdin()
        .read_line(&mut nombre)
        .expect("Error al leer el nombre");

    println!("Ingresa un mensaje:");
    io::stdin()
        .read_line(&mut mensaje)
        .expect("Error al leer el mensaje");

    println!("Este es tu mensaje personalizado:");
    
    println!("{}\n{} - {}", mensaje.trim(), nombre.trim(), fecha);
        
}
