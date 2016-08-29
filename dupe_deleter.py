"""
# This simple program deletes all the duplicate whatsapp media on phone

# Install QPython3 for android
# https://github.com/qpython-android/qpython3/releases

# Execute the below script in QPython3
"""

import os, hashlib
from operator import itemgetter
from itertools import groupby
image_list = []
folder_list = [r'/storage/emulated/0/whatsapp/media/whatsapp images/',
               r'/storage/emulated/0/whatsapp/media/whatsapp images/Sent']
for folder in folder_list:
    file_list = os.listdir(folder)
    for img_file in file_list:
        file_path = os.path.join(folder, img_file)
        if os.path.isfile(file_path):
            try:
                image_list.append([file_path, hashlib.sha1(open(file_path, 'rb').read()).hexdigest()])
            except IOError:
                raise Exception('Error reading the file')
image_list.sort(key=itemgetter(1))
groups = groupby(image_list, itemgetter(1))
for (img_hash, img_list_same_hash) in groups:
    z = [img for img in img_list_same_hash]
    i = 1
    while i < len(z):
        os.remove(z[i][0])
        print('Deleted ' + z[i][0])
        i += 1
