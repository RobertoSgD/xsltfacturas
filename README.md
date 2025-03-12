# xsltfacturas

# Proyecto XSLT para la conversión de FacturaE a XHTML

Este proyecto consiste en la creación de un conjunto de transformaciones XSLT para convertir archivos XML de ejemplo del formato **FacturaE** en documentos XHTML. Estas transformaciones permiten visualizar de forma clara y estructurada los datos más relevantes de una factura electrónica.

## Archivos del Proyecto

El repositorio contiene los siguientes archivos:

- `invoice.xml`: Ejemplo de archivo XML con datos de una factura en formato FacturaE.
- `invoice.xslt`: Primer archivo XSLT que transforma el XML en un documento XHTML visualizable en un navegador.
- `invoice2.xslt`: Segundo archivo XSLT con un formato distinto de transformación para ofrecer una alternativa en la presentación de la factura.
- `invoice.html`: Documento XHTML generado a partir de la transformación del XML usando `invoice.xslt`.
- `invoice2.html`: Documento XHTML generado a partir de la transformación del XML usando `invoice2.xslt`.
- `Readme.md`: Este archivo README que explica el proyecto.

## Descripción del XSLT

El archivo `invoice.xslt` es una plantilla que utiliza **XSLT 1.0** para transformar el archivo XML de una factura **FacturaE** en un documento XHTML visualmente estructurado. A continuación, se detallan las partes más importantes del archivo XSLT:

### Estructura del XSLT

- **Plantilla principal (`<xsl:template match="/fe:Invoice">`)**: Esta plantilla aplica la transformación al nodo raíz del archivo XML, que es el elemento `fe:Invoice` en el espacio de nombres de FacturaE. La plantilla genera una estructura HTML que representa la factura con las secciones de detalles como el número de factura, la fecha de emisión, el vendedor, el comprador, los productos y el total de la factura.

### Elementos clave transformados

1. **Número de Factura y Fecha de Emisión**: Se extraen del nodo `fe:InvoiceHeader` usando las instrucciones `<xsl:value-of select="fe:InvoiceHeader/fe:InvoiceNumber" />` y `<xsl:value-of select="fe:InvoiceHeader/fe:InvoiceIssueData/fe:IssueDate" />`.

2. **Datos del Vendedor y Comprador**: Se accede a la información del vendedor y comprador mediante los nodos `fe:SellerParty` y `fe:BuyerParty`. Esta información incluye el nombre de la empresa, dirección, ciudad, provincia, y el número de identificación fiscal (NIF).

3. **Productos**: La sección de productos se genera con un bucle `<xsl:for-each select="fe:Items/fe:InvoiceLine">`, que recorre todos los productos listados en el nodo `fe:Items` y presenta la descripción, cantidad, precio unitario y el coste total.

4. **Total de la Factura**: El total de la factura se extrae de `fe:InvoiceTotals/fe:InvoiceTotal`.

### Estilo y Formato

- **CSS**: El XSLT incluye un bloque de estilo básico para mejorar la presentación visual de la factura generada, como el uso de tablas para mostrar los datos de manera clara y legible.
- **Estructura HTML**: El documento XHTML generado incluye tablas para organizar la información de la factura, así como encabezados (`<h1>`, `<h2>`) para definir las secciones de la factura.

## Instrucciones para Uso

Para transformar un archivo XML de FacturaE en XHTML, sigue estos pasos:

1. Clona o descarga este repositorio.
2. Abre el archivo `factura1.xml` con cualquier procesador de XSLT o usa un editor de texto compatible con XSLT como **VSCode** con la extensión **DeltaXML**.
  2.1. Tambien puedes usar los comandos en la terminal de vscode
      -  $xmlPath = ".\factura2.xml"
      -  $xsltPath = ".\transformacion2.xslt"
     -   $outputPath = ".\factura2.html"
      -  $xml = New-Object System.Xml.XmlDocument
    -    $xml.Load($xmlPath)
    -    $xslt = New-Object System.Xml.Xsl.XslCompiledTransform
    -    $xslt.Load($xsltPath)
     -   $writer = New-Object System.IO.StreamWriter($outputPath)
      -  $xslt.Transform($xml, $null, $writer)
     -   $writer.Close()
4. Aplica la transformación con el archivo `transformacion1.xslt`.
5. Abre el archivo XHTML generado (`factura1.html`) en un navegador para ver la factura visualizada.

## Recursos Adicionales

- [Tutorial de XSLT en W3Schools](https://www.w3schools.com/xml/xsl_elementref.asp)
- [Guía de XSLT en MDN](https://developer.mozilla.org/en-US/docs/Web/XML/XSLT/Guides)
- [Tutorial de XSLT de TutorialsPoint](https://www.tutorialspoint.com/xslt/index.htm)



