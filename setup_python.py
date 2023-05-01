from loguru import logger # https://github.com/Delgan/loguru#readme
# import logging
# logging.basicConfig()
from pathlib import Path # 
from shutil import copy2 as copy
from rich import print as log 

library_file_constructive = Path(r".\_inbox\constructive\constructive-compiled.scad")
library_file_polyround = Path(r".\_inbox\Round-Anything\polyround.scad")

kea_places_constructive = Path('kea_constructive.sckea_copy(library_file_polyround, kea_places_polyround)ad')
kea_places_polyround = Path('kea_polyround.scad')


def kea_copy(from_file_path, to_file_path):
    if from_file_path.exists() and from_file_path.is_file():
        if to_file_path.exists():
            log(f'kea: already placed')
        else:
            log(f'kea: copy file {to_file_path}')
            copy(from_file_path, to_file_path)            

kea_copy(library_file_constructive, kea_places_constructive)
kea_copy(library_file_polyround, kea_places_polyround)

