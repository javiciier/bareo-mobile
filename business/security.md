# Security Guidelines — Bareo

Este documento establece las políticas de seguridad, el manejo de credenciales y las buenas prácticas que deben seguirse
durante el desarrollo de la aplicación móvil **Bareo**.

---

## 1. Gestión de Secretos y Variables de Entorno

### Regla de Oro

> **NUNCA** subas al repositorio de código (Git) claves de API, certificados, contraseñas, tokens privados o archivos de
> configuración con credenciales.

### Manejo de Variables de Entorno en Flutter

* Las claves de API públicas o de cliente (Google Places, Mapbox, Firebase Config) y las URLs de los servidores se
  gestionan mediante el paquete `flutter_dotenv` leyendo archivos `.env`.
* **Protección en Git (`.gitignore`):**
  Asegúrate de que las siguientes entradas estén estrictamente presentes en el `.gitignore`:
  ```gitignore
    ### Credentials or API Keys ###
    *.env
    *.pem
    *.cert


  # Llaves de Android / iOS
  *.keystore
  *.jks
  key.properties
  GoogleService-Info.plist
  google-services.json
