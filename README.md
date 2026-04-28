🛡️ CiberLex 2026: Neural Security Dashboard
CiberLex es una plataforma web centralizada diseñada para la gestión estratégica de inteligencia en ciberseguridad. Desarrollada como proyecto integral para la asignatura de Arquitectura y Programación de Tecnologías de la Información (APTI), esta herramienta combina la difusión de directrices técnicas y legales con una capa de protección activa contra amenazas web.

🚀 Características Principales
Neural Dashboard (Interfaz Cyber-Neon): Diseño de alto contraste optimizado para ingenieros, utilizando una paleta de colores neón (Cian, Magenta y Púrpura) que reduce la fatiga visual en entornos de monitoreo.

WAF Activo (Web Application Firewall): Filtro de seguridad integrado que detecta y bloquea ataques de Inyección SQL y Cross-Site Scripting (XSS) en tiempo real.

Monitoreo de Sucesos: Tabla de logs persistente que registra la IP, el payload malicioso y la estampa de tiempo de cada intento de intrusión detectado.

Intelligence Feed: Integración de noticias globales de ciberseguridad mediante RSS, manteniendo al administrador actualizado sobre las últimas vulnerabilidades.

Gestión CRUD: Panel administrativo para el registro, edición y eliminación de recursos técnicos y legislativos (NOM, leyes de protección de datos, tips de hardening).

🛠️ Stack Tecnológico
Backend: Java (JSP / Servlets) con arquitectura basada en sesiones seguras.

Frontend: HTML5, CSS3 (Custom Cyber-Neon Styles), JavaScript (Asíncrono para RSS) y Bootstrap 5.3.

Base de Datos: MySQL (Puerto 3307) para almacenamiento de recursos, usuarios y logs de sucesos.

Seguridad: Filtro WAF basado en Expresiones Regulares (RegEx) y validación de sesiones.

📁 Estructura del Proyecto
/web: Contiene las páginas JSP del sistema.

index.jsp: Dashboard principal y monitor de seguridad.

acceso.jsp: Portal de autenticación con diseño de terminal.

filtro_waf.jsp: Núcleo de seguridad y lógica de bloqueo.

/src: Lógica de negocio y controladores Java.


🔧 Configuración del Entorno
Base de Datos: Importar el script SQL incluido en la carpeta /docs.

Conexión: Asegurar que el servidor MySQL esté corriendo en el puerto 3307.

Servidor: Desplegar en Apache Tomcat 8.0+ o GlassFish.

Librerías: Mysql JBCDriver

👤 Desarrollado por
Mena Valdez Sarahi Nayeli 
