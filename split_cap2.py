import os
import re

with open('Capitulos_tesis/TESIS_cap2.tex', 'r', encoding='utf-8') as f:
    text = f.read()

# 1. Fix Chaum citation and Benaloh
text = text.replace('Chaum (1981, 1988)', 'Chaum (1981, 1982)')
text = text.replace('Chaum, 1981; Chaum, 1988', 'Chaum, 1981; Chaum, 1982')
text = text.replace('Chaum, 1981; Benaloh, 1987', 'Chaum, 1981; Chaum, 1982; Benaloh, 1987')

# 2. Fix manual subsubsection numbering
text = text.replace(r'\subsubsection{1. Confidencialidad y Privacidad del Sufragio (\textit{Ballot Secrecy})}', r'\subsubsection{Confidencialidad y Privacidad del Sufragio (\textit{Ballot Secrecy})}')
text = text.replace(r'\subsubsection{2. Verificabilidad de Extremo a Extremo (\textit{End-to-End Verifiability, E2E-V})}', r'\subsubsection{Verificabilidad de Extremo a Extremo (\textit{End-to-End Verifiability, E2E-V})}')
text = text.replace(r'\subsubsection{3. Elegibilidad, Unicidad del Sufragio y No Repudio}', r'\subsubsection{Elegibilidad, Unicidad del Sufragio y No Repudio}')
text = text.replace(r'\subsubsection{4. Robustez y Tolerancia a Fallos (\textit{Robustness})}', r'\subsubsection{Robustez y Tolerancia a Fallos (\textit{Robustness})}')

# 3. Tone down absolutes in Cap 2
text = text.replace('la desvinculación absoluta y permanente', 'la desvinculación estricta y permanente')
text = text.replace('conclusión metodológica concluyente', 'conclusión metodológica determinante')
text = text.replace('verificación formal concluyente en Tamarin Prover', 'verificación formal en Tamarin Prover bajo el modelo Dolev--Yao')
text = text.replace('eliminar esta vulnerabilidad de forma concluyente', 'mitigar esta fuga de información')

# 4. Fix hardness wording: 'demostrada' -> 'se conjetura'
text = text.replace('cuya dureza ha sido rigurosamente demostrada', 'cuya dureza se conjetura matemáticamente como intratable en tiempo polinomial')
text = text.replace('garantía demostrada de resistencia cuántica', 'garantía sustentada en la conjetura de resistencia cuántica')

# 5. Fix NTT phrasing:
old_ntt = r'Multiplicar dos polinomios de 256 términos mediante el método escolar tradicional requeriría $256^2 = 65536$ multiplicaciones escalares ($\mathcal{O}(n^2)$). Sin embargo, eligiendo un módulo $q$ primo tal que $q \equiv 1 \pmod{2n}$, el anillo admite raíces primitivas de la unidad. Esto permite aplicar la \textbf{Transformada Teórica de Números}'
new_ntt = r'En ML-DSA, $q = 8380417 \equiv 1 \pmod{2n}$ permite una NTT completa con 256 raíces primitivas; en ML-KEM, $q = 3329$ solo admite raíces 256-ésimas, por lo que se usa una NTT incompleta factorizada en anillos cuadráticos irreducibles. En ambos esquemas, la \textbf{Transformada Teórica de Números}'
text = text.replace(old_ntt, new_ntt)

# 6. CBD error distribution and Regev worst-case reduction
old_lwe_text = 'formalizado por Oded Regev en 2005, constituye la piedra angular de la criptografía post-cuántica moderna.'
new_lwe_text = r'''formalizado por Oded Regev en 2005, constituye la piedra angular de la criptografía post-cuántica moderna. Regev estableció una reducción cuántica rigurosa desde los problemas geométricos en el peor caso de retículos generales (como GapSVP y SIVP) hacia el problema LWE en el caso promedio. En el estándar FIPS 203, el ruido ya no se muestrea de una gaussiana continua redondeada, sino de una Distribución Binomial Centrada (\textit{Centered Binomial Distribution}, $\text{CBD}_\eta$), sumando y restando bits aleatorios uniformes para garantizar tiempo constante y neutralizar canales laterales.'''
text = text.replace(old_lwe_text, new_lwe_text)

# 7. Split into sections by \section{
parts = text.split('\n\\section{')
header = parts[0]
raw_secs = parts[1:]

out_dir = 'Capitulos_tesis/secciones_cap2'
os.makedirs(out_dir, exist_ok=True)

sec_filenames = [
    'sec01_votacion_propiedades.tex',
    'sec02_cripto_clasica_cuantica.tex',
    'sec03_reticulos_geometricos.tex',
    'sec04_lwe_aritmetica.tex',
    'sec05_ring_module_lwe.tex',
    'sec06_ml_kem_fips203.tex',
    'sec07_ml_dsa_fips204.tex',
    'sec08_fips202_keccak.tex',
    'sec09_verificacion_formal.tex'
]

for fname, sec_body in zip(sec_filenames, raw_secs):
    fpath = os.path.join(out_dir, fname)
    with open(fpath, 'w', encoding='utf-8') as sf:
        sf.write('\\section{' + sec_body)

# Write master TESIS_cap2.tex
master_inputs = [
    r'\input{Capitulos_tesis/secciones_cap2/sec01_votacion_propiedades}',
    r'\input{Capitulos_tesis/secciones_cap2/sec02_cripto_clasica_cuantica}',
    r'\input{Capitulos_tesis/secciones_cap2/sec03_reticulos_geometricos}',
    r'\input{Capitulos_tesis/secciones_cap2/sec04_lwe_aritmetica}',
    r'\input{Capitulos_tesis/secciones_cap2/sec05_ring_module_lwe}',
    r'\input{Capitulos_tesis/secciones_cap2/sec06_ml_kem_fips203}',
    r'\input{Capitulos_tesis/secciones_cap2/sec07_ml_dsa_fips204}',
    r'\input{Capitulos_tesis/secciones_cap2/sec08_fips202_keccak}',
    r'\input{Capitulos_tesis/secciones_cap2/sec09_verificacion_formal}',
    r'\input{Capitulos_tesis/secciones_cap2/sec10_tabla_propiedades_limites}'
]

master_cap2 = header.strip() + '\n\n' + '\n'.join(master_inputs) + '\n'
with open('Capitulos_tesis/TESIS_cap2.tex', 'w', encoding='utf-8') as mf:
    mf.write(master_cap2)

print('TESIS_cap2.tex split into 10 sections successfully!')

