"""create-notebook.py
   Creates a minimal jupyter notebook (.ipynb)
   Usage: create-notebook <notebook>
"""
import sys
print("hi")
try:
    notebook_fname = sys.argv[1]
    with open(notebook_fname, 'r') as f:
        f.read()
except IndexError:
    print("Usage: create-notebook <notebook>")
    exit()

