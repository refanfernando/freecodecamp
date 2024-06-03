#!/bin/bash

# membaca file yang diinput pada argument ke 1
# -E (extends) artinya regex lanjutan yang diperluas
# replace kata
# replace kata catnip -> dogchow
# replace kata cat -> dog
# replace kata meow | meowzer -> woof
cat $1 | sed -E 's/catnip/dogchow/g;s/cat/dog/g;s/meow|meowzer/woof/g'