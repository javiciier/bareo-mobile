# Architecture Guidelines — Bareo

Este documento define la estructura de carpetas, patrones de diseño y flujo de datos para la aplicación **Bareo**. Su
objetivo es garantizar una separación estricta de responsabilidades, testabilidad y escalabilidad.

---

## 1. Visión General del Stack Técnico

* **Framework:** Flutter 3.47 (Dart)
* **Gestión de Estado:** Redux (`redux`, `redux_thunk`, `flutter_redux`)
* **Cliente HTTP:** Dio (con interceptores para JWT/Headers y error handling)
* **Autenticación:** Firebase Auth (Google Sign-In)
* **Arquitectura:** Clean Architecture modularizada por capas.

---

## 2. Estructura de Carpetas (`lib/`)

La aplicación sigue una organización Clean Architecture estructurada en las siguientes carpetas principales:

```text
lib/
├── app/                  # Configuración configuración global de la aplicación
│   ├── configuration/    # Inyección de dependencias, variables de entorno y configuración de servicios
│   ├── l10n/             # Internacionalización (i18n) y archivos de localización traducidos
│   ├── provider/         # Inyección contextual e integraciones de providers/locators globales
│   ├── state/            # Estado global de Redux (Store, Reducers, Actions, Middleware, Selectores)
│   └── theme/            # Configuración visual, colores, tipografías y estilos claros/oscuros
│
├── application/          # Casos de uso y orquestación de lógica de aplicación
│   ├── service/          # Servicios de aplicación que ejecutan tareas atómicas
│   └── usecase/          # Definiciones de casos de uso, entradas y salidas
│
├── domain/               # Reglas de negocio del dominio (Capa pura de Dart)
│   ├── entity/           # Entidades y modelos centrales del negocio
│   ├── exception/        # Excepciones, fallos y errores específicos del dominio
│   ├── repository/       # Contratos e interfaces abstractas de repositorios
│   └── vo/               # Value Objects inmutables con validaciones propias
│
├── infrastructure/       # Implementaciones técnicas, persistencia y comunicación con APIs/servicios externos
│   ├── datasources/      # Fuentes de datos remotas/locales (API REST)
│   ├── dto/              # Data Transfer Objects y mapeadores hacia/desde entidades del dominio
│   ├── persistence/      # Implementaciones concretas de los repositorios definidos en el dominio
│   ├── thirdparty/       # Clientes, wrappers y configuración de librerías/SDKs de terceros
│   └── usecase/          # Implementaciones de casos de uso (detalles de implementación)
│
├── presentation/         # Capa de interfaz de usuario organizando vistas por módulos o características (Feature-First)
│   ├── page/             # Vistas/pantallas globales o genéricas de la app
│   ├── route/            # Definición del enrutamiento de la aplicación (Router, Navigation, Deep Links)
│   └── {feature}/        # Módulos por funcionalidad concreta de la app
│       ├── page/         # Pantallas específicas de esta funcionalidad (Screens/Views)
│       └── widget/       # Componentes visuales y widgets específicos de esta funcionalidad
│
├── shared/               # Utilidades, utilitarios puros y constantes globales compartidas
│   ├── constant/         # Constantes globales de la app (Endpoints, claves de almacenamiento, etc.)
│   └── utils/            # Funciones puras auxiliares, formateadores, validadores y extensiones
│
└── main.dart             # Punto de entrada de la aplicación
```