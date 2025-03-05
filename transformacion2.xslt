<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fe="http://www.facturae.es/Facturae/2009/v3.2/Facturae"
                version="1.0">

    <!-- Plantilla principal para aplicar la transformación -->
    <xsl:template match="/fe:Invoice">
        <html lang="es">
            <head>
                <title>Factura</title>
                <style>
                    body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 20px; background-color: #f4f7fa; }
                    h1, h2 { color: #333; }
                    table { width: 100%; margin-bottom: 20px; border-collapse: collapse; }
                    th, td { padding: 12px; border: 1px solid #e0e0e0; text-align: left; }
                    th { background-color: #00aaff; color: white; }
                    td { background-color: white; }
                    h1 { font-size: 2.5rem; text-align: center; margin-bottom: 30px; }
                    h2 { font-size: 1.8rem; color: #444; margin-bottom: 15px; }
                    .invoice-header, .invoice-summary { background-color: #ffffff; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); padding: 20px; }
                    .invoice-summary { margin-top: 30px; }
                    .invoice-summary td { font-weight: bold; }
                    .total-row td { font-size: 1.2rem; color: #d9534f; }
                </style>
            </head>
            <body>
                <h1>Factura</h1>

                <!-- Detalles de la factura -->
                <div class="invoice-header">
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
                </div>

                <!-- Vendedor -->
                <div class="invoice-header">
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
                </div>

                <!-- Comprador -->
                <div class="invoice-header">
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
                </div>

                <!-- Productos -->
                <div class="invoice-header">
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
                </div>

                <!-- Total -->
                <div class="invoice-summary">
                    <table>
                        <tr class="total-row">
                            <td>Total de la Factura</td>
                            <td><xsl:value-of select="fe:InvoiceTotals/fe:InvoiceTotal" /></td>
                        </tr>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
