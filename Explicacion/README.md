## DNS 

	Domain name system

### Objetivo 
	
El objetivo principal es un espacio de nombres consistente que sea utilizado para referirse a los recursos. Para evitar problemas causados por extensiones especiales, los nombres no necesitarán contener identificadores de red, direccines, rutas o información similar como parte del nombre.

### Historia 

El mapeo de las direcciones a nombres de host están gestionados por el Network Information Center (NIC) en un sólo fichero (HOSTS.TXT), el cual fue distribuido a todos los hosts mediante FTP. El ancho de banda de red total consumido en la distribución de este escenario es proporcional al cuadrado del número de hosts en la red. 

Incluso cuando se utilizan múltiples niveles de FTP, la carga de salida FTP en los NIC de los 	hosts es considerable. No se tuvo una buena previsión del futuro y explosivo crecimiento en el número de hosts.

De la misma manera ocurrió con las redes. Los hosts de la ARPANET original fueron sustituidos por redes locales de estaciones de trabajo. Las organizaciones administraron localmente sus propios nombres y direcciones, pero tuvieron que esperar bastante al NIC para que HOSTS.TXT estuviera actualizado con esos cambios en Internet. Las organizaciones también querían alguna estructura local en el espacio de nombres.

Al volverse más sofisticadas las aplicaciones en Internet, se creó la necesidad de tener un servicio de nombres de propósito general.

El resultado de esta fueron varias ideas acerca del espacio de nombres y su gestión.Los propósitos cambiaron, pero la idea común era la de un espacio de nombres jerárquico que se correspondiera con la estructura de la organización y del uso del "."  como caracter de unión entre los niveles de la jerarquía.

Los términos "dominio" o "nombre de dominio" son utilizados en muchos contextos más allá de lo que DNS describe aquí. El término nombre de dominio se utiliza muy a menudo para referirse a un nombre con una estructura indicada por puntos, sin relación alguna con DNS. Esto se cumple en el direccionamiento de correo electrónico. 

### Ataques a DNS

Que la enumeracion de los dns sea posible es una vulnerabilidad clave, ya que con este pueden sacar mucha informacion sobre nuetro sitio web.

Se Pueden enumerar los DNS por medio de ataques de fuerza de bruta, transferencia de zona, resolucion inversa de registros.

#### DNS cache snooping 

Los atacantes pueden envenenar un caché de DNS engañando a los solucionadores de DNS con información falsa de almacenamiento de caché, con el resultado de que el solucionador envíe la dirección IP equivocada a los clientes, y los usuarios intenten navegar a un sitio web que se dirigirá al sitio equivocado.

El envenenamiento de caché de DNS consiste en introducir información falsa en una caché DNS, para que las consultas de DNS devuelvan una respuesta incorrecta y se dirija a los usuarios a sitios web equivocados. El envenenamiento de caché de DNS también se conoce como "suplantación de DNS". Las direcciones IP son los "números de habitación" de Internet y habilitan el tráfico para llegar hasta los lugares adecuados. Las cachés del solucionador de DNS son el "directorio de las instalaciones". Cuando almacenan información errónea, el tráfico se dirige a sitios equivocados, hasta que se corrige la información almacenada en caché. (Debe tenerse en cuenta que esto no desconecta realmente a los sitios web de sus direcciones IP reales)

Este procedimiento le permite a un atacante consultar servidores DNS sobre algunos dominios en especifico  

#### Tranferencia de Zona

Es un tipo de transacción de DNS. Es uno de varios mecanismos disponibles para administradores para replicar bases de datos DNS a través de un conjunto de servidores DNS.

suelen ser utilizados por los atacantes para recolectar información acerca de la infraestructura y subdominios de la posible víctima –aunque existen herramientas automatizadas para hacerlo, como por ejemplo Dnsnum. De esta última vemos una captura de pantalla a continuación:

<img src="dnsenum.jpg">

Puede verse con claridad cómo con solo indicarle unos pocos parámetros (en este caso –enum para enumerar la información) ya comienza con la recolección de información, no solamente de los servidores DNS sino también haciendo búsquedas en Internet. Si bien hace todo por sí sola con solo indicarle el dominio, debe comprenderse cómo funciona por detrás.
Una transferencia de zona utiliza el protocolo TCP para el transporte, y toma la forma de una transacción de cliente-servidor. El cliente que solicita una transferencia de zona puede ser un servidor esclavo o servidor secundario, que solicita datos de un servidor maestro, a veces llamado un servidor primario. La parte de la base de datos que se replica es una zona.
Este ataque pretende hacernos pasar por un servidor secundario, solicitar una transferencia de zona, lo que nos permitira visualizar los subdominios de nuestro objetivo


### Donde se guardan los registros

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

