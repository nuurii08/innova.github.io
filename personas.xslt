<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Plantilla para reemplazar '\' por '/' -->
  <xsl:template name="replace-backslash">
    <xsl:param name="text"/>
    <xsl:choose>
      <xsl:when test="contains($text, '\')">
        <xsl:value-of select="substring-before($text, '\')" />
        <xsl:text>/</xsl:text>
        <xsl:call-template name="replace-backslash">
          <xsl:with-param name="text" select="substring-after($text, '\')" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Datos de Pacientes</title>
        <link rel="stylesheet" href="style.css"/>
        <link rel="stylesheet" href="personas.css"/>
      </head>
      <body>
        <!-- Encabezado -->
        <header>
          <a href="#" class="logo">
            <img src="images/Logo Innova.png" alt="Logo de Innova" style="height: 40px;" />
          </a>
          <nav class="navbar">
            <ul>
              <li><a href="index.html">Inicio</a></li>
              <li><a href="producto.html">Descarga</a></li>
              <li><a href="nosotros.html">Nosotros</a></li>
              <li><a href="contacto.html">Contacto</a></li>
            </ul>
          </nav>
        </header>

        <!-- Contenido principal -->
        <section class="datos-section">
          <div class="title-background">
            <h1 class="heading">Datos de Pacientes</h1>
          </div>

          <!-- Tabla Información de Pacientes -->
          <div class="tabla-container">
            <h2>Información de Pacientes</h2>
            <table id="tablaPacientes" class="styled-table">
              <thead>
                <tr>
                  <th>Nombre</th>
                  <th>Edad</th>
                  <th>ID Paciente</th>
                  <th>Fecha de Registro</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="pacientes/paciente">
                  <tr>
                    <td><xsl:value-of select="informacion/nombre"/></td>
                    <td><xsl:value-of select="informacion/edad"/></td>
                    <td><xsl:value-of select="informacion/id"/></td>
                    <td><xsl:value-of select="informacion/fechaRegistro"/></td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </div>

          <!-- Tabla Resultados con Imágenes -->
          <div class="tabla-container">
            <h2>Resultados del Frotis de Sangre</h2>
            <table id="tablaResultados" class="styled-table">
              <thead>
                <tr>
                  <th>Parásito Detectado</th>
                  <th>Conteo de Parásitos</th>
                  <th>Grado de Infección</th>
                  <th>Observaciones</th>
                  <th>Fecha del Análisis</th>
                  <th>Imágenes</th> 
				  <th>Diagnóstico</th> 
                </tr>
              </thead>
			<tbody>
			  <xsl:for-each select="pacientes/paciente">
				<tr>
				  <td><xsl:value-of select="resultados/parasito"/></td>
				  <td><xsl:value-of select="resultados/conteo"/></td>
				  <td><xsl:value-of select="resultados/grado"/></td>
				  <td><xsl:value-of select="resultados/observaciones"/></td>
				  <td><xsl:value-of select="resultados/fechaAnalisis"/></td>
				  <td>
					<xsl:for-each select="imagenes/imagen">
					  <xsl:variable name="srcCorregido">
						<xsl:call-template name="replace-backslash">
						  <xsl:with-param name="text" select="archivo"/>
						</xsl:call-template>
					  </xsl:variable>
					  <div style="margin-bottom: 5px;">
						<img src="{$srcCorregido}" alt="{descripcion}" style="max-width: 100px; max-height: 80px; display: block;"/>
						<small><xsl:value-of select="descripcion"/></small>
					  </div>
					</xsl:for-each>
					<xsl:if test="not(imagenes/imagen)">
					  <span>No hay imágenes</span>
					</xsl:if>
				  </td>
				  <td><xsl:value-of select="resultados/diagnostico"/></td>
				</tr>
			  </xsl:for-each>
			</tbody>
            </table>
          </div>

        </section>

        <!-- Pie de página -->
        <footer class="footer">
          <p>© 2025 Innova. Todos los derechos reservados.</p>
        </footer>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>


