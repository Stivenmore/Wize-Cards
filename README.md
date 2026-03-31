# 🦁 WizeCards: Enterprise Learning System

![WizeCards Banner](https://via.placeholder.com/1200x300/1976D2/FFFFFF?text=WizeCards+Workshop)

[![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-02569B?logo=flutter)](https://flutter.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Clean%20Lite-success)]()
[![License](https://img.shields.io/badge/License-MIT-blue)]()

**WizeCards** es una aplicación móvil *Offline-First* diseñada para el aprendizaje corporativo y la retención de conocimiento a largo plazo.

Este proyecto utiliza **Flutter** y una arquitectura escalable para implementar algoritmos de repaso espaciado (**Leitner System**) y renderizado dinámico de UI basado en configuración.

---

## 🚀 Características Clave (Key Features)

* **🧠 Algoritmo Leitner:** Lógica de repaso espaciado para optimizar la memorización.
* **💾 Offline-First:** Persistencia de datos local completa usando **SQLite**.
* **🧬 Config Driven UI:** La interfaz se adapta según el tipo de contenido (Código vs. Idiomas) definido en el JSON.
* **🧱 Clean Architecture Lite:** Estructura modular escalable pero pragmática.
* **♿ Accesibilidad (A11y):** Soporte nativo para lectores de pantalla y feedback háptico.
* **🎨 Diseño Corporativo:** Tema personalizado basado en Material 3.

---

## 🛠️ Tech Stack & Arquitectura

El proyecto sigue una estructura **Vertical por Features** ("Clean Lite"), separando claramente la Lógica de Negocio de la UI.

### Estructura del Proyecto
```text
lib/
├── core/                   # Configuración global (Theme, Router, Utils)
├── data/                   # Capa de Datos (SQLite, Models, DataSources)
├── logic/                  # Lógica Pura (Leitner Algorithm) - Sin Flutter
└── features/               # Módulos Funcionales
    ├── home/               # Dashboard y Listado de Mazos
    ├── decks/              # Detalle de Mazo y Estudio
    └── discover/           # Búsqueda y Descarga de contenido

```

## Figma Design

[Ver diseño en Figma]


## Google Docs
Aqui encontraran lo que se busca trabajar por cada nivel, desde L1 hasta L4 y mucho mas

[Doc del proyecto]



## ✨ Contribuidores

¡Gracias a estas personas maravillosas que han contribuido a este proyecto!

<a href="https://github.com/Stivenmore/Wize-Cards/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Stivenmore/Wize-Cards" />
</a>

Hecho con ❤️ por el equipo de **Wize Mobiles**.
