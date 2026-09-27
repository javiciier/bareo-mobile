# Code Style & Linter Guidelines — Bareo

Este documento establece las convenciones de nombrado, formateado, buenas prácticas y reglas estáticas que deben
seguirse obligatoriamente en todo el código Dart y Flutter del proyecto **Bareo**.

Las reglas aquí definidas están respaldadas de forma automatizada por la configuración de **`analysis_options.yaml`** e
integradas con `package:flutter_lints/flutter.yaml`.

---

## 1. Convenciones de Nombrado

Para mantener la consistencia en todo el repositorio, se aplican las convenciones estándar del SDK de Dart:

### Tipos, Clases, Enums y Extensiones (`PascalCase`)

* Utilizar `PascalCase` para nombrar clases, enums, mixins, typedefs y extensiones.
    ```dart
    class VenueRepositoryImpl implements VenueRepository {}
    enum VenueStatus { open, crowded, closed }
    typedef JsonMap = Map<String, dynamic>;

### Archivos, Carpetas y Prefijos (snake_case)

* Nombrar todos los archivos .dart y carpetas en minúsculas separadas por guiones bajos (snake_case).
    ```dart
    lib/application/service/route_service.dart
    lib/presentation/venue_detail/widget/vibe_chip.dart

### Variables, Métodos, Funciones y Parámetros (camelCase)

* Utilizar camelCase sin guiones para variables, getters/setters, métodos y parámetros.
    ```dart
    final String venueName;
    void loadNearbyRoutes({required String cityId}) {}

### Identificadores Privados (_leadingUnderscore)

* Identificadores o miembros privados deben comenzar con un único guión bajo _.
    ```dart
    class _RouteDetailState extends State<RouteDetail> {
        late final _scrollController = ScrollController();
    }

___ 

## 3. Gestión de Imports (prefer_relative_imports)

Para garantizar la portabilidad y la coherencia dentro de la Clean Architecture de la app:

### Imports Relativos dentro de lib/

* Preferir siempre rutas relativas para referenciar ficheros internos del proyecto en lugar del nombre del esquema o
  paquete.

### Orden de imports

* Librerias nativas del SDK (dart:async, dart:convert, etc).
* Paquetes externos y de Flutter (package:flutter/widgets.dart, package:dio/dio.dart, etc).
* Imports relativos del propio proyecto.

---

## Código limpio y Linter (analysys_options.yaml)

Antes de subir cambios al repositorio o abrir una Pull Request, se debe ejecutar la validación local de formateo y
análisis estático desde la terminal:

    ```bash
    # 1. Aplicar correcciones automáticas de sintaxis
    dart fix --apply
    
    # 2. Formatear automáticamente todo el código
    dart format lib/

    # 3. Ordenar imports
    flutter pub run import_sorter:main
    
    # 4. Ejecutar el análisis estático
    flutter analyze
