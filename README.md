# Proyecto de Pruebas Automatizadas con Karate - ServeRest

Este proyecto contiene una suite de pruebas automatizadas para la API **ServeRest** (https://serverest.dev/), desarrolladas utilizando el framework **Karate DSL**. El objetivo principal es validar el flujo completo (CRUD) del módulo de **Usuarios**, asegurando la calidad y el correcto funcionamiento de los endpoints.

## 1. Prerrequisitos

Antes de ejecutar las pruebas, asegúrate de tener instalado y configurado lo siguiente en tu sistema:

*   **Java 17**: El proyecto requiere JDK 17 o superior.
*   **Apache Maven**: Herramienta para la gestión de dependencias y ejecución de pruebas.
*   **Git**: Para clonar el repositorio.

**Variables de Entorno recomendadas:**
*   `JAVA_HOME`: Debe apuntar al directorio de instalación de tu JDK.
*   `M2_HOME`: Debe apuntar al directorio de instalación de Maven.

## 2. Estructura del Proyecto

El proyecto sigue la estructura estándar de Maven/Karate:

*   `src/test/java/examples/usuarios`: Contiene los archivos `.feature` (pruebas) y `.json` (data) específicos para el módulo de usuarios.
    *   `registrarusuario.feature`: Validación de creación (POST).
    *   `listarusuarios.feature`: Validación de obtención de listas (GET).
    *   `buscarusuarioid.feature`: Búsqueda específica (GET /{id}).
    *   `actualizarusuario.feature`: Modificación de datos (PUT).
    *   `eliminarusuario.feature`: Eliminación de registros (DELETE).
*   `karate-config.js`: Archivo de configuración global (Base URL, Entornos).

## 3. Ejecución de las Pruebas

Todas las pruebas se ejecutan desde la línea de comandos, ubicándote en la raíz del proyecto.

### Ejecutar todos los casos de prueba (Suite Completa)
Para ejecutar todas las pruebas disponibles en el proyecto utilizando el Runner principal:

```bash
mvn clean test
```

### Ejecutar un Runner específico
Si deseas ejecutar únicamente las pruebas relacionadas con el módulo de Usuarios (definidas en `UsuarioRunner.java`):

```bash
mvn clean test -Dtest=UsuarioRunner
```

### Ejecutar por Etiquetas (Tags)
Si has etiquetado tus escenarios (por ejemplo: `@smoke`, `@regression`, `@happyPath`), puedes ejecutar grupos específicos.

*Ejemplo: Ejecutar solo los escenarios de "Happy Path"*
```bash
mvn clean test -Dkarate.options="--tags @happyPath"
```

*Ejemplo: Ejecutar todo EXCEPTO los escenarios ignorados*
```bash
mvn clean test -Dkarate.options="--tags ~@ignore"
```

### Selección de Entorno
El proyecto está configurado para correr por defecto en el entorno de desarrollo (`dev`). Si deseas especificar un entorno diferente (configurado en `karate-config.js`):

```bash
mvn clean test -Dkarate.env=e2e
```

## 4. Reportes de Ejecución

Al finalizar la ejecución de las pruebas, Karate genera automáticamente un reporte detallado en formato HTML.

Puedes encontrar el reporte principal en la siguiente ruta relativa desde la raíz del proyecto:

`target/karate-reports/karate-summary.html`

**Para visualizarlo:**
1.  Navega a la carpeta `target/karate-reports/` en tu explorador de archivos.
2.  Abre el archivo `karate-summary.html` en tu navegador web (Chrome, Firefox, Edge).

**El reporte incluye:**
*   Resumen gráfico de escenarios exitosos y fallidos.
*   Detalle paso a paso de cada prueba (Gherkin).
*   Logs completos de las peticiones (Request) y respuestas (Response) HTTP.
*   Tiempos de respuesta de cada operación.