## DNS 

Domain name system

---

### Objetivo 
	
El objetivo principal es un espacio de nombres consistente que sea utilizado para referirse a los recursos. Para evitar problemas causados por extensiones especiales, los nombres no necesitarán contener identificadores de red, direccines, rutas o información similar como parte del nombre.

---

### Como funciona 

El proceso de solución de DNS supone convertir un nombre de servidor (como www.ejemplo.com) en una dirección IP compatible con el ordenador (como 192.168.1.1). Se da una dirección IP a cada dispositivo en Internet, y esa dirección será necesaria para encontrar el dispositivo apropiado de Internet, al igual que se usa la dirección de una calle para encontrar una casa concreta. Cuando un usuario quiere cargar una página, se debe traducir lo que el usuario escribe en su navegador web (ejemplo.com) a una dirección que el ordenador pueda entender para poder localizar la página web de ejemplo.com.

Para entender el proceso de la resolución de DNS, es importante conocer los diferentes componentes de hardware por los que debe pasar una consulta de DNS. Para el navegador web, la búsqueda de DNS se produce "en segundo plano" y no requiere ninguna interacción del ordenador del usuario, aparte de la solicitud inicial.

### Los servidores por los que pasa

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

#### ARGENTINA y el .ar

En Argentina los dominios en internet con extension .ar son registrados en la NIC Argentina, estos se describen como la Dirección Nacional del Registro de Dominios de Internet, ellos trabajan bajo la órbita de la Secretaría Legal y Técnica de la Presidencia de la Nación.  

Su propósito es brindar un servicio eficiente en tanto administradores del registro de dominios ‘.ar’ y facilitar el acceso de todas las personas, en igualdad de condiciones, a una internet segura y confiable como una de las claves para el desarrollo del país.

La NIC proporciona toda la informacion publica de los dns regitrados en Argentina

#### Ejemplo de Huergo

Podemos usar un comando en linux(whois <dominio>) o buscar paginas como <A HREF="https://nic.ar/whois">NIC whois</A>

<img src="whois.jpeg">


Podemos tener toda la informacion sobre el DNS del Huergo.

---

### Ataques a DNS

Son aquellos ataques dirigidos para afectar o modificar el funcionamiento de un servidor DNS. Los ataques a DNS tienen varias formas, que pueden ocasionar diversas repercusiones según su tipo. Los mas populares son:

##### Ataque por Dominio Fantasma

Es un tipo de ataque DDoS que se realiza configurando un grupo de servidores DNS que no responden a las solicitudes o lo hacen lentamente, impidiendo las comunicaciones.

Cuando un servidor DNS no conoce una direccion IP, se encargara de buscar la dirección en otros servidores DNS conectados, utilizando la recursividad.
Los ataques de dominio fantasma son un metodo para interrumpir este proceso de busqueda que realiza el servidor, desperdiciando los recursos del servidor en busquedas no funcionales, llegando hasta el punto de consumir todos los recursos posibles. Entonces, el servidor ignorara las consultas legitimas y seguira centrandose en otros servidores que no responden. 

##### Ataque por bloqueo

Es un tipo de ataque en formato DDos con dominios y resolutores especiales configurados interrumpiendo la comunicacion entre el servidor y el cliente. EN vez de enviar la respuesta correcta, respondecon paquetes de datos aleatorios, manteniendo al servidor ocupado esperando una respuesta correcta que nunca llega, agotando la reserva de conexiones disponibles.

##### Ataque por inundacion

Es un tipo de ataque del tipo DDos en el cual los intrusos inundan los servidores DNS de un dominio determinado en un intento por interrumpir la resolucion DNS. Si se interrumpe, se compromete la capacidad de respuesta al trafico legitimo.  

##### Ataque por espionaje del caché

En este ataque, los atacantes envenenan el caché de un DNS engañando a sus solucionadores con informacion falsa de almacenamiento caché, teniendo como resultado al solucionador enviando la direccion IP equivocada a los clientes, derivando en ellos navegando en un sitio WEB equivocado.

Las direcciones IP son los "números de habitación" de Internet y habilitan el tráfico para llegar hasta los lugares adecuados. Los cachés del solucionador de DNS son los encargados de direccionarte en las "instalaciones". Cuando almacenan información errónea, el tráfico se dirige a sitios equivocados, hasta que se corrige la información almacenada en caché (Debe tenerse en cuenta que esto no desconecta realmente a los sitios web de sus direcciones IP reales).

Este procedimiento permite que un atacante consulte sobre algunos dominios especificos en servidores DNS.

##### Ataque DDos/ Dos

Ataque Dos o Denial of service, es un ataque traducido al castellano como Denegacion de servicios, como su nombre indica se encarga de que el servicio corriendo caiga de la red a traves de una masiva entrega de paquetes.

Porque se distingue DDos y Dos, porque en el Dos attack una persona se encarga del envio masivo, en cambio en DDos attack, muchas maquinas, por lo general botnets(red de bots), se encargan de los envios, este ultimo es mas efectivo contra proyectos medianos a grandes, ya que el envio masivo se multiplica por cada maquina y podemos llegar a generar hasta gb de envios con las suficientes maquinas.

---

### Tranferencia de Zona

Es un tipo de transacción de DNS. Es uno de varios mecanismos disponibles para administradores para replicar bases de datos DNS a través de un conjunto de servidores DNS.

Suelen ser utilizados por los atacantes para recolectar información acerca de la infraestructura y subdominios de la posible víctima –aunque existen herramientas automatizadas para hacerlo, como por ejemplo Dnsnum. De esta última vemos una captura de pantalla a continuación:

<img src="dnsenum.jpg">

Puede verse con claridad cómo con solo indicarle unos pocos parámetros (en este caso –enum para enumerar la información) ya comienza con la recolección de información, no solamente de los servidores DNS sino también haciendo búsquedas en Internet. Si bien hace todo por sí sola con solo indicarle el dominio, debe comprenderse cómo funciona por detrás.
Una transferencia de zona utiliza el protocolo TCP para el transporte, y toma la forma de una transacción de cliente-servidor. El cliente que solicita una transferencia de zona puede ser un servidor esclavo o servidor secundario, que solicita datos de un servidor maestro, a veces llamado un servidor primario. La parte de la base de datos que se replica es una zona.
Este ataque pretende hacernos pasar por un servidor secundario, solicitar una transferencia de zona, lo que nos permitira visualizar los subdominios de nuestro objetivo.

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

---

### Bibliografia 

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

