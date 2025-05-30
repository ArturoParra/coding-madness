import datetime as dt

def main():
    print("Ingresa tu nombre:")
    nombre = input()

    print("Ingresa tu mensaje:")
    mensaje = input()

    fecha = dt.datetime.now()

    print("Este es tu mensaje personalizado:")
    print(f"{mensaje}\n{nombre} - {fecha}")

if __name__ == "__main__":
    main()
