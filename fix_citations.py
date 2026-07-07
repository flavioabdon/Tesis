import re
import os

files_to_check = [
    "INF_TESIS_cap1.tex", "INF_TESIS_cap2.tex", "INF_TESIS_cap3.tex",
    "INF_TESIS_cap4.tex", "INF_TESIS_cap5.tex", "INF_TESIS_cap6.tex",
    "INF_TESIS_cap7.tex", "INF_TESIS_cap8.tex", "INF_TESIS_cap9.tex",
    "INF_TESIS_cap10.tex", "INF_TESIS_cap11.tex", "INF_TESIS_cap12.tex"
]

# Regex to match citations at the end of a sentence:
# e.g., " ... texto (Autor, 2022)." -> " ... texto. (Autor, 2022)"
# We look for a space, then (, then some characters, then a year, then ), then a period.
# Wait, some citations have a page number: (Joyanes, 2001, p. 21).

pattern = re.compile(r' \(([A-Z][A-Za-z0-9\-\s,&\.]+?(?:et al\.)?.*?(?:, \d{4})(?:, p\. \d+)?)\)\.')

for filename in files_to_check:
    if not os.path.exists(filename):
        continue
    with open(filename, 'r', encoding='utf-8') as f:
        content = f.read()
    
    new_content = pattern.sub(r'. (\1)', content)
    
    if new_content != content:
        print(f"Modificando {filename}")
        with open(filename, 'w', encoding='utf-8') as f:
            f.write(new_content)

print("Proceso terminado.")
