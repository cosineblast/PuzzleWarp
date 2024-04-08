#!/usr/bin/env python3

import os
import os.path
from pathlib import Path
import urllib.request
import zipfile
import re

from collections import namedtuple

Asset = namedtuple('Asset', 'name url')

ASSETS = [
        Asset(
            name='Kenney_ConveyorKit',
            url='https://kenney.nl/media/pages/assets/conveyor-kit/3e951d8bb9-1704624250/kenney_conveyor-kit.zip'
        ),

        Asset(
            name='Kenney_Textures',
            url='https://kenney.nl/media/pages/assets/prototype-textures/c936d9058b-1677578307/kenney_prototype-textures.zip',
        )
]


def main():
    if os.path.isdir('Assets'):
        print('Uh the assets are already here; Aborting')
        exit(1)

    for asset in ASSETS:
        base_path = Path('./Assets') / asset.name
        file_name = re.match('.*/(.*)$', asset.url)[1]
        zip_path = base_path / file_name

        assert(file_name.endswith('zip'))

        os.makedirs(base_path)

        print(f'Downloading {asset.url} to {zip_path}')

        urllib.request.urlretrieve(asset.url, zip_path)

        print(f'Unzipping {zip_path}')

        with zipfile.ZipFile(zip_path, 'r') as target:
            target.extractall(base_path)

        print('Done')





if __name__ == '__main__':
    main()
