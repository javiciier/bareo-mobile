# Product Requirements Document (PRD) — Bareo (MVP Edition)

## 1. Visión General y Propósito

* **Nombre del producto:** Bareo
* **Propuesta de valor:** "Vivir el ambiente de cualquier ciudad con rutas de ocio nocturno creadas por quienes mejor la
  conocen.
* **Concepto MVP:** Plataforma colaborativa para descubrir, crear y seguir itinerarios nocturnos organizados por franja
  horaria e intención de salida.
* **Hipótesis a validar:** Los usuarios no solo consumen rutas guiadas por tiempo, sino que están dispuestos a compartir
  sus propias combinaciones de locales para validar su criterio nocturno.

---

## 2. Público Objetivo y Usuarios Iniciales (Early Adopters)

* **Jóvenes y universitarios (18–30 años):** Estudiantes, colectivos Erasmus y grupos de amigos en ciudades con alta
  densidad de ocio nocturno.
* **Creadores/Embajadores tempranos:** Estudiantes activos y organizadores de eventos locales que aporten la variedad
  inicial de itinerarios.
* **Ubicación inicial:** Lanzamiento piloto en A Coruña.

---

## 3. Funcionalidades del MVP (Scope v1.0)

### A. Exploración e Itinerarios

* **Feed de Rutas de la Comunidad:** Exploración de rutas creadas tanto por usuarios como por el equipo.
* **Vista de Ruta (Timeline):** Detalle secuencial de paradas (ej. 22:00 Bar A ➔ 00:30 Bar B ➔ 03:00 Discoteca C) con
  indicador visual de la parada activa según la hora actual.
* **Ficha de Parada/Local:** Nombre, dirección, estilo musical, rango de precios ($/$$/$$$) y enlace directo a mapas
  externos para la navegación.

### B. Creador de Rutas Simplificado (UGC Light)

* **Flujo ágil de creación:**
    1. Definir nombre de la ruta y etiqueta/ambiente principal (ej. "Previa Indie", "Pachanga / Universitaria").
    2. Buscar e incorporar paradas (usando el buscador de Google Places / Mapbox).
    3. Asignar franja horaria recomendada a cada parada.
* **Publicación instantánea:** La ruta queda visible inmediatamente en el feed de la ciudad.

### C. Interacción y Feedback

* **Guardar Favoritos:** Lista personal de rutas guardadas.
* **Social Light:** Botón de "Me gusta" (Upvote) por ruta y estado rápido del local ("Tranquilo", "Lleno", "Gran
  ambiente").

---

## 4. Fuera de Alcance para el MVP (Out of Scope v1.0)

Para mantener la agilidad del desarrollo inicial, los siguientes módulos **NO** se incluirán en la versión 1.0:

* Edición compleja con fotos/vídeos en las paradas por parte de los usuarios.
* Comentarios de texto libre o chat entre usuarios.
* Panel B2B para locales ni herramientas de pago/promociones monetizadas.
* Moderación automatizada compleja (se gestionará mediante reporte manual de rutas inapropiadas).

---

## 5. Especificaciones Técnicas (Stack 2026)

* **Cliente:** Flutter (Android 9.0+ / iOS 15.0+).
* **UI/UX:** Modo oscuro nativo (*Dark Mode*) prioritario.
* **Backend:** API REST para gestionar usuarios, catálogo de rutas y puntuaciones.
* **Autenticación:** Navegación anónima permitida para explorar rutas; registro obligatorio para crear rutas o dar
  feedback.

---

## 6. Métricas de Éxito del MVP (KPIs)

* **Ratio de Creadores vs. Lectores:** % de usuarios registrados que publican al menos 1 ruta.
* **Engagement por Ruta:** N.º promedio de "Me gusta" y guardados por itinerario publicado.
* **Retención de fin de semana:** Tasa de usuarios activos que regresan de viernes a domingo.
