# Design System & UI/UX Guidelines — Bareo

Este documento establece las directrices visuales, los tokens de diseño y los principios de experiencia de usuario para
la aplicación **Bareo**. Su objetivo es garantizar coherencia en la interfaz, optimizar la usabilidad en entornos
nocturnos y agilizar el uso de la app con una sola mano.

---

## 1. Principios de UX/UI

* **Dark-First Experience:** La interfaz está diseñada prioritariamente para su uso en entornos oscuros. Se priorizan
  fondos oscuros profundos con alto contraste en los elementos de interacción para evitar el deslumbramiento.
* **Diseño para Uso con Una Mano (Thumb Zone):** Las acciones principales (navegación, itinerario activo, guardado y
  confirmación) deben ubicarse en el tercio inferior de la pantalla para ser alcanzables cómodamente con el pulgar.
* **Escaneabilidad Nocturna:** El contenido debe entenderse de un vistazo en entornos de baja luz y alta distracción (
  locales, bares, calle). Uso de badges visuales, tipografía clara e indicadores cromáticos de estado.

---

## 2. Paleta de Colores y Tokens Visuales

### A. Superficies y Fondos

* **Fondo Principal (Canvas):** `#0C0D12` — Negro noche profundo para minimizar la fatiga visual.
* **Superficie Contenedor (Cards / Modales):** `#181920` — Elevación básica para diferenciar componentes sobre el fondo.
* **Superficie Elevada (Destacados / Headers):** `#222430` — Usado en campos de entrada, tarjetas activas y componentes
  flotantes.

### B. Colores de Marca y Acento (Neon Palette)

* **Acento Primario (Electric Pink):** `#FF0055` — Utilizado para botones de acción principal (CTA), estados activos y
  resaltados de marca.
* **Acento Secundario (Cyan Neon):** `#00F0FF` — Utilizado para trazados de rutas en el mapa, indicadores de tiempo y
  elementos de geolocalización.
* **Gradiente de Marca:** Combinación lineal de `Electric Pink` (`#FF0055`) a `Electric Violet` (`#7B2CBF`) para
  banners, headers o categorías destacadas.

### C. Colores Semánticos y Feedback

* **Texto Principal:** `#F4F5F7` (Blanco cálido de alto contraste).
* **Texto Secundario:** `#9D9EA9` (Gris medio para metadatos, horarios y descripciones).
* **Estado Abierto / Buen ambiente:** `#00E676` (Verde Neón).
* **Estado Moderado / Concurrido:** `#FFB300` (Ámbar).
* **Estado Lleno / Alta espera:** `#FF3366` (Rojo Neón).

---

## 3. Tipografía

La tipografía oficial del proyecto es **Plus Jakarta Sans** (o en su defecto, la tipografía sans-serif nativa del
sistema operativo).

### Jerarquía Tipográfica

* **Display / Títulos Principales:** `28px` | Bold (`700`) | Encabezados de ruta, títulos de ciudad.
* **Título de Sección:** `20px` | SemiBold (`600`) | Nombres de locales y paradas principales.
* **Cuerpo Principal:** `16px` | Regular (`400`) | Nombres de itinerarios, descripciones breves.
* **Cuerpo Secundario:** `14px` | Regular (`400`) | Horarios sugeridos, direcciones, precios.
* **Etiquetas y Badges:** `12px` | Medium (`500`) | Categorías (Música, Ambiente, Vestimenta).

---

## 4. Sistema de Espaciado y Layout

El diseño se rige por un sistema de retícula basado en múltiplos de **8px** (y excepciones de **4px** para
micro-espaciados).

### Escala de Espaciado

* **Micro (4px):** Separación interna entre icono y texto.
* **Compacto (8px):** Separación entre badges, chips y elementos dentro de una misma tarjeta.
* **Base (16px):** Margin lateral de pantallas, padding interno de tarjetas y contenedores.
* **Sección (24px):** Distancia vertical entre bloques principales de contenido.
* **Especial (32px / 48px):** Separación de modales desplegables (*Bottom Sheets*) y botones flotantes.

### Bordes y Redondeo

* **Tarjetas y Botones:** `16px` de radio para un aspecto moderno y suave.
* **Badges y Chips de Categoría:** Totalmente redondeados (`Pill Shape`).
* **Hoja Desplegable (Bottom Sheet):** `24px` de radio en las esquinas superiores.

---

## 5. Componentes de UI Clave

* **Tarjetas de Ruta (Timeline Card):** Muestra de forma vertical u horizontal los pasos del itinerario (Parada 1 ➔
  Parada 2 ➔ Parada 3) conectados por una línea sutil de color acento.
* **Fichas de Ambiente (Vibe Chips):** Elementos visuales compactos con fondo semitransparente que identifican el tipo
  de música (p. ej. *Reggaeton*, *Indie*, *Techno*) y el rango de precio (`$`, `$$`, `$$$`).
* **Indicador de Parada Activa:** Resaltado cromático especial para la parada que se recomienda visitar en la franja
  horaria actual.

---

## 6. Estrategia Adaptativa y Accesibilidad

* **Ancho Máximo Contenido:** En pantallas de gran formato (tablets o plegables), la interfaz no debe estirarse; se
  centra con un ancho máximo de lectura de `600px`.
* **Soporte de Escalado de Texto:** Toda la tipografía debe adaptarse al tamaño de fuente configurado por el usuario en
  el sistema operativo sin solapar elementos.
* **Áreas Táctiles Mínimas:** Cualquier elemento interactivo (botones, iconos, chips) debe tener un área táctil mínima
  de `44px x 44px`.
