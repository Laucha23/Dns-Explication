## DNS 

Domain name system

---

### Objetivo 
	
El objetivo principal es un espacio de nombres consistente que sea utilizado para referirse a los recursos. Para evitar problemas causados por extensiones especiales, los nombres no necesitarán contener identificadores de red, direccines, rutas o información similar como parte del nombre.

---

### Como funciona 

El proceso de solución de DNS supone convertir un nombre de servidor (como www.ejemplo.com) en una dirección IP compatible con el ordenador (como 192.168.1.1). Se da una dirección IP a cada dispositivo en Internet, y esa dirección será necesaria para encontrar el dispositivo apropiado de Internet, al igual que se usa la dirección de una calle para encontrar una casa concreta. Cuando un usuario quiere cargar una página, se debe traducir lo que el usuario escribe en su navegador web (ejemplo.com) a una dirección que el ordenador pueda entender para poder localizar la página web de ejemplo.com.

Para entender el proceso de la resolución de DNS, es importante conocer los diferentes componentes de hardware por los que debe pasar una consulta de DNS. Para el navegador web, la búsqueda de DNS se produce "en segundo plano" y no requiere ninguna interacción del ordenador del usuario, aparte de la solicitud inicial.

#### Los servidores por los que pasa


1. Recursor de DNS: es como un bibliotecario al que se le pide que busque un libro determinado en la biblioteca. El recursor DNS es un servidor diseñado para recibir consultas desde equipos cliente mediante aplicaciones como navegadores web. Normalmente, el recursor será el responsable de hacer solicitudes adicionales para satisfacer la consulta de DNS del cliente.
    
2. Servidor de nombres raíz: es el primer paso para traducir (solucionar) los nombres de servidor legibles en direcciones IP. Se puede comparar a un índice en una biblioteca que apunta a diferentes estanterías de libros. Generalmente sirve como referencia de otras ubicaciones más específicas.
    
3. Servidor de nombres TLD: el servidor de dominio de nivel superior (TLD) se puede comparar con una estantería de libros en una biblioteca. Es el paso siguiente en la búsqueda de una dirección IP específica y aloja la última parte de un nombre de servidor (en ejemplo.com, el servidor TLD es "com").
    
4. Servidor de nombres autoritativo: se puede interpretar como un diccionario en una estantería de libros, en el que se puede consultar la definición de un nombre específico. El servidor de nombres autoritativo es la última parada en la consulta del servidor de nombres. Si cuenta con acceso al registro solicitado, devolverá la dirección IP del nombre del servidor solicitado al recursor de DNS (el bibliotecario) que hizo la solicitud inicial.

---

### Historia 

El mapeo de las direcciones a nombres de host están gestionados por el Network Information Center (NIC) en un sólo fichero (HOSTS.TXT), el cual fue distribuido a todos los hosts mediante FTP. El ancho de banda de red total consumido en la distribución de este escenario es proporcional al cuadrado del número de hosts en la red. 

Incluso cuando se utilizan múltiples niveles de FTP, la carga de salida FTP en los NIC de los 	hosts es considerable. No se tuvo una buena previsión del futuro y explosivo crecimiento en el número de hosts.

De la misma manera ocurrió con las redes. Los hosts de la ARPANET original fueron sustituidos por redes locales de estaciones de trabajo. Las organizaciones administraron localmente sus propios nombres y direcciones, pero tuvieron que esperar bastante al NIC para que HOSTS.TXT estuviera actualizado con esos cambios en Internet. Las organizaciones también querían alguna estructura local en el espacio de nombres.

Al volverse más sofisticadas las aplicaciones en Internet, se creó la necesidad de tener un servicio de nombres de propósito general.

El resultado de esta fueron varias ideas acerca del espacio de nombres y su gestión.Los propósitos cambiaron, pero la idea común era la de un espacio de nombres jerárquico que se correspondiera con la estructura de la organización y del uso del "."  como caracter de unión entre los niveles de la jerarquía.

Los términos "dominio" o "nombre de dominio" son utilizados en muchos contextos más allá de lo que DNS describe aquí. El término nombre de dominio se utiliza muy a menudo para referirse a un nombre con una estructura indicada por puntos, sin relación alguna con DNS. Esto se cumple en el direccionamiento de correo electrónico. 

---

### Ataques a DNS

Son aquellos ataques dirigidos a afectar o modificar el funcionamiento de un servidor DNS. El ataque al DNS no tiene un solo modo, sino que podría ocasionar diversas repercusiones según su tipo. Puede inhabilitar el acceso a un sitio web o clonar el mismo a fin de extraer datos de acceso gracias a sus usuarios. Del mismo modo, puede redirigir a usuarios a otros portales o ser el inicio para un ataque de mayor repercusión.

#### DNS cache snooping 

Los atacantes pueden envenenar un caché de DNS engañando a los solucionadores de DNS con información falsa de almacenamiento de caché, con el resultado de que el solucionador envíe la dirección IP equivocada a los clientes, y los usuarios intenten navegar a un sitio web que se dirigirá al sitio equivocado.

El envenenamiento de caché de DNS consiste en introducir información falsa en una caché DNS, para que las consultas de DNS devuelvan una respuesta incorrecta y se dirija a los usuarios a sitios web equivocados. El envenenamiento de caché de DNS también se conoce como "suplantación de DNS". Las direcciones IP son los "números de habitación" de Internet y habilitan el tráfico para llegar hasta los lugares adecuados. Las cachés del solucionador de DNS son el "directorio de las instalaciones". Cuando almacenan información errónea, el tráfico se dirige a sitios equivocados, hasta que se corrige la información almacenada en caché. (Debe tenerse en cuenta que esto no desconecta realmente a los sitios web de sus direcciones IP reales)

Este procedimiento le permite a un atacante consultar servidores DNS sobre algunos dominios en especifico  

#### Ataque DDos/ Dos

#### Tranferencia de Zona

Es un tipo de transacción de DNS. Es uno de varios mecanismos disponibles para administradores para replicar bases de datos DNS a través de un conjunto de servidores DNS.

suelen ser utilizados por los atacantes para recolectar información acerca de la infraestructura y subdominios de la posible víctima –aunque existen herramientas automatizadas para hacerlo, como por ejemplo Dnsnum. De esta última vemos una captura de pantalla a continuación:

<img src="dnsenum.jpg">

Puede verse con claridad cómo con solo indicarle unos pocos parámetros (en este caso –enum para enumerar la información) ya comienza con la recolección de información, no solamente de los servidores DNS sino también haciendo búsquedas en Internet. Si bien hace todo por sí sola con solo indicarle el dominio, debe comprenderse cómo funciona por detrás.
Una transferencia de zona utiliza el protocolo TCP para el transporte, y toma la forma de una transacción de cliente-servidor. El cliente que solicita una transferencia de zona puede ser un servidor esclavo o servidor secundario, que solicita datos de un servidor maestro, a veces llamado un servidor primario. La parte de la base de datos que se replica es una zona.
Este ataque pretende hacernos pasar por un servidor secundario, solicitar una transferencia de zona, lo que nos permitira visualizar los subdominios de nuestro objetivo

---

### Donde se guardan los registros DNS

-A : Address // Este registro traduce nombres de host a direcciones IPv4

-AAAA: Address // = IPv6

-CNAME: Canonical Name // este registro crea nombres de host adicionales, para los host de un dominio, su implementación actúa cuando operan múltiples servicios(ssh,ftp,http,https,etc) en un servidor con una dirección IP.  Cada servicio tiene su propia entrada de DNS

-NS:  Name Server // Este registro define la asociación entre un nombre de dominio y los servidores de nombres que almacenan la información de dicho dominio

-MX:  Mail Exchange // Este registro asocia un nombre de dominio a una lista de servidores de intercambio de correo para el dominio en cuestión

-PTR: Pointer // este registro es conocido como 'registro inverso' funciona de manera contraria al registro A, traduciendo IPs en nombres de dominio.

-SOA: Start of Authority // Este registro proporciona información sobre el servidor dns primario de la zona

-HINFO: Host Information // ese servicio realiza  una descripción del host y permite que el usuario conozca el tipo de máquina y sistema operativo al que corresponde un dominio 

-TXT: Text // Este registro permite a los dominios identificarse de modos arbitrarios

-LOC: Localización // este registro permite indicar las coordenadas del dominio

-WKS: generalización del registro mx para indicar los servicios que ofrece el dominio. 

-SRV: Servicios // permite indicar los servicios que ofrece el dominio . RFC 2782

-SPF: Sender Policy Framework // Ayuda a combatir el Spam, En este registro se especifica los host que están autorizados a enviar correo desde el dominio dado.

## Bibliografia 

<A HREF="https://www.cloudflare.com/es-es/learning/dns/dns-cache-poisoning/">Dns Cache Snooping</A>
<br>
<A HREF="https://www.cloudflare.com/es-es/learning/dns/what-is-dns/">Que es DNS</A>
<br>
<A HREF="https://ginzo.tech/blog/ataque-dns/">Ataques DNS</A>
<br>
<A HREF="https://es.wikipedia.org/wiki/Ataque_de_denegaci%C3%B3n_de_servicio">Ataques DDos</A>
<br>
<A HREF="https://www.welivesecurity.com/la-es/2015/06/17/trata-ataque-transferencia-zona-dns/">Ataque 
de transferencia de zona dns</A>
<br>
<A HREF="https://www.cs.unc.edu/~fabian/course_papers/cache_snooping.pdf">Dns cache Snoping v2</A>

