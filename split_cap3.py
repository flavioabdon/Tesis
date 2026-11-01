import os
import re

with open('Capitulos_tesis/TESIS_cap3.tex', 'r', encoding='utf-8') as f:
    text = f.read()

# 1. Fix 'tribunal evaluador'
text = text.replace(
    'Para garantizar una documentación de ingeniería rigurosa y comprensible para el tribunal evaluador y la comunidad académica, el sistema se formaliza mediante el estándar de modelado visual UML',
    'Para garantizar una documentación de ingeniería de software rigurosa, reproducible y comprensible para la comunidad académica, el sistema se formaliza mediante el estándar de modelado visual UML'
)

# 2. Fix stereotypes $\ll ... \gg$ -> \guillemotleft ... \guillemotright
text = text.replace(r'$\ll device \gg$', r'\guillemotleft device\guillemotright')
text = text.replace(r'$\ll execution \; env \gg$', r'\guillemotleft execution env\guillemotright')
text = text.replace(r'$\ll artifact \gg$', r'\guillemotleft artifact\guillemotright')
text = text.replace(r'$\ll DBMS \gg$', r'\guillemotleft DBMS\guillemotright')
text = text.replace(r'$\ll secure \; element \gg$', r'\guillemotleft secure element\guillemotright')
text = text.replace(r'$\ll component \gg$', r'\guillemotleft component\guillemotright')
text = text.replace(r'($\ll include \gg$)', r'(\guillemotleft include\guillemotright)')
text = text.replace(r'($\ll extend \gg$)', r'(\guillemotleft extend\guillemotright)')
text = text.replace(r'$\ll include \gg$', r'\guillemotleft include\guillemotright')
text = text.replace(r'$\ll extend \gg$', r'\guillemotleft extend\guillemotright')

# 3. Fix dk_SV -> dk_AC
text = text.replace(r'dk_{SV}', r'dk_{AC}')
text = text.replace('dk_SV', 'dk_AC')
text = text.replace('obtener_dk_para_conteo', 'custodiar_dk_ac')

# 4. Fix signature breakdown in text
text = text.replace(
    r'Desafío $\tilde{c}$ (32 B) + vector $\mathbf{z}$ (2976 B) + pistas $\mathbf{h}$ (84 B).',
    r'Desafío $\tilde{c}$ (48 B) + vector $\mathbf{z}$ (3200 B) + pistas $\mathbf{h}$ (61 B) = 3309 B.'
)

# 5. Fix bit-flipping text
old_flip = r'Se alteró intencionalmente un solo bit en 100 textos cifrados y 100 firmas válidas. En el 100% de los casos, los algoritmos detectaron la inconsistencia y rechazaron la operación con código de error, demostrando resistencia absoluta ante corrupción de datos.'
new_flip = r'''Se evaluó la resistencia ante corrupción e inyección intencional de fallos (\textit{Bit-Flipping}) alterando un solo bit en 100 textos cifrados y 100 firmas válidas, reportando ambos casos por separado:
\begin{itemize}
	\item \textbf{Mecanismo KEM (ML-KEM.Decaps):} Ante un texto cifrado $c$ alterado, el estándar FIPS 203 aplica un \textbf{rechazo implícito} (variante de la transformación Fujisaki-Okamoto). La función no aborta con un código de error visible, sino que deriva deterministamente una clave pseudoaleatoria espuria $\bar{K} = \text{J}(\mathbf{z} \mathbin{\Vert} c)$. Al descifrar en el DEM simétrico, la etiqueta de autenticación GMAC de AES-256-GCM falla invariablemente, abortando la transacción sin filtrar información sobre la clave privada.
	\item \textbf{Firma Digital (ML-DSA.Verify):} Ante una firma alterada o un mensaje adulterado en tránsito, la verificación vectorial constata que la pista $\mathbf{w}_1 = \text{UseHint}(\mathbf{h}, \mathbf{A}\mathbf{z} - c\mathbf{t}_1 \cdot 2^d)$ o el digest del desafío $\tilde{c} = \text{H}(\mu \mathbin{\Vert} \mathbf{w}_1)$ no coinciden, retornando un código de rechazo explícito ($-1$) que descarta la boleta de inmediato.
\end{itemize}'''
text = text.replace(old_flip, new_flip)

# 6. Fix O(1) -> O(log n)
text = text.replace(
    r'mediante un índice único de tiempo constante $\mathcal{O}(1)$',
    r'mediante un índice de árbol B+ de complejidad temporal $\mathcal{O}(\log n)$'
)

# 7. Fix canonical JSON description
old_json = r'función \texttt{json.dumps(..., sort_keys=True, separators=(",", ":"))} conforme al estándar RFC 8785 (\textit{JSON Canonicalization Scheme}, JCS).'
new_json = r'''serialización canónica determinista basada en los lineamientos del estándar RFC 8785 (\textit{JSON Canonicalization Scheme}, JCS). Para neutralizar discrepancias entre arquitecturas heterogéneas, se emplean marcas temporales normalizadas como enteros en milisegundos Unix epoch (eliminando floats imprecisos) y los campos binarios se codifican en cadenas hexadecimales en minúsculas.'''
text = text.replace(old_json, new_json)

# 8. Split into sections
sections_split = re.split(r'(?=\\section\{)', text)
header = sections_split[0]
raw_secs = sections_split[1:]

out_dir = 'Capitulos_tesis/secciones_cap3'
os.makedirs(out_dir, exist_ok=True)

sec_filenames = [
    'sec01_enfoque_metodologico.tex',
    'sec02_arquitectura_despliegue.tex',
    'sec03_casos_uso_procesos.tex',
    'sec04_diagramas_secuencia.tex',
    'sec05_maquina_estados.tex',
    'sec06_diseno_base_datos.tex',
    'sec07_diagrama_componentes.tex',
    'sec08_diagrama_clases.tex',
    'sec11_implementacion_pqc.tex',
    'sec12_verificacion_tamarin.tex',
    'sec13_validacion_kat_fallos.tex',
    'sec14_protocolo_clasico_benchmark.tex'
]

# Write existing sections with modifications
for fname, content in zip(sec_filenames, raw_secs):
    fpath = os.path.join(out_dir, fname)
    with open(fpath, 'w', encoding='utf-8') as sf:
        sf.write(content)

# Section 09: Ceremonia de Claves, Disociación de Identidad y Modelo de Adversarios
sec09_content = r'''% =============================================================================
\section{Ceremonia de Claves, Flujo de Disociación de Identidad y Modelo de Adversarios}
\label{sec:ceremonia_identidad_adversarios}
% =============================================================================

\subsection{Ceremonia de Generación y Custodia de Claves (Ceremonia Criptográfica)}

La seguridad del protocolo descansa en la estricta segregación de roles entre el Servidor de Votación (SV) y la Autoridad de Conteo (AC). Para asegurar que la clave privada de desencapsulamiento $dk_{\text{AC}}$ permanezca completamente inaccesible durante la jornada electoral, su generación se lleva a cabo mediante una \textbf{ceremonia de claves formal} previa a la apertura de las mesas:

\begin{enumerate}
	\item \textbf{Generación Aislada (HSM / Token Criptográfico):} La Autoridad de Conteo ejecuta el algoritmo \texttt{crypto\_kem\_keypair} de ML-KEM-768 en un entorno físicamente desconectado de la red (\textit{air-gapped}) o en el interior de un Módulo de Seguridad de Hardware (HSM). La clave privada $dk_{\text{AC}}$ (2400 bytes) se almacena bajo control de acceso criptográfico con esquema de custodia compartida multifirma (o secreto compartido de Shamir), y jamás es transferida ni cargada en el servidor web de votación.
	\item \textbf{Exportación y Publicación de $ek_{\text{AC}}$:} Únicamente la clave pública de encapsulamiento $ek_{\text{AC}}$ (1184 bytes) se exporta y publica en el repositorio público oficial y en el Servidor de Votación, permitiendo que cualquier votante habilitado pueda cifrar su voto mediante KEM.
	\item \textbf{Respaldo Sellado y Apertura Pospuesta:} La clave $dk_{\text{AC}}$ se resguarda en sobres de seguridad con sello inviolable bajo custodia dual de notarios electorales y delegados académicos. Solo tras el cierre formal de los comicios y la verificación de la firma de clausura del ánfora, la AC introduce la clave $dk_{\text{AC}}$ en la estación de escrutinio para desencapsular los secretos compartidos.
\end{enumerate}

\subsection{Flujo de Identidad y Disociación Estricta de Datos}

Para transformar la noción abstracta de confidencialidad en una garantía técnica verificable y defendible, el protocolo implementa una \textbf{disociación estructural de identidad} en el ciclo de vida del sufragio:

\begin{itemize}
	\item \textbf{Recepción y Separación en el SV:} El Servidor de Votación recibe el paquete firmado $\langle \text{boleta}, \sigma_V, \sigma_{\text{AR}} \rangle$. Verifica la credencial del elector en el padrón y su firma $\sigma_V$. Si ambas firmas son válidas y el elector no ha votado, el SV actualiza el padrón a \texttt{ha\_votado = TRUE} y desacopla por completo la identidad: al ánfora digital y a la AC se transfiere exclusivamente la tupla anónima $\langle ct_{\text{kem}}, c_{\text{voto}}, \text{nonce}, id_{\text{eleccion}} \rangle$, sin vincular $id_V$ con el texto cifrado.
	\item \textbf{Permutación Aleatoria (\textit{Shuffle}) de Boletas:} Antes de transferir las boletas a la AC para el conteo, el SV aplica una permutación pseudoaleatoria criptográfica sobre el conjunto de votos cifrados. Esto destruye la correlación temporal entre el orden de llegada de los electores y el orden de escrutinio.
	\item \textbf{Eliminación de Metadatos de Red:} La dirección IP de origen y la información del agente de usuario (\textit{User-Agent}) se eliminan de la tabla del ánfora digital, almacenándose únicamente en bitácoras efímeras de infraestructura con una retención mínima estricta para mitigación de ataques de denegación de servicio (DoS).
	\item \textbf{Redondeo Temporal de Marcas de Tiempo:} Los campos temporales en el padrón electoral y en el ánfora se redondean por lote o por hora de sufragio, imposibilitando ataques de enlace estadístico basados en correlación de marcas de tiempo al milisegundo.
	\item \textbf{Codificación de Voto de Longitud Fija:} El voto del ciudadano se codifica con longitud constante de 32 bytes (1 byte para el índice de la opción y 31 bytes de relleno criptográficamente seguro CSPRNG). Esto garantiza que el texto cifrado $c_{\text{voto}}$ posea exactamente 48 bytes (32 bytes de carga útil + 16 bytes de etiqueta GMAC) para todos los candidatos, neutralizando fugas por análisis de tamaño de tráfico.
	\item \textbf{Uso de $id_{\text{eleccion}}$ como Datos Autenticados Adicionales (AAD):} Tanto el identificador de la elección $id_{\text{eleccion}}$ como el texto cifrado $ct_{\text{kem}}$ se incorporan como AAD en el cifrado AES-256-GCM, vinculando criptográficamente la boleta a su elección específica e impidiendo ataques de trasplante entre distintas mesas.
\end{itemize}

\subsection{Modelo de Adversarios y Matriz de Visibilidad}

El Cuadro \ref{tab:modelo_adversarios} define formalmente el modelo de amenazas considerado, detallando qué información puede observar cada tipo de adversario y las garantías ofrecidas.

\begin{table}[H]
\centering
\renewcommand{\arraystretch}{1.3}
\small
\caption{Modelo de adversarios y delimitación de visibilidad de datos.}
\label{tab:modelo_adversarios}
\begin{tabularx}{\textwidth}{|>{\bfseries}p{3.2cm}|>{\raggedright\arraybackslash}p{3.4cm}|>{\raggedright\arraybackslash}p{3.8cm}|>{\raggedright\arraybackslash}X|}
\hline
\textbf{Adversario} & \textbf{Lo que VE / Accede} & \textbf{Lo que NO VE} & \textbf{Garantía del Protocolo} \\
\hline
Atacante de Red (Dolev-Yao) & Mensajes en tránsito: $\langle \text{boleta}, \sigma_V \rangle$, recibos firmados. & Voto en texto plano ($m_V$), claves privadas ($dk_{\text{AC}}, sk_V$). & Confidencialidad IND-CCA2 e integridad EUF-CMA. \\
\hline
Servidor de Votación (SV) Malicioso & Identidad del votante ($id_V$), credencial, $ct_{\text{kem}}$, $c_{\text{voto}}$. & Voto en plano ($m_V$), clave $dk_{\text{AC}}$. No puede descifrar. & No puede conocer el sufragio del elector. \\
\hline
Autoridad de Conteo (AC) Maliciosa & Boletas cifradas desvinculadas, clave $dk_{\text{AC}}$, votos en plano ($m_V$). & Identidad del votante ($id_V$), recibos, credenciales, padrón. & No puede asociar ningún voto plano a un elector concreto. \\
\hline
Colusión SV + AC (SV y AC coordinados) & Conjunto total de datos: identidades y clave $dk_{\text{AC}}$. & Claves privadas de votantes ($sk_V$). & Límite declarado: la colusión rompería el secreto del voto. \\
\hline
Administrador de BD (DBA) & Tablas en reposo: padrón, ánfora desvinculada, recibos. & Voto en plano ($m_V$), clave $dk_{\text{AC}}$ (resguardada en HSM). & Privacidad preservada por cifrado y desvinculación relacional. \\
\hline
\end{tabularx}
\end{table}

Esta matriz fundamenta de forma honesta y precisa la afirmación de seguridad: la privacidad del voto se preserva frente a la red, frente al SV y frente a la AC por separado; únicamente la colusión simultánea y concertada entre SV y AC constituiría una amenaza al secreto del sufragio.
'''

with open(os.path.join(out_dir, 'sec09_ceremonia_claves_identidad.tex'), 'w', encoding='utf-8') as f:
    f.write(sec09_content)

# Section 10: Argumento de Seguridad Computacional
sec10_content = r'''% =============================================================================
\section{Argumento de Seguridad Computacional y Reducción Criptográfica}
\label{sec:argumento_seguridad_computacional}
% =============================================================================

Mientras que la verificación simbólica en Tamarin Prover demuestra que la lógica del flujo de mensajes está libre de ataques estructurales bajo el modelo Dolev--Yao, la resistencia efectiva frente a computadoras cuánticas se fundamenta mediante un \textbf{argumento de reducción de seguridad computacional}. Este argumento demuestra que cualquier adversario en tiempo polinomial probabilístico que vulnere una propiedad de seguridad del protocolo puede ser transformado de forma constructiva en un algoritmo capaz de romper los supuestos matemáticos de las primitivas subyacentes:

\begin{enumerate}
	\item \textbf{Paso 1: Confidencialidad del Sufragio (Reducción IND-CCA2 + AEAD):}
	El cifrado del voto sigue el paradigma estándar KEM-DEM (\textit{Key Encapsulation Mechanism / Data Encapsulation Mechanism}) de Cramer y Shoup (2003):
	\begin{itemize}
		\item El mecanismo KEM (ML-KEM-768, FIPS 203) garantiza seguridad IND-CCA2 (indistinguibilidad frente a ataques adaptativos de texto cifrado elegido), basada en la dureza del problema Module-LWE sobre retículos algebraicos.
		\item El mecanismo DEM (AES-256-GCM) proporciona confidencialidad semántica (IND-CPA) e integridad de texto cifrado (INT-CTXT).
		\item \textit{Teorema de Composición:} Si un adversario $\mathcal{A}$ pudiese distinguir el contenido de dos votos $m_0, m_1$ con ventaja no despreciable $\epsilon$, entonces $\mathcal{A}$ podría ser utilizado para distinguir el secreto $K$ derivado por ML-KEM-768 de una cadena puramente aleatoria, o para vulnerar la etiqueta de autenticación GMAC de AES-GCM. Dado que la ventaja contra ML-KEM-768 se reduce a Module-LWE con $\epsilon \le \text{negl}(\lambda)$ frente a algoritmos cuánticos de Shor y Grover, la confidencialidad del sufragio es computacionalmente post-cuántica.
	\end{itemize}

	\item \textbf{Paso 2: Integridad y Autenticidad (Reducción EUF-CMA):}
	La autenticidad de la credencial emitida por la AR y la integridad de la boleta firmada por el votante se sustentan en el esquema ML-DSA-65 (FIPS 204), el cual satisface la noción de seguridad EUF-CMA (\textit{Existential Unforgeability under Chosen Message Attacks}):
	\begin{itemize}
		\item La seguridad de ML-DSA-65 se reduce asintóticamente a la dureza del problema Module-SIS sobre retículos en dimensión $k \times \ell = 6 \times 5$.
		\item Ningún adversario que intercepte boletas firmadas en la red puede generar una boleta válida alternativa o falsificar la firma de un ciudadano legítimo sin resolver una instancia de Module-SIS de norma pequeña ($\|\mathbf{z}\|_\infty < \gamma_1 - \beta$), lo cual se conjetura intratable para computadoras cuánticas.
	\end{itemize}

	\item \textbf{Paso 3: Unicidad del Sufragio por Control de Estado en el Servidor:}
	La prevención del doble voto no descansa en supuestos criptográficos computacionales, sino en el control de estado transaccional atómico en el servidor de base de datos.
	\begin{itemize}
		\item La verificación formal en Tamarin modela este control mediante la transición lineal estricta $\text{NoHaVotado}(id_V) \to \text{YaVoto}(id_V)$.
		\item En el prototipo físico, esto se materializa mediante una transacción atómica con nivel de aislamiento serializable:
		\begin{verbatim}
UPDATE padron_electoral 
SET ha_votado = TRUE, fecha_sufragio = NOW() 
WHERE id_votante = ? AND id_eleccion = ? AND ha_votado = FALSE;
		\end{verbatim}
		Si la sentencia afecta cero filas (porque el votante ya sufragó en una solicitud previa concurrente o idéntica), el servidor rechaza inmediatamente la boleta sin invocar operaciones de ánfora, garantizando unicidad estricta y absoluta independencia de la capacidad de cómputo del adversario.
	\end{itemize}
\end{enumerate}
'''

with open(os.path.join(out_dir, 'sec10_argumento_seguridad_computacional.tex'), 'w', encoding='utf-8') as f:
    f.write(sec10_content)

# Update sec06_diseno_base_datos.tex with longtable and composite PK
sec06_path = os.path.join(out_dir, 'sec06_diseno_base_datos.tex')
with open(sec06_path, 'r', encoding='utf-8') as f:
    sec06_content = f.read()

sec06_content = sec06_content.replace(
    r'\texttt{id\_votante} & \texttt{VARCHAR(64)} & PK',
    r'\texttt{id\_eleccion, id\_votante} & \texttt{VARCHAR(64)} & PK compuesta'
)
sec06_content = sec06_content.replace(
    r'WHERE id_votante = ? AND ha_votado = FALSE',
    r'WHERE id_votante = ? AND id_eleccion = ? AND ha_votado = FALSE'
)
with open(sec06_path, 'w', encoding='utf-8') as f:
    f.write(sec06_content)

# Now assemble master TESIS_cap3.tex
master_inputs = [
    r'\input{Capitulos_tesis/secciones_cap3/sec01_enfoque_metodologico}',
    r'\input{Capitulos_tesis/secciones_cap3/sec02_arquitectura_despliegue}',
    r'\input{Capitulos_tesis/secciones_cap3/sec03_casos_uso_procesos}',
    r'\input{Capitulos_tesis/secciones_cap3/sec04_diagramas_secuencia}',
    r'\input{Capitulos_tesis/secciones_cap3/sec05_maquina_estados}',
    r'\input{Capitulos_tesis/secciones_cap3/sec06_diseno_base_datos}',
    r'\input{Capitulos_tesis/secciones_cap3/sec07_diagrama_componentes}',
    r'\input{Capitulos_tesis/secciones_cap3/sec08_diagrama_clases}',
    r'\input{Capitulos_tesis/secciones_cap3/sec09_ceremonia_claves_identidad}',
    r'\input{Capitulos_tesis/secciones_cap3/sec10_argumento_seguridad_computacional}',
    r'\input{Capitulos_tesis/secciones_cap3/sec11_implementacion_pqc}',
    r'\input{Capitulos_tesis/secciones_cap3/sec12_verificacion_tamarin}',
    r'\input{Capitulos_tesis/secciones_cap3/sec13_validacion_kat_fallos}',
    r'\input{Capitulos_tesis/secciones_cap3/sec14_protocolo_clasico_benchmark}'
]

master_cap3 = header.strip() + '\n\n' + '\n'.join(master_inputs) + '\n'
with open('Capitulos_tesis/TESIS_cap3.tex', 'w', encoding='utf-8') as mf:
    mf.write(master_cap3)

print('Master TESIS_cap3.tex and all 14 sections created successfully!')

