import re

files = ["INF_TESIS_cap2.tex", "INF_TESIS_cap3.tex", "INF_TESIS_cap10.tex"]

for file in files:
    with open(file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Replace "something" with ``something''
    new_content = re.sub(r'"([^"]+)"', r"``\1''", content)
    
    with open(file, 'w', encoding='utf-8') as f:
        f.write(new_content)

print("Quotes replaced.")
