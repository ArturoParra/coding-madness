package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
	"time"
)

func main() {

	reader := bufio.NewReader(os.Stdin)

	var nombre, mensaje string

	fecha := time.Now()

	fmt.Println("Ingresa tu nombre:")
	nombre, _ = reader.ReadString('\n')
	nombre = strings.TrimSpace(nombre)

	fmt.Println("Ingresa un mensaje:")
	mensaje, _ = reader.ReadString('\n')
	mensaje = strings.TrimSpace(mensaje)

	fmt.Println("Este es tu mensaje personalizado:")

	fmt.Printf("%s\n%s - %s", mensaje, nombre, fecha)
}
