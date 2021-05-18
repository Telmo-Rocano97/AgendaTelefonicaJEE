
PRÁCTICA DE LABORATORIO 
 
 
CARRERA: INGENIERIA DE SISTEMAS 	ASIGNATURA: APLICACIONES DISTRIBUIDAS 
NRO. PRÁCTICA: 	2 	TÍTULO PRÁCTICA: Desarrollo de una aplicación JEE basado en Servlets, JSP y JDBC para el intercambio de datos en un modelo de tres capas aplicando los patrones diseño de software MVC y DAO 
OBJETIVOS 
• Diseña y desarrolla modelos de software en diferentes niveles de abstracción y modelos de datos a nivel transaccional y analítico con entornos de desarrollo actuales  
INSTRUCCIONES  	 
Se pide desarrollar una aplicación JEE que permita implementar una agenda telefónica en donde se tendrán usuarios con datos como cedula, nombres, apellidos, correo y contraseña. Y cada uno de estos usuarios podrá tener asignado uno o más teléfonos de contacto de diferente tipo y operador, por ejemplo: 
 
•	El usuario “Juanito” tiene los teléfonos 0998121212 de tipo celular y operadora Movistar; así como también tiene asignado el teléfono 0728222111 de tipo convencional y operador CNT. 
 
Para lo cuál, se propone el siguiente diagrama de clases: 
![image](https://user-images.githubusercontent.com/62858551/118599483-31d48500-b775-11eb-9b86-d4c7eaffbe01.png)

 
Los requerimientos funcionales del sistema son: 
•	Los usuarios pueden registrarse en la aplicación a través de un formulario de creación de cuentas. 
•	Un usuario puede iniciar sesión usando su correo y contraseña. 
•	Una vez iniciado sesión el usuario podrá: 

• Registrar, modificar, eliminar, buscar y listar sus teléfonos o Listar los números de teléfono de un usuario usando su número de cédula o correo electrónico 
• Podrá llamar o enviar un correo electrónico desde el sistema usando aplicaciones externas. 
• 	Los datos siempre deberán ser validados cuando se trabaje a través de formularios. 
De igual manera, se pide manejar sesiones y filtros para que existe seguridad en el sistema de agenda telefónica. Por lo qué, debe existir una parte pública y una privada. La parte privada ha sido descrita en los requisitos antes planteados. Y la parte pública será una página index.html a través de la cuál podrán acceder al sistema. No obstante, se debe generar una página con la experiencia e interfaz de usuario apropiada, como la que se muestra en la Fig 3. Finalmente, el sistema de agenda telefónica debe aplicar los patrones de diseño de software MVC y DAO, en donde, el modelo será clases POJOs de Java, la vista será JSP + JSTL y los controladores serán a través de DAOs y Servlets. 
 
 ![image](https://user-images.githubusercontent.com/62858551/118599552-54669e00-b775-11eb-8600-ff98441c618a.png)

Fig 3. Pagina pública index.html propuesta para el sistema de agenda telefónica 
 
ACTIVIDADES POR DESARROLLAR  
1. Crear un repositorio en GitHub con el nombre “Práctica de laboratorio 02: Agenda Telefónica en JEE” 

https://github.com/AngelJadan/AgendaTelefonica 
 
2. Desarrollar una aplicación con tecnología JEE para gestionar requerimientos de compra en la web. 

•	Los usuarios pueden registrarse en la aplicación a través de un formulario de creación de cuentas. 

<img width="399" alt="Captura de Pantalla 2021-05-18 a la(s) 00 34 22" src="https://user-images.githubusercontent.com/62858551/118599595-68120480-b775-11eb-9ef6-8505b13615ec.png">

 
•	Un usuario puede iniciar sesión usando su correo y contraseña. 

 <img width="496" alt="Captura de Pantalla 2021-05-18 a la(s) 00 33 43" src="https://user-images.githubusercontent.com/62858551/118599611-6d6f4f00-b775-11eb-80e2-23d9c36fbb4b.png">


Metodo CRUD de TELEFONOS
CREATE:


![image](https://user-images.githubusercontent.com/62858551/118600184-482f1080-b776-11eb-83c0-09b132f159a6.png)


UPDATE:


 ![image](https://user-images.githubusercontent.com/62858551/118600225-55e49600-b776-11eb-97bc-379460e057b7.png)



DELETE:

![image](https://user-images.githubusercontent.com/62858551/118600331-76aceb80-b776-11eb-83d1-dfa4a2fdf4bf.png)


METODO LISTAR


 <img width="653" alt="Captura de Pantalla 2021-05-18 a la(s) 00 43 16" src="https://user-images.githubusercontent.com/62858551/118599851-c6d77e00-b775-11eb-88b6-437f95170de2.png">

Podrá llamar o enviar un correo electrónico desde el sistema usando aplicaciones externas. 
Finalmente, el sistema de agenda telefónica debe aplicar los patrones de diseño de software MVC y DAO, en donde, el modelo será clases POJOs de Java, la vista será JSP + JSTL y los controladores serán a través de DAOs y Servlets. 
PAQUETES DEL PROYECTOS
 <img width="323" alt="Captura de Pantalla 2021-05-18 a la(s) 00 47 42" src="https://user-images.githubusercontent.com/62858551/118599875-cfc84f80-b775-11eb-863f-fd7a38dc2a1b.png">


la vista será JSP + JSTL


<img width="230" alt="Captura de Pantalla 2021-05-18 a la(s) 00 50 17" src="https://user-images.githubusercontent.com/62858551/118599886-d3f46d00-b775-11eb-91cd-97f08dd18d80.png"> 

RESULTADO(S) OBTENIDO(S): 
•	Maneja diferentes formatos para el intercambio de datos entre aplicaciones. 
•	Crear una aplicación con una interfaz de usuario adecuada, 
•	Fácil de comprencion para los usuarios.
•	

 
CONCLUSIONES:  
•	Se logro implementar sistemas JEE basado en Servlets, JSP y JDBC. 
•	Implementar patrones de diseño de software MVC y DAO.
•	Los controladores que se implementaron son a través de DAOs y Servlets.


 
RECOMENDACIONES:  
•	Aplicar conceptos de interacción humano máquina para el desarrollo de la GUI. 
•	las clases estan bien programadas y con las relaciones correctas también.


 
 
Estudiantes:  Angel Jadan, Telmo Rocano
Firma:   
