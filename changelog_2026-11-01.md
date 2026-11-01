# Registro de Cambios y Mejoras Implementadas (Changelog)
**Fecha:** 1 de noviembre de 2026  
**Proyecto:** Protocolo para la votación electrónica basado en criptografía post-cuántica de retículos  
**Institución:** Universidad Mayor de San Andrés (UMSA) — Carrera de Informática  
**Autor:** Flavio Abdon Condori Vela  

---

## 1. Reestructuración Modular de Secciones (Arquitectura de Archivos)
Para optimizar el mantenimiento, la revisión por pares y el control de versiones en Git, tanto el **Capítulo 2** como el **Capítulo 3** se descompusieron completamente, extrayendo cada sección a su propio archivo independiente `.tex`:

### Estructura del Capítulo 2 (`Capitulos_tesis/secciones_cap2/`)
1. `sec01_votacion_propiedades.tex`: Votación Electrónica y Propiedades de Seguridad (evolución histórica, mix-nets, homomórfico, firmas ciegas, paradoja frente a banca electrónica).
2. `sec02_cripto_clasica_cuantica.tex`: Criptografía de Clave Pública Clásica y su Vulnerabilidad Cuántica (algoritmo de Shor, Grover, impacto en RSA/ECC).
3. `sec03_reticulos_geometricos.tex`: Fundamentos Geométricos de la Criptografía Basada en Retículos (SVP, CVP, algoritmo LLL, conjetura de dureza cuántica).
4. `sec04_lwe_aritmetica.tex`: Aritmética Modular y el Problema Learning With Errors (LWE, reducción cuántica de Regev del peor caso al caso promedio, distribución binomial centrada $\text{CBD}_\eta$).
5. `sec05_ring_module_lwe.tex`: De Álgebra Matricial a Polinomios: Ring-LWE y Module-LWE (anillo cociente, matrices sobre módulos, raíces primitivas).
6. `sec06_ml_kem_fips203.tex`: Mecanismo de Encapsulamiento de Claves ML-KEM (FIPS 203, transformación Fujisaki-Okamoto, parámetros de seguridad).
7. `sec07_ml_dsa_fips204.tex`: Esquema de Firma Digital ML-DSA (FIPS 204) y Module-SIS (Fiat-Shamir con abortos, muestreo de rechazo, parámetros vectoriales).
8. `sec08_fips202_keccak.tex`: Funciones Esponja y el Rol Estructural del Estándar FIPS 202 (Keccak, SHA3-256, SHAKE128/256, sampling determinista).
9. `sec09_verificacion_formal.tex`: Verificación Formal de Protocolos de Seguridad (modelo Dolev--Yao, reescritura multiconjunto en Tamarin Prover, motor Maude).
10. `sec10_tabla_propiedades_limites.tex`: Matriz de Correspondencia entre Propiedades de Seguridad, Mecanismo Tecnológico y Evidencia Formal/Empírica.

### Estructura del Capítulo 3 (`Capitulos_tesis/secciones_cap3/`)
1. `sec01_enfoque_metodologico.tex`: Enfoque Metodológico de Desarrollo e Ingeniería de Software (Design Science Research - DSR, fases de Vaishnavi y Kuechler).
2. `sec02_arquitectura_despliegue.tex`: Arquitectura del Sistema (6 capas) y Diagrama de Despliegue Físico-Lógico UML.
3. `sec03_casos_uso_procesos.tex`: Modelado de Casos de Uso (9 CUs con relaciones `\guillemotleft include\guillemotright` y `\guillemotleft extend\guillemotright`) y Diagrama de Actividades.
4. `sec04_diagramas_secuencia.tex`: Diagramas de Secuencia UML del Protocolo (emisión/depósito y escrutinio/desencapsulamiento).
5. `sec05_maquina_estados.tex`: Diagramas de Máquina de Estados UML (ciclo de vida de la boleta y estados del elector).
6. `sec06_diseno_base_datos.tex`: Diseño de Base de Datos: Modelo E-R, Modelo Relacional 3FN con PK compuesta `(id_eleccion, id_votante)`, índice $\mathcal{O}(\log n)$, transacción atómica `UPDATE ... WHERE ha_votado=FALSE` y diccionario de datos en `longtable`.
7. `sec07_diagrama_componentes.tex`: Diagrama de Componentes de Software UML.
8. `sec08_diagrama_clases.tex`: Diagrama de Clases UML Exhaustivo y Estructuras de Datos.
9. `sec09_ceremonia_claves_identidad.tex`: Ceremonia de Generación de Claves ($dk_{\text{AC}}$ en HSM offline), Flujo de Disociación Real de Identidad (shuffle, redondeo temporal, padding fijo a 32 B, AAD en AES-GCM) y Tabla del Modelo de Adversarios.
10. `sec10_argumento_seguridad_computacional.tex`: Argumento de Reducción Criptográfica (Paso 1: IND-CCA2 + AES-GCM; Paso 2: EUF-CMA de ML-DSA; Paso 3: Unicidad por estado mutable).
11. `sec11_implementacion_pqc.tex`: Implementación del Prototipo Post-Cuántica (biblioteca C `libpqc_core.dylib`, enlace Python FFI, API Flask REST).
12. `sec12_verificacion_tamarin.tex`: Verificación Formal en Tamarin Prover (modelo con unicidad por estado lineal `NoHaVotado(idV) -> YaVoto(idV)` y lemas condicionados).
13. `sec13_validacion_kat_fallos.tex`: Validación Experimental de Vectores KAT del NIST (ACVP, commit PQClean) y Pruebas de Inyección de Fallos (*Bit-Flipping* con rechazo implícito vs explícito).
14. `sec14_protocolo_clasico_benchmark.tex`: Protocolo Equivalente de Control Clásico (RSA-2048 / ECDSA P-256), Metodología de Benchmark ($N \ge 1000$, CPU fija, IQR, IC 95% bootstrap) y Análisis de Equivalencia de Seguridad.

---

## 2. Objetivo 6, Hipótesis H1 y Argumento Computacional (Punto 1)
* **Objetivo Específico 6 (`Capitulos_tesis/TESIS_cap1.tex`):**
  > *«Modelar formalmente el protocolo y verificar en Tamarin Prover sus propiedades de integridad y confidencialidad bajo el modelo Dolev-Yao, y argumentar su seguridad frente a adversarios cuánticos mediante reducción a los supuestos de seguridad de FIPS 203 y FIPS 204.»*
* **Hipótesis H1 (`Capitulos_tesis/TESIS_cap1.tex`):**
  Sustitución de «verificadas formalmente mediante Tamarin Prover» por:
  > *«verificadas simbólicamente y sustentadas en las garantías computacionales de FIPS 203/204»*.
* **Argumento Computacional (`sec10_argumento_seguridad_computacional.tex`):**
  * *Paso 1:* Reducción de la confidencialidad a IND-CCA2 de ML-KEM-768 más la seguridad semántica y de autenticación de AES-256-GCM (esquema KEM-DEM de Cramer-Shoup).
  * *Paso 2:* Reducción de la integridad y autenticidad a la no falsificabilidad existencial (EUF-CMA) de ML-DSA-65 (sustentada en Module-SIS).
  * *Paso 3:* Demostración de que la unicidad del sufragio descansa en el control de estado transaccional en el servidor (`UPDATE padron_electoral SET ha_votado=TRUE ... WHERE ha_votado=FALSE`), no en supuestos criptográficos.

---

## 3. Corrección del Modelo Formal en Tamarin Prover (Punto 2 y 4)
* **Archivo formal corregido:** `tamarin_protocolo.spthy`.
* **Unicidad con estado:** Eliminación de la restricción `restriction Unicidad_Voto`. Se modeló la unicidad de forma nativa consumiendo el hecho lineal `NoHaVotado(idV)` para producir `YaVoto(idV)`.
  * *Resultado del motor Maude 3.5.1:* `unicidad (all-traces): verified (14 steps)` en 1.25 segundos.
* **Confidencialidad antes del escrutinio:** Eliminación de `idV` del ánfora digital y de la regla de apertura. Se formuló el lema de secreto temporal condicionado a no revelación de claves:
  * *Resultado del motor Maude 3.5.1:* `secreto_voto (all-traces): verified (13 steps)` en 1.31 segundos.
* **Recibo firmado por el servidor:** Se incorporó `firma_SV = sign(recibo_hash, ~sk_SV)` emitido en el hecho `Out(...)`.
* **Reglas de corrupción:** Añadidas `Reveal_Clave_Votante` y `Reveal_Clave_AC`, condicionando los lemas mediante `not(Ex ent id #r. Rev(ent, id) @#r)`.
* **Anexos agregados:**
  * **Anexo A (`apendice.tex`):** Código `.spthy` completo.
  * **Anexo B (`apendice.tex`):** Transcripción de la salida cruda de `tamarin-prover` con versión, fecha y pasos deductivos.

---

## 4. Flujo de Identidad, Disociación y Modelo de Adversarios (Punto 3 y 4)
* **Renombrado de clave:** Se cambió `dk_SV` por `dk_AC` en todo el documento, diagramas y especificaciones.
* **Ceremonia de claves:** Se detalló la generación de $dk_{\text{AC}}$ en la Autoridad de Conteo dentro de un HSM/equipo *air-gapped*, exportando exclusivamente $ek_{\text{AC}}$ y resguardando $dk_{\text{AC}}$ bajo custodia dual notarial.
* **Disociación estricta de identidad:**
  * El SV valida credencial y firma, y transfiere al ánfora únicamente la tupla anónima $\langle ct_{\text{kem}}, c_{\text{voto}}, \text{nonce}, id_{\text{eleccion}} \rangle$.
  * Permutación aleatoria (*shuffle*) criptográfica de boletas antes de exportarlas a la AC.
  * Eliminación de metadatos de red (`ip_origen`) de las tablas electorales.
  * Redondeo temporal de marcas de tiempo en padrón y ánfora.
  * Codificación de voto de longitud fija (relleno determinista a 32 bytes) para neutralizar análisis de tráfico por longitud de paquete.
  * Incorporación de $id_{\text{eleccion}}$ y $ct_{\text{kem}}$ como AAD en AES-256-GCM.
* **Cuadro del Modelo de Adversarios (`Cuadro 3.1`):** Delimitación exhaustiva de lo que observa y no observa cada actor (Atacante de Red, SV Malicioso, AC Maliciosa, Colusión SV+AC, DBA), demostrando formalmente que la privacidad se sostiene frente a red, SV y AC aislados, y señalando con rigor que la colusión coordinada entre SV y AC constituiría el límite de ruptura del anonimato.

---

## 5. Matriz de Propiedades y Límites Declarados (Punto 5)
* **Cuadro 2.3 (`sec10_tabla_propiedades_limites.tex`):** Matriz completa que mapea:
  * Confidencialidad del voto $\to$ Sí (parcial) $\to$ ML-KEM-768 + AES-GCM $\to$ Lema formal y reducción IND-CCA2.
  * Integridad del sufragio $\to$ Sí $\to$ ML-DSA-65 $\to$ Lema formal y reducción EUF-CMA.
  * Unicidad y elegibilidad $\to$ Sí $\to$ Control de estado lineal transaccional $\to$ Lema de unicidad.
  * Verificabilidad individual E2E $\to$ Parcial $\to$ Recibo firmado SHA3-256 $\to$ Pruebas funcionales de auditoría.
  * Verificabilidad universal $\to$ No $\to$ Límite declarado (requiere tablón público o Mix-Net).
  * Libertad de recibo (*receipt-freeness*) $\to$ No $\to$ Límite explícito declarado.
  * Resistencia a la coacción (*coercion resistance*) $\to$ No $\to$ Límite explícito declarado.
* **Capítulo 1:** Se trasladaron *receipt-freeness* y *coercion resistance* a la subsección formal de Límites de la investigación.

---

## 6. Metodología de Benchmark y Correcciones Técnicas (Punto 6 y 7)
* **Terminología científica:** Sustitución de «cuasi-experimental» por «evaluación experimental controlada (benchmark)».
* **Rigor estadístico:** Protocolo de medición con calentamiento (*warmup*), $N \ge 1000$ repeticiones por primitiva, fijación de afinidad de CPU, mediana, rango intercuartílico (IQR) e intervalos de confianza al 95% calculados por remuestreo *bootstrap*.
* **Criterio de hipótesis:** Razón PQC/Clásico $\le 1.30$, vinculada al Requerimiento No Funcional RNF1 (tiempo de respuesta $\le 100$ ms).
* **Equivalencia de seguridad:** Discusión sobre los niveles 1 (ML-KEM-512 / ML-DSA-44 vs. RSA-3072 / P-256) y 3 (ML-KEM-768 / ML-DSA-65 vs. RSA-7680 / P-384), declarando que la línea base con RSA-2048 opera a un nivel de seguridad clásico inferior (112 bits).
* **NTT:** Ajustada la explicación matemática:
  > *«En ML-DSA, $q = 8380417 \equiv 1 \pmod{2n}$ permite una NTT completa con 256 raíces primitivas; en ML-KEM, $q = 3329$ solo admite raíces 256-ésimas, por lo que se usa una NTT incompleta factorizada en anillos cuadráticos irreducibles.»*
* **Firma ML-DSA-65:** Desglose exacto de los 3309 bytes: $\tilde{c}\ (48\text{ B}) + \mathbf{z}\ (3200\text{ B}) + \mathbf{h}\ (61\text{ B}) = 3309\text{ B}$.
* **Inyección de fallos (*Bit-Flipping*):** Reporte diferenciado entre el rechazo implícito de ML-KEM.Decaps (que deriva una clave espuria que luego falla en la etiqueta GMAC de AES-GCM) y el rechazo explícito de ML-DSA.Verify (retorno de código de error $-1$).
* **KAT:** Citación de los vectores de prueba de referencia del NIST ACVP y el commit de PQClean.
* **Serialización canónica:** Especificación determinista inspirada en RFC 8785 (JCS) con marcas de tiempo en enteros (milisegundos epoch) y cadenas binarias en hexadecimal.
* **Base de datos:** Complejidad de búsqueda en índice corregida a $\mathcal{O}(\log n)$ (árbol B+), clave primaria compuesta `(id_eleccion, id_votante)` y eliminación de campos duplicados.
* **LWE/SVP:** Se cambió «demostrada» por «se conjetura» para la dureza cuántica de retículos, incorporando la reducción cuántica de Regev desde el peor caso y la distribución binomial centrada ($\text{CBD}_\eta$) de FIPS 203.
* **Citas corregidas:** Chaum (1981, 1982) para firmas ciegas y Benaloh (2006) para el desafío del votante.

---

## 7. Estilo, Redacción y LaTeX (Punto 8)
* Eliminación de cualquier mención al «tribunal evaluador» en el cuerpo del documento.
* Tono suavizado en todo el texto («absoluto», «concluyente» $\to$ «en el modelo y bajo los supuestos declarados»).
* Retirada la numeración manual de los `\subsubsection`.
* Sustituidos los operadores matemáticos de estereotipo `$\ll ... \gg$` por comillas tipográficas `\guillemotleft ... \guillemotright`.
* Tablas y diagramas adaptados con `tabularx`, `longtable` y `listings`.

---

## 8. Métricas de Compilación Final
* **Script de compilación:** `./compile_and_export.sh`
* **Compilador:** `pdfTeX 3.141592653-2.6-1.40.29 (TeX Live 2026)`
* **Código de salida:** `0` (Sin errores sintácticos, sin referencias indefinidas).
* **Extensión del documento:** 127 páginas.
* **Artefacto PDF exportado:** `Formato de tesis en LaTeX/Exports/Thesis_tesis_01_11_26_09_50_17.pdf`.
