	
1.Requisitos generales:
	Para que la página web se actualice automáticamente a medida que se realiza el diagnóstico desde la aplicación, es necesario que todos los archivos de la app y de la web estén ubicados en la misma carpeta y se ejecute en local.La actualización de la página web solo funciona si se ejecuta la aplicación en MATLAB en local, no se puede actualizar la página web con el .exe. Hay que tener en cuenta que para abrir la página web desde el entorno local, todas las demás ventanas del navegador deben estar cerradas. No es posible que se actualice de forma remota o en un servidor web convencional sin configuraciones adicionales. Además, para que la función de diagnóstico de la app funcione correctamente, todos los archivos .m y .mat, referidos a los modelos y métodos de segmentación deben estar descargados y ubicados en esa misma carpeta local.

	La página web está compuesta por varias pestañas, cada una con su propio archivo .html y una hoja de estilos .css. También se utiliza una hoja de estilo general style.css compartida por todas las páginas para mantener la coherencia visual.



2.Navegación:

-Desde la pantalla de inicio, se puede acceder a las distintas secciones mediante botones.
-En todas las pantallas, excepto en la de login, hay un enlace al inicio de sesión.
-Una vez iniciada la sesión, la página de login redirige automáticamente a datos_pacientes.xml, donde se muestran los datos de los pacientes registrados.

2.1.Archivos de la Página Web necesareos:

- Datos de pacientes: datos_pacientes.xml, personas.css, personas.xml y personas.xsd.
- Producto:producto.html y producto.css.
- Nosotros:nosotros.html y nosotros.css.
- Contacto:contacto.html y contacto.css.
- Login:login.html y login.css.
- Estilo general: style.css.
- Carpeta de imágenes de la app y página web.
- Instrucciones de uso: Malaria Instrucciones uso.pdf


3.Aplicación:
	La aplicación puede ejecutarse de dos maneras:Mediante el archivo ejecutable (.exe) o desde MATLAB, abriendo el archivo .mlapp.Al ejecutarse desde el archivo .exe, la actualización de la página web no está disponible.En cambio, al ejecutarse desde MATLAB con el archivo .mlapp, la actualización de la página web sí funciona correctamente.

	La aplicación cuenta con dos archivos, Registro.mlapp (app para Registro de usuario) y app1.mlapp app principal.La aplicación cuenta con distintas pestañas informativas y de diagnóstico.

	En la pestaña de inicio de sesión se permite cambiar el idioma de la aplicación, lo cual afectará toda la interfaz. También se puede cambiar el idioma desde la pestaña de registro. Si cambias el idioma desde la pantalla de registro, deberás volver a seleccionarlo en la pantalla principal de inicio de sesión para que el cambio se aplique correctamente a toda la app. Si no te has registrado previamente, no podrás acceder a la aplicación desde la pantalla de inicio, se bloquearan los Tabs y te saltará una alerta.

	La pestaña de diagnóstico, solo estará disponible si te registras como médico o técnico de laboratorio. Si te registras como usuario solo tendrás acceso a la pantalla de resúmenes de diagnóstico. 
Para subir una imagen se debe ingresar el nombre y el ID del paciente. Para que el ID sea válido, debe seguir la estructura PT-##### (cinco números).El campo de nombre también debe estar completo; de lo contrario, se activará una alerta.
Al pulsar el botón de diagnóstico, se mostrarán los resultados para GB, PV y PF. Sin embargo, los resultados de PV y PF solo aparecerán si el diagnóstico detecta Plasmodium falciparum o Plasmodium vivax. En ese caso, se mostrará también el conteo de parásitos correspondiente a cada uno.
Además, se incluirá un indicador de fiabilidad para cada resultado, el cual mostrará el nivel de confianza del sistema en el diagnóstico generado y una serie de alarmas si los valores que se han predicho no son coherentes  ayudando así a evaluar la precisión del análisis. 

	En la pestaña de resultados se mostrarán los diagnósticos registrados previamente para los pacientes (en el .exe se usa datos_pacientes.xlsx para visulizar los datos y app.mlapp datos_pacientes.xml).
Si no hay resultados disponibles, se mostrará una alerta indicando que no existen registros.

        En la pestaña de software se podrá descargar el archivo con las instrucciones de uso(Malaria Software Instrucciones uso.pdf) y la etiqueta del sistema. Es importante que el archivo de instrucciones esté ubicado en la misma carpeta que la aplicación para su descarga.

3.1.Archivos de la APP necesareos:
-Archivos principales:app.mlapp y Registro.mlapp
- Para diagnóstico: segmntCellsStainBased.m, SegmentacionOtsuApp.m, ML_final_modelos-mat.mat.ML_final-modelos_allvariables-mat.mat,ML_final_metamodelos_ALLTRAIN(variablesfinales)-mat.mat, coloDeconvolutionGIEMSA.m, FinalTableApp.m,codigoparalaapp.mlx.
- Para Leer instrucciones: Malaria Software Instruccions udo.pdf
- Carpeta de imágenes de la app y página web.
