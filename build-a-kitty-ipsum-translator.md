# Menemukan nomor baris kata yang mengandung 'meow' pada file

Menggunakan command: <br />
sed 's/<pattern_to_replace>/<text_to_replace_it_with>/' <filename> tambahkan flag pada akhir slash untuk i(insensitve) g(global)<br/>
untuk lebih dari 2 sed 's/<pattern_1>/<replacement_1>/; s/<pattern_2>/<replacement_2>/'

1. mencari kata yang berawalan meow dan menampilkan nomor barisnya pipe sed -E 'pattern' mengubah setiap number barisnya menjadi angka 1

```sh
 grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/[0-9]+/1/'
```

2. pattern ([0-9]+).* untuk menangkap yang berawalan angka dan kata seterusnya dan pattern \1 kata akan di replace dengan angka yang ditemukan 

```sh
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+).*/\1/'
# Output
# 1
# 4
# 10
# 22
# 23
```

3. Selanjutnya setelah menemukan baris number append output number ke dalam file kitty_info.txt

```sh
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+).*/\1/' >> kitty_info.txt
```

# Menemukan baris pada file kitty_ipsum_2.txt
Membaca file
```sh
cat kitty_ipsum_2.txt
```
menghitung baris pada file wc -l
```sh
cat kitty_ipsum_2.txt | wc -l
```
memasukkan baris yang ditemukan pada file
```sh
cat kitty_ipsum_2.txt | wc -l >> kitty_info.txt
```

# Menemukan banyak kata yang mengandung meow pada file kitty_info.txt

tampilkan banyak kata yang contains meow
```sh
grep -o 'meow[a-z]*' kitty_info_2.txt 
```

hitung banyak barisnya
```sh
grep -o 'meow[a-z]*' kitty_info_2.txt | wc -l
```

masukkan / append kedalam file info
```sh
grep -o 'meow[a-z]*' kitty_info_2.txt | wc -l >> kitty_info.txt
```