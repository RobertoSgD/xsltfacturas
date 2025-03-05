<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fe="http://www.facturae.es/Facturae/2009/v3.2/Facturae"
                version="1.0">

    <!-- Plantilla principal para aplicar la transformación -->
    <xsl:template match="/fe:Invoice">
        <html>
            <head>
                <title>Factura</title>
                <style>
                    body { font-family: Arial, sans-serif; }
                    table { width: 100%; border-collapse: collapse; }
                    th, td { border: 1px solid #000; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                    h1 { text-align: center; }
                </style>
            </head>
            <body>
                <h1>Factura</h1>
                <h2>Detalles de la Factura</h2>
                <table>
                    <tr>
                        <th>Factura Número</th>
                        <td><xsl:value-of select="fe:InvoiceHeader/fe:InvoiceNumber" /></td>
                    </tr>
                    <tr>
                        <th>Fecha de Emisión</th>
                        <td><xsl:value-of select="fe:InvoiceHeader/fe:InvoiceIssueData/fe:IssueDate" /></td>
                    </tr>
                </table>

                <h2>Vendedor</h2>
                <table>
                    <tr>
                        <th>Razón Social</th>
                        <td><xsl:value-of select="fe:SellerParty/fe:LegalEntity/fe:CorporateName" /></td>
                    </tr>
                    <tr>
                        <th>Dirección</th>
                        <td><xsl:value-of select="fe:SellerParty/fe:LegalEntity/fe:AddressInSpain/fe:Address" /></td>
                    </tr>
                    <tr>
                        <th>Ciudad</th>
                        <td><xsl:value-of select="fe:SellerParty/fe:LegalEntity/fe:AddressInSpain/fe:Town" /></td>
                    </tr>
                    <tr>
                        <th>Provincia</th>
                        <td><xsl:value-of select="fe:SellerParty/fe:LegalEntity/fe:AddressInSpain/fe:Province" /></td>
                    </tr>
                    <tr>
                        <th>Número de Identificación Fiscal</th>
                        <td><xsl:value-of select="fe:SellerParty/fe:TaxIdentification/fe:TaxIdentificationNumber" /></td>
                    </tr>
                </table>

                <h2>Comprador</h2>
                <table>
                    <tr>
                        <th>Nombre</th>
                        <td><xsl:value-of select="fe:BuyerParty/fe:Individual/fe:Name" /></td>
                    </tr>
                    <tr>
                        <th>Apellidos</th>
                        <td><xsl:value-of select="fe:BuyerParty/fe:Individual/fe:FirstSurname" /></td>
                    </tr>
                    <tr>
                        <th>Número de Identificación Fiscal</th>
                        <td><xsl:value-of select="fe:BuyerParty/fe:TaxIdentification/fe:TaxIdentificationNumber" /></td>
                    </tr>
                </table>

                <h2>Productos</h2>
                <table>
                    <tr>
                        <th>Descripción</th>
                        <th>Cantidad</th>
                        <th>Precio Unitario</th>
                        <th>Total</th>
                    </tr>
                    <xsl:for-each select="fe:Items/fe:InvoiceLine">
                        <tr>
                            <td><xsl:value-of select="fe:ItemDescription" /></td>
                            <td><xsl:value-of select="fe:Quantity" /></td>
                            <td><xsl:value-of select="fe:UnitPriceWithoutTax" /></td>
                            <td><xsl:value-of select="fe:TotalCost" /></td>
                        </tr>
                    </xsl:for-each>
                </table>

                <h2>Total de la Factura</h2>
                <table>
                    <tr>
                        <th>Total</th>
                        <td><xsl:value-of select="fe:InvoiceTotals/fe:InvoiceTotal" /></td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
