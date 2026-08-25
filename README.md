# Plantilla de Tesis — UMSA · Carrera de Informática

Plantilla LaTeX para la elaboración del Perfil y la Tesis de Grado de la **Universidad Mayor de San Andrés (UMSA)**, Carrera de Informática.

---

## Estructura del proyecto

```
.
├── Thesis.tex                  # Documento principal (punto de entrada)
├── thesisUMSA.cls              # Clase LaTeX personalizada para la UMSA
├── compile_and_export.sh       # Script de compilación y exportación
├── INF_TESIS_cap1.tex          # Cap. 1 - Introducción
├── INF_TESIS_cap2.tex          # Cap. 2 - Antecedentes
├── INF_TESIS_cap3.tex          # Cap. 3 - Planteamiento del problema
├── INF_TESIS_cap4.tex          # Cap. 4 - Definición de objetivos
├── INF_TESIS_cap5.tex          # Cap. 5 - Marco Referencial
├── INF_TESIS_cap6.tex          # Cap. 6 - Justificación
├── INF_TESIS_cap7.tex          # Cap. 7 - Alcances y limitaciones
├── INF_TESIS_cap8.tex          # Cap. 8 - Aportes
├── INF_TESIS_cap9.tex          # Cap. 9 - Marco Metodológico
├── INF_TESIS_cap10.tex         # Cap. 10 - Marco Teórico
├── INF_TESIS_cap11.tex         # Cap. 11 - Hipótesis
├── INF_TESIS_cap12.tex         # Cap. 12 - Cronograma
├── INF_TESIS_cap13.tex         # Cap. 13 - Referencias bibliográficas
├── apendice.tex                # Página de Anexos
├── image1.jpg                  # Logotipo de la universidad
├── Exports/                    # PDFs exportados (ignorado por git)
└── .gitignore
```

---

## Ramas Git

El proyecto usa **dos ramas** para separar el Perfil de la Tesis:

| Rama    | Propósito                              |
|---------|----------------------------------------|
| `main`  | Perfil de tesis finalizado y aprobado  |
| `tesis` | Escritura activa de la tesis de grado  |

### Ver en qué rama estás

```zsh
git branch
```

### Cambiar de rama

```zsh
# Ir al perfil (solo lectura / referencia)
git checkout main

# Ir a la tesis (trabajo activo)
git checkout tesis
```

### Guardar cambios en la rama activa

```zsh
git add .
git commit -m "Descripción del avance"
```

---

## Compilación y exportación del PDF

### Requisito
Tener instalado **TeX Live** (incluye `pdflatex`).

```zsh
# Verificar instalación
pdflatex --version
```

### Ejecutar el script

```zsh
./compile_and_export.sh
```

El script realiza automáticamente:
1. **Primera pasada** de `pdflatex` → genera índice, lista de tablas/figuras y referencias.
2. **Segunda pasada** de `pdflatex` → actualiza todas las referencias cruzadas.
3. **Exporta** el PDF resultante a la carpeta `Exports/` con el nombre:

```
Exports/Thesis_<rama>_DD_MM_AA_HH_MM_SS.pdf
```

**Ejemplo de salida:**
```
Exports/Thesis_tesis_25_08_26_12_30_45.pdf
Exports/Thesis_main_25_08_26_09_00_00.pdf
```

> La carpeta `Exports/` está en `.gitignore` y no se versiona.

---

## Configuración de tipografía

La tipografía del documento se controla con **una sola línea** al inicio de `Thesis.tex`:

```latex
% ==============================================================
% SWITCH DE TIPOGRAFÍA  ── CAMBIAR SOLO ESTA LÍNEA ──
%   \useTNRtrue   → Times New Roman  (tamaños Word originales)
%   \useTNRfalse  → Latin Modern     (tamaños escalados ×0.9508)
% ==============================================================
\newif\ifuseTNR
\useTNRtrue   % <-- CAMBIAR AQUÍ
```

### Opciones disponibles

| Valor          | Tipografía              | Tamaño base | Tamaños de carátula         |
|----------------|-------------------------|-------------|------------------------------|
| `\useTNRtrue`  | **Times New Roman**     | 12 pt       | Originales (20 pt, 16 pt…)   |
| `\useTNRfalse` | **Latin Modern** (LaTeX)| 11.4 pt*    | Escalados ×0.9508 (19 pt, 15.2 pt…) |

> \* `scrextend` ajusta el tamaño base de 12 pt a 11.4 pt para que el texto de
> Latin Modern ocupe físicamente el mismo espacio que Times New Roman 12 pt en Word.

### ¿Por qué la corrección de escala?
Latin Modern tiene una proporción interna mayor que Times New Roman: un texto de
12 pt en LaTeX/LM mide **~5.29 mm** de alto, mientras que en Word/TNR mide
**~5.03 mm**. El factor 0.9508 corrige esta diferencia para que ambas versiones
sean equivalentes cuando se imprimen.

---

## Configuración de la carátula

Los datos de la carátula se editan en `Thesis.tex` dentro del bloque `\infothesis[...]`:

```latex
\infothesis[
    author     = {Nombre Completo del Autor},
    advisor    = {M.Sc. Nombre del Tutor},
    title      = {Título de la tesis},
    perfil     = {Perfil de Tesis de Grado},
    titledegree= {Tesis de Grado para obtener el Título de Licenciatura en Informática},
    degree     = {Mención Ingeniería de Sistemas Informáticos},
    university = {Universidad Mayor de San Andrés},
    faculty    = {Facultad de Ciencias Puras y Naturales},
    department = {Carrera de Informática},
    city       = {La Paz -- Bolivia},
    date       = {2026},
]
```

Para cambiar el logotipo:
```latex
\logouniversity[100mm]{image1.jpg}
```

---

## Márgenes del documento

Configurados en `Thesis.tex` según normativa UMSA:

| Margen    | Valor  |
|-----------|--------|
| Izquierdo | 4.0 cm (encuadernado) |
| Superior  | 4.0 cm |
| Derecho   | 2.5 cm |
| Inferior  | 2.5 cm |

La carátula usa márgenes propios definidos con `\newgeometry{...}` y restaurados
con `\restoregeometry` al finalizar.

---

## Numeración de páginas

- **Páginas preliminares** (índices, listas): numeración **romana** (I, II, III…) en esquina inferior derecha.
- **Cuerpo del documento**: numeración **arábiga** (1, 2, 3…) en esquina inferior derecha a 1.5 cm del borde.

---

## Dependencias LaTeX requeridas

Los siguientes paquetes deben estar disponibles en la instalación de TeX Live:

| Paquete       | Uso                                      |
|---------------|------------------------------------------|
| `geometry`    | Configuración de márgenes                |
| `fancyhdr`    | Estilo de encabezado/pie de página       |
| `titlesec`    | Formato de secciones y subsecciones      |
| `mathptmx`    | Tipografía Times New Roman (modo TNR)    |
| `lmodern`     | Tipografía Latin Modern (modo LM)        |
| `scrextend`   | Ajuste de tamaño base de fuente          |
| `pdfrender`   | Efecto extra-bold en títulos de sección  |
| `setspace`    | Control de interlineado                  |
| `longtable`   | Tablas multipágina                       |
| `multirow`    | Celdas combinadas en tablas              |
| `tikz`        | Diagramas y gráficos vectoriales         |
| `xcolor`      | Colores                                  |
| `graphicx`    | Inclusión de imágenes                    |
| `babel`       | Soporte de idioma español                |
| `inputenc`    | Codificación UTF-8                       |
| `fontenc`     | Codificación de fuente T1                |
| `float`       | Control de posición de flotantes         |

Todos estos paquetes están incluidos en una instalación estándar de **TeX Live**.
