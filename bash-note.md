note:<br />
stdout (standard out) <br />
stderr (standard error) <br />
stdin (standard in) <br />

insert tulisan hello bash kedalam file stdout.txt / atau mengganti semua isi file dengan tulisan terbaru
```sh
echo hello bash > stdout.txt
```

stdin membaca file dari name.txt dan mengeksekusi kadalam scirpt.sh
```sh
./script.sh < name.txt
```

insert ke baris barus tulisan hello bash kedalam file stdout.txt
```sh
echo hello bash > stdout.txt

# Output file:
# hello bash
# hello bash
```

menghapus semua isi file > stdout.txt
```sh
> stdout.txt
```

menangkap error command dan memasukkan kedalam file
```sh
bad_command 2> stderr.txt
# Output pada file
# bash: bad_command: command not found

```
Menampung inputan pada variable
```sh
read NAME
# INPUT
echo $NAME
```

```sh
read NAME < name.txt
```

pipe echo Refan akan masuk kedalam fil script.sh dan di read
```sh
echo Refan | ./script.sh

# script.sh
# read NAME
# echo HELLO $NAME
```

menangkap error ketika terdapat error pada script.sh

```sh
echo RefanF | ./script.sh 2> stderr.txt
```
menangkap error pada script dan menangkap output dan menginput sesuai dengan file yang dibuat
```sh
echo RefanF | ./script.sh 2> stderr.txt > stdout.txt
```

membaca file pada name.txt, menangkap error dan output dan meletekan pada masing-masing file yang diarahkan
```sh
./script.sh < name.txt 2> stderr.txt > stdout.txt
```

wc (word count) akan menampilkan berapa banyak baris, kata dan berapa bytes
```sh
wc file.txt
# 27  332 1744 file.txt
wc file -l # hanya melihat berapa banyak baris pada file
wc file -w # hanya melihat berapa banyak kata pada file
wc file -m # hanya melihat berapa karakter kata pada file
#
```

membaca file dan melihat banyak baris dan append ke file banyak baris yang didapat
```sh
cat kitty_ipsum_1.txt | wc -l >> kitty_info.txt
```

mencari kata tertentu pada file menggunakan grep '<pattern>' filename pattern bisa berupa regex atau kata<br>
grep only matched the first instance

```sh
grep 'meow' kitty_ipsum_1.txt

# memberi warna pada kata meow yang ditemukan
grep --color 'meow' kitty_ipsum_1.txt 

# memberi warna pada kata meow yang ditemukan dan menampilkan number baris kata yang ditemukan
grep --color -n 'meow' kitty_ipsum_1.txt

# menampilkan hanya kata yang match pada pattern dalam bentuk list
grep -o 'meow[a-z]*' kitty_ipsum_1.txt

# menghitung jumlah kata yang ditemukan
grep -c 'meow[a-z]*' kitty_ipsum_1.txt
```

sed 's/<pattern_to_replace>/<text_to_replace_it_with>/' <filename> tambahkan flag pada akhir slash untuk i(insensitve) g(global)
```sh
# name.txt => freeCodeCamp
sed 's/r/2/' name.txt # replace r to 2
# output : f2eeCodeCam

```

diff file1 file2 untuk melihat perbedaan pada masing-masing file

```sh
diff file.txt file1.txt --color
```

mengecek angka positive pada terminal bash
```sh
[[ 11 =~ ^[0-9]+$ ]]; echo $?;
# Output: 0 => true 
[[ a1 =~ ^[0-9]+$ ]]; echo $?;
# Output: 1 => false 
```

mengecek bukan angka positive pada terminal bash
```sh
[[ ! 11 =~ ^[0-9]+$ ]]; echo $?;
```