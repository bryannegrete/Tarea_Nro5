# Usando la libreria rvest
library('rvest')


       #Tarea 5 con Pagina Web Creada
       #Desarrollo de a) b) y c)

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

#Pasando informacion a un data frame
DataFrameTabla<-as.data.frame(TablaWeb)

#Almacenando la informacion en CSV
write.csv(DataFrameTabla, file = "TablaNoticia.csv")

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
write.csv(DataFramePalabras, file = "PalabrasNoticia.csv")


#Grafico con los datos

#Limpiar tabla
TablaWeb$`Precio de Cierre` <- gsub("\\$","",TablaWeb$`Precio de Cierre`)
TablaWeb$`Precio de Cierre` <- gsub("[.]","",TablaWeb$`Precio de Cierre`)
TablaWeb$`Precio de Cierre` <- as.numeric(gsub(",",".",TablaWeb$`Precio de Cierre`))

#Graficando los precios de acciones
library('ggplot2')

# respecto al precio
TablaWeb %>%
  ggplot() +
  aes(x = Empresa, y = `Precio de Cierre`) +
  geom_bar(stat="identity")

# Gráfico boxplot diferenciado por producto
TablaWeb %>%
  ggplot() +
  geom_boxplot(aes(x = Empresa, y = `Precio de Cierre`)) +
  theme_bw()


      #Tarea 5 con Pagina Web Creada
      #Desarrollo de d)

PageEmol<-"Pagina_Tarea_Nro5.html"
ReadEmol<-read_html(PageEmol)
print(ReadEmol)

#Extrayendo Titulo y Bajada de la Noticia
TituloBajadaEmol<-html_nodes(ReadEmol,".cont_new_detalle_noti")
print(TituloBajadaEmol)

TituloEmol<-html_nodes(TituloBajadaEmol,"h1")
print(TituloEmol)

Titulo <- html_text(TituloEmol)
print(Titulo)

Titulo <- gsub("\n","",Titulo)
Titulo <- gsub("\r","",Titulo)
Titulo <- gsub("[.]","",Titulo)
Titulo <- gsub("\"","",Titulo)

print(Titulo)

BajadaEmol<-html_nodes(TituloBajadaEmol,"h2")
print(BajadaEmol)

Bajada <- html_text(BajadaEmol)
print(Bajada)

Bajada <- gsub("\n","",Bajada)
Bajada <- gsub("\r","",Bajada)
Bajada <- gsub("[.]","",Bajada)
Bajada <- gsub("\"","",Bajada)

print(Bajada)

#Juntamos los parrafos de la bajada en texto completo
BajadaCompleta<-""
for(i in 1:length(Bajada))
  BajadaCompleta<-paste(BajadaCompleta," ",Bajada[i])

print(BajadaCompleta)

BajadaCompleta <- gsub("\n","",BajadaCompleta)
BajadaCompleta <- gsub("\r","",BajadaCompleta)
BajadaCompleta <- gsub("[.]","",BajadaCompleta)
BajadaCompleta <- gsub("\"","",BajadaCompleta)
BajadaCompleta <- gsub(",","",BajadaCompleta)
BajadaCompleta <- gsub(":","",BajadaCompleta)

print(BajadaCompleta)

#Extrayendo Cuerpo de la Noticia
CuerpoEmol<-html_nodes(ReadEmol,".EmolText")
print(CuerpoEmol)

Cuerpo <- html_text(CuerpoEmol)
print(Cuerpo)

Cuerpo <- gsub("\n","",Cuerpo)
Cuerpo <- gsub("\r","",Cuerpo)
Cuerpo <- gsub("[.]","",Cuerpo)
Cuerpo <- gsub("\"","",Cuerpo)
Cuerpo <- gsub(",","",Cuerpo)

print(Cuerpo)

# Separando las palabras por espacio
EspacioEmol <- strsplit(Cuerpo," ")[[1]]

# Pasando todas las palabras a minusculas
EspacioEmol <- tolower(EspacioEmol)

# Contando palabras
UnlistEmol<-unlist(EspacioEmol)
TablaEmol<-table(UnlistEmol)

# Pasando la informacion a un data frame
DfCuerpoEmol<- as.data.frame(TablaEmol)

# Almacenando la informacion en CSV
write.csv(DfCuerpoEmol, file="PalabrasEmol.csv")

# o en un txt
write.table(DfCuerpoEmol, file="PalabrasEmol.txt")