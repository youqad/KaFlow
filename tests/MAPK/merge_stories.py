from natsort import natsorted
import os
from PyPDF2 import PdfFileMerger

directory = "output/"
pdf_merger = PdfFileMerger()

for file_name in natsorted([f for f in os.listdir(directory) if f.endswith('.pdf')]):
  with open(os.path.join(directory, file_name), "rb") as file:
    pdf_merger.append(file)

with open("stories.pdf", "wb") as stories:
    pdf_merger.write(stories)
