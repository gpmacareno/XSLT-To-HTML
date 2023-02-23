<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> <!-- Encabezado predeterminado para los documentos de este tipo -->
  <xsl:output method="html" encoding="iso-8859-1" omit-xml-declaration="yes" indent="yes"></xsl:output> <!-- Método de salida del docuemnto, que será con formato HTML y codificación latina. -->

  <xsl:template match="/"> <!-- Creamos la estructura básica de HTML5-->
    <html lang="es">
      <head>
        <title>Jardines Colosales</title> <!-- Título de la página.-->
      </head>
      <body>
        <header> <h1 style="color:red"><i><b><u>Jardines Colosales</u></b></i></h1>  <!-- Encabezado de la página.-->
        </header>
        <nav> 
        </nav>
        <article>
          <xsl:apply-templates /> <!-- Usaremos apply para poder aplicar los parámetros deseados-->
        </article>
        <aside>
        </aside>
        <footer>
        </footer> 
      </body>

    </html>
  </xsl:template>


  <xsl:template match="empleado">  <!-- De la sección empleados desearemos seleccionar unicamente su nombre, su cargo que es un atributo y su correo.-->
   <h3 style="color:red"><i><b><u>Empleado</u></b></i></h3> 
   <hr></hr>
<table border="1">
  <tr>
    <th>Nombre</th>
    <td><xsl:value-of select="nombre" /></td>   <!-- Usaremos value-of- select para extraer la información deseada.-->
   
    <th>Cargo</th>
    <td><xsl:value-of select="@cargo" /></td>
   
    <th>Correo</th>
    <td><xsl:value-of select="correo" /></td>
  </tr>
</table>

<hr></hr>
  </xsl:template>

 
  <xsl:template match="departamentos"> <!-- De la sección departamentos desearemos seleccionar unicamente su teléfono para tenerlo al alcance.-->
    <br></br>
  <h3 style="color:red"><i><b><u>Departamentos</u></b></i></h3> 
  

    <xsl:for-each select="departamento">  <!-- Usaremos for-each select para seleccionar del departamento y para poder ordenarlos por orden ascendente los teléfonos usaremos sort.-->
      <xsl:sort select="telefono" order="ascending"/>
      <xsl:text>&#10;</xsl:text>
      <b><xsl:value-of select="@nombre"/></b>:
       
      <xsl:text>&#10;</xsl:text> <!-- Generamos salto de línea con esta nomenclatura especial.-->
          <p>Teléfono: <xsl:value-of select="telefono"/></p>
          
      </xsl:for-each>
      <xsl:text>&#10;</xsl:text>
 
      <hr></hr>
      
      <br></br>
 </xsl:template>
 
 <xsl:template match="articulos/articulo"> <!-- De la sección artículo desearemos hacer una descripción de su tipo de IVA en relación al IVA que posee.-->

 <h3 style="color:red"><i><b><u>Artículo</u></b></i></h3> 

 <ul>
 <xsl:value-of select="nombre" />
 :
 <xsl:if test="@IVA='21%'">El artículo tiene iva alto.</xsl:if>     <!-- Usaremos un IF para decir que si tiene ese IVA que es un atributo salga ese texto.-->
 <xsl:if test="@IVA='16%'">El artículo tiene iva reducido.</xsl:if>
 <xsl:if test="@IVA='4%'">El artículo tiene iva supereducido.</xsl:if>

 </ul>

 
 <hr></hr>
      

</xsl:template>

<xsl:template match="arboles/arbol"> <!-- De la sección arbol desearemos saber si los árboles tienen disponibilidad o si por el contrario no estan en el catálogo.-->
<br></br>
<h3 style="color:red"><i><b><u>Árboles</u></b></i></h3> 


-
<xsl:choose>     <!-- Haremos un choose - when para hacer una criba y decir cuando un arbol tiene disponibilidad alta o baja, mostrar dicho árbol y su disponibilidad.-->                                                            
  <xsl:when test="disponibilidad='Alta'">
    <xsl:value-of select="nombre" /> - Árbol con una disponibilidad alta.
  </xsl:when> 
  <xsl:when test="disponibilidad='Baja'">
   <xsl:value-of select="nombre" />  - Árbol con una disponibilidad baja.
  </xsl:when> 
  <xsl:otherwise>
    <xsl:value-of select="nombre" /> - No esta en el catálogo. <!-- Otherwise es para cuando no se cumple las otras condiciones. -->
  </xsl:otherwise>
 </xsl:choose>

 <hr></hr>

</xsl:template>



<xsl:template match="pueblo"> <!-- De los pueblos necesitaremos saber su nombre.-->

<h3 style="color:red"><i><b><u>Pueblo: </u></b></i></h3> 

        
<pueblo>

  <p><xsl:value-of select="nombre" /></p>

  <xsl:attribute name="provincia"> <!-- A efectos prácticos de la tarea, he decidido usar "Attribute" para convertir estos campos en atributos, por si en algun momento deseasemos usarlos.-->
      <xsl:value-of select="provincia"/>
  </xsl:attribute>

  <xsl:attribute name="Transportista">
      <xsl:value-of select="Transportista"/>
  </xsl:attribute>

</pueblo>

</xsl:template>

</xsl:stylesheet>