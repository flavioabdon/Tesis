# Plantilla de Tesis — UMSA · Carrera de Informática

> **Créditos:** Basado en la plantilla de tesis de **Ariel Condo M.** y adaptado para los formatos requeridos por la Carrera de Informática de la Universidad Mayor de San Andrés (UMSA).

---

## 🏷️ Meta Etiquetas / Información del Proyecto

* **Carrera:** Informática (Carrera de Informática UMSA)
* **Institución:** Universidad Mayor de San Andrés (UMSA)
* **Tipo:** Plantilla de Tesis de Grado y Perfil según formato UMSA

---

## 📁 Estructura General del Proyecto

```
.
├── Thesis.tex                  # Documento principal (punto de entrada)
├── thesisUMSA.cls              # Clase LaTeX personalizada (basada en Ariel Condo M.)
├── compile_and_export.sh       # Script de compilación automática
├── README.md                   # Documentación del repositorio
├── image1.jpg                  # Logotipo institucional
├── Capitulos_perfil/           # Archivos del Perfil de Tesis (Rama: main)
│   └── INF_TESIS_cap1.tex a cap13.tex
├── Capitulos_tesis/            # Archivos de la Tesis Final (Rama: tesis)
│   └── TESIS_cap1.tex a cap5.tex y referencias
├── Exports/                    # PDFs compilados con marca de tiempo (ignorado en Git)
└── .gitignore
```

---

## 📐 Márgenes del Documento (Normativa UMSA)

Configurados de forma global en `Thesis.tex` usando el paquete `geometry`:

### Cuerpo del Documento
| Borde | Medida | Propósito |
| :--- | :--- | :--- |
| **Izquierdo** | `4.0 cm` | Espacio reservado para el encuadernado |
| **Superior** | `4.0 cm` | Margen de cabecera estándar |
| **Derecho** | `2.5 cm` | Margen lateral |
| **Inferior** | `2.5 cm` | Margen de pie de página |

### Carátula (`\infothesis`)
La carátula anula temporalmente los márgenes generales mediante `\newgeometry` para lograr una distribución óptima del espacio:
* **Margen Superior:** `2.7 cm`
* **Margen Inferior:** `2.5 cm`
* **Márgenes Laterales:** `2.5 cm` (centrado físico sobre la hoja)

---

## 🔤 Tipografías Incluidas y Corrección de Escala

La plantilla permite alternar entre dos fuentes de forma sencilla mediante un switch al inicio de `Thesis.tex`:

```latex
% ==============================================================
% SWITCH DE TIPOGRAFÍA  ── CAMBIAR SOLO ESTA LÍNEA ──
%   \useTNRtrue   → Times New Roman  (tamaños Word originales)
%   \useTNRfalse  → Latin Modern     (tamaños escalados ×0.9508)
% ==============================================================
\newif\ifuseTNR
\useTNRtrue   % <-- CAMBIAR AQUÍ
```

### Tabla Comparativa de Comportamiento:

| Parámetro | `\useTNRtrue` (Times New Roman) | `\useTNRfalse` (Latin Modern / LaTeX) |
| :--- | :--- | :--- |
| **Fuente** | `mathptmx` | `lmodern` |
| **Tamaño Base** | `12pt` estándar | `11.4pt` corregido |
| **Tamaños Carátula** | Originales de Word (20pt, 16pt, 14pt...) | Escalados por el factor `0.9508` (19pt, 15.2pt...) |

#### ¿Por qué existe esta corrección?
La fuente *Latin Modern* nativa de LaTeX tiene una altura de ojo y rasgos tipográficos mayores que *Times New Roman*. Un tamaño de 12 pt en LaTeX equivale visualmente a un tamaño de 12.6 pt en Word. Al aplicar el factor de corrección `0.9508` en el modo `\useTNRfalse` (Latin Modern), el documento mantiene la misma altura física en milímetros ($5.03\text{ mm}$ de alto real de letra para los títulos principales) que un documento Word redactado en Times New Roman 12 pt.

---

## 🔀 Ramas de Trabajo (Git)

Para una correcta transición del perfil a la tesis de grado, el proyecto utiliza dos ramas independientes:

* **`main`**: Contiene la estructura y textos correspondientes al **Perfil de Tesis** (13 capítulos cortos).
* **`tesis`** (rama activa): Contiene la estructura y desarrollo de la **Tesis de Grado** en 5 capítulos consolidados.

### Cambiar de Rama
```zsh
# Para revisar o compilar el Perfil de Tesis
git checkout main

# Para continuar escribiendo la Tesis de Grado
git checkout tesis
```

---

## ⚙️ Compilación y Exportación Automatizada

Para compilar el documento y generar el PDF con toda la información de la rama activa y fecha del sistema, utiliza el script integrado:

```zsh
./compile_and_export.sh
```

El script se encarga de:
1. Realizar una doble pasada de `pdflatex` para renderizar correctamente tablas, figuras, citas y el Índice de Contenidos.
2. Identificar la rama Git en la que te encuentras (`main` o `tesis`).
3. Almacenar el archivo PDF final en la carpeta `Exports/` con la nomenclatura:
   `Exports/Thesis_<rama>_DD_MM_AA_HH_MM_SS.pdf`
