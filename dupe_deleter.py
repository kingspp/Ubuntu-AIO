"""
# This simple program deletes all the duplicate whatsapp media on phone

# Install QPython3 for android
# https://github.com/qpython-android/qpython3/releases

# Execute the below script in QPython3
"""

import os, hashlib
from operator import itemgetter
from itertools import groupby

file_list = []
rootdir = r'/storage/emulated/0/whatsapp/media/whatsapp images/'
del_file_count, del_size, total_file_count = 0, 0, 0
for subdir, dirs, files in os.walk(rootdir):
    for file in files:
        total_file_count += 1
        file = os.path.join(subdir, file)
        if os.path.isfile(file):
            try:
                file_list.append([file, hashlib.sha1(open(file, 'rb').read()).hexdigest()])
            except IOError:
                raise Exception('Error reading the file')

file_list.sort(key=itemgetter(1))
groups = groupby(file_list, itemgetter(1))
for (img_hash, img_list_same_hash) in groups:
    z = [img for img in img_list_same_hash]
    i = 1
    while i < len(z):
        del_size += os.path.getsize(r'' + z[i][0])
        os.remove(r'' + z[i][0])
        print('Deleted ' + r'' + z[i][0])
        i += 1
        del_file_count += 1

print(del_file_count / total_file_count * 100, '% duplicate files found ( ', del_file_count, '/', total_file_count, ')')
print('Saved: ', del_size / (1024 ** 3), 'GB')
