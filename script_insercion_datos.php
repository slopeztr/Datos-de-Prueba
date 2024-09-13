<?php
// Conexión a la base de datos MySQL
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "datos";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Ruta del archivo CSV
$csv_file = "bd_esc.csv";

// Abrir el archivo CSV
if (($handle = fopen($csv_file, "r")) !== FALSE) {
    // Saltar la primera línea si contiene encabezados
    fgetcsv($handle);

    // Leer cada línea del CSV y insertarla en la base de datos
    while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
        list($id, $edad, $nivel_edu, $ingreso_mensual, $sexo, $anios_esc) = $data;

        $sql = "INSERT INTO poblacion (id, edad, nivel_edu, ingreso_mensual, sexo, anios_esc) 
                VALUES ('$id', '$edad', '$nivel_edu', '$ingreso_mensual', '$sexo', '$anios_esc')";

        if ($conn->query($sql) === TRUE) {
            //echo "Nuevo registro creado correctamente<br>";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
    fclose($handle);
}

// Cerrar la conexión a la base de datos
$conn->close();
echo "=> Importación completada";