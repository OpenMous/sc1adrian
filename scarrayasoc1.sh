#!/bin/bash
# Variables
colores="./colores/colores.txt"
color=""
key=""
valor=""
clear
# Programas
echo "Se utilizarán los colores registrados en $colores"
echo "Leyendo archivo"
echo "=================="
sleep 2
declare -A array_colores
while IFS=":" read -r key valor; do
	array_colores[$key]=$valor
done < $colores
echo "Listado de colores disponibles: "
for k in ${!array_colores[@]}; do
	echo $k
done
echo "Ahora te toca elegir los colores de tu página web"
read -p "Que color quieres para el fondo? " fondo
read -p "Qué color quieres para el cuadro de texto? " div
read -p "Que color quieres para el texto? " texto
ip=$(hostname -I | awk '{print $1}')
cat << EOF > index_adrian.html
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Mi página</title>
</head>
<body style="background-color: ${array_colores[$fondo]};">
	<h1>IP de mi equipo</h1>
	<div style="background-color: ${array_colores[$div]}; color: ${array_colores[$texto]};">
		<p>$ip</p>
	</div>
</body>
</html>
EOF
