"""create-notebook.py
   Creates a minimal jupyter notebook (.ipynb)
   Usage: create-notebook <notebook>
"""
import os
import sys
print("hi")
try:
    notebook_fname = sys.argv[1]
    os.remove(notebook_fname)
except IndexError:
    print("Usage: delete-notebook <notebook>")
    exit()

