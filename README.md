# Tarea_Nro5
Creación de página web y extracción de datos

a) Se confecciona página web "Tarea_Nro5"
	Se agrega imagen, texto y tabla.
	según las indicaciones dadas
	a.1) Tag "img", es un tag que no se cierra.

b) Utilizando programción R, se realizan las siguientes funciones para le extracción de información
   de páginas en formato HTML.
	- read_htm => Para leer el archivo HTML
	- html_nodes => Para extraer irformación
	- html_text => Para extraer solo el texto en la información extraida
	- Se realiza limpieza a la información extraida
	- Se almacena la información en un DataFrame

c) Se extraen datos de la tabla utilizando la función
	- html_table => Función similar que html_texo, pero esto sirve para los Tag's de "tabla"
	- Se realiza limpieza a la información extraida
	- Se almacena la información en un DataFrame


d) Se escoge una página web la que se nombró como "Pagina_Tarea_Nro5"
   -	Se escoge un procedimiento viste en el punto b) o c) y se realiza con la página escogida.
   -	Se realiza una limpieza a una noticia, por lo que se extrae el texto de ésta.
   -	Se guarda información en CSV y en un txt.
