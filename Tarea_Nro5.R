# Usando la libreria rvest
library('rvest')

#Inicializando la viable PaginaWeb con el nombre de la pagina
PaginaWeb<-"Tarea_Nro5.html"

#Leyendo el HTML del archivo
LeerPagina<-read_html(PaginaWeb)
print(LeerPagina)

#Extrayendo contenido en la clase justuficada
TextoJustficado<-html_nodes(LeerPagina,".justificado")
print(TextoJustficado)

#Pasando la info a texto
Parrafo<-html_text(TextoJustficado)
print(Parrafo)

#Extrayendo contenido de la tabla
Tabla<-html_nodes(LeerPagina,"table")
print(Tabla)

#pasando la info a tabla
TablaWeb<-html_table(Tabla)[[1]]
print(TablaWeb)

#Eliminando los \n, comillas("), puntos(.) y comas(,) del texto
Parrafo<-gsub("\n","",Parrafo)
Parrafo<-gsub("\"","",Parrafo)
Parrafo<-gsub("[.]","",Parrafo)
Parrafo<-gsub(",","",Parrafo)
Parrafo<-gsub(":","",Parrafo)

#Parrafo despues de sacar elementos
print(Parrafo)

#Sepraando las palabras por espacio
EspacioPalabras<-strsplit(Parrafo," ")[[1]]

#Todas las palabras a minusculas
MinusculaPalabras<-tolower(EspacioPalabras)

#Contar palabras
ContarPalabras<-unlist(MinusculaPalabras)
TablaPalabras<-table(ContarPalabras)

#Pasando la informacion a un data frame
DataFramePalabras<-as.data.frame(TablaPalabras)

#Juntamos los parrafos a TextoCompleto
TextoCompleto<-""
for(i in 1:length(Parrafo))
  TextoCompleto<-paste(TextoCompleto," ",Parrafo[i])

#Volvemos a realizar los pasos para contar (data frame)

TextoCompleto<-gsub("\n","",TextoCompleto)
TextoCompleto<-gsub("\"","",TextoCompleto)
TextoCompleto<-gsub("[.]","",TextoCompleto)
TextoCompleto<-gsub(",","",TextoCompleto)
TextoCompleto<-gsub(":","",TextoCompleto)

print(TextoCompleto)

EspacioPalabras<-strsplit(TextoCompleto," ")[[1]]
MinusculaPalabras<-tolower(EspacioPalabras)
ContarPalabras<-unlist(MinusculaPalabras)
TablaPalabras<-table(ContarPalabras)
DataFramePalabras<-as.data.frame(TablaPalabras)
