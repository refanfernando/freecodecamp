## membuat file untuk script
```shell
touch questionnaire.sh
```
## membuat file untuk script
```shell
sh questionnaire.sh
# atau
bash questionnaire.sh 
```
## melihat lokasi bash
```shell
which bash
```
## isi dari file questionnaire.sh
```sh
#!/bin/bash
echo hello questionnaire
```
baris pertama #!/bin/bash (shebang) membuat file dapat diakses menggunakan bash interpreter

## melihat list pada project
```sh
codeally@694a35b6082b:~/project$ ls -l
total 8
drwxr-sr-x 3 codeally strove 4096 Sep 20 07:37 learn-bash-scripting-by-building-five-programs
-rw-r--r-- 1 codeally strove   36 Sep 22 06:42 questionnaire.sh
```
-r menandakan file tidak bisa di read oleh sembarang user 
r (read), w (write) x (user yang bisa akses)

## menambahakan akses file agar bisa executable permissions oleh semua user melalui terminal
```sh
# command 1
codeally@694a35b6082b:~/project$ chmod +x questionnaire.sh
# command 2 melihat akses file
codeally@694a35b6082b:~/project$ ls -l
total 8
drwxr-sr-x 3 codeally strove 4096 Sep 20 07:37 learn-bash-scripting-by-building-five-programs
-rwxr-xr-x 1 codeally strove   36 Sep 22 06:42 questionnaire.sh #x menandakan bisa diakses
```

## Run file
```sh
codeally@694a35b6082b:~/project$ ./questionnaire.sh 
hello questionnaire
```

untuk membuat variable pada bash file <br />
VARIABLE_NAME=VALUE <br />
jika value mempunyai spasi gunakan tanda petik <br />
contoh: QUESTION1="What's your name?" <br />
untuk melihat value variable gunakan echo $QUESTION1

## contoh file extension questionnaire.sh
```sh
#!/bin/bash
QUESTION1="What's your name?"
echo $QUESTION1 #melihat value QUESTION1
```

## Menampung value hasil inputan
untuk menampung value hasil inputan gunakan code read dan nama variable <br />
## contoh file questionnaire.sh: 

```sh
#!/bin/bash
QUESTION1="What's your name?"
echo $QUESTION1
read NAME
echo Hello $NAME.
```

## contoh eksekusi file questionnaire.sh: 

```sh
codeally@2e25cf6ed95b:~/project$ ./questionnaire.sh 
What's your name?
Refan
Hello Refan.
```
## Melihat perintah-perintah yang bisa digunakan pada echo diterminal
```sh
echo man #melihat perintah pada echo man (manual)
# atau
help
# contoh
help test
```
untuk print baris baru gunakan \n dan diapit double quotes "\n" untuk cetak tambahkan flag -e setelah echo<br />
contoh: echo -e "\nHello world"

## menangkap semua arguments
contoh file `countdown.sh` berisi:
```
#!/bin/bash
# Program that counts down to zero from a given argument
echo $*
```

contoh eksekusi
```sh
codeally@2e25cf6ed95b:~/project$ ./countdown.sh arg1 arg2 arg3
arg1 arg2 arg3 #hasil output
```
untuk get argument gunakan posisi argument contoh:

contoh file `countdown.sh` menjadi:
```
#!/bin/bash
# Program that counts down to zero from a given argument
echo $1 --mendapatkan arg1
```

## melihat bantuan pada bash script
contoh disini melihat cara penggunaan if pada script
help if
```sh
if [[ CONDITION ]]
then
  STATEMENTS
fi
```
operasi compare pada bash script <br />
 -eq (equal), <br />
 -ne (not equal), <br />
 -lt (less than),
 -le (less than or equal), <br />
-gt (greater than), <br />
-ge (greater than or equal). <br />
=~ (contains the pattern) ex: [[ hello =~ el ]]

Contoh:<br />
Change your if condition to check if your first argument is less than 5
```sh
# ./countdown.sh 4
# contoh
if [[ $1 -lt 5 ]] #$1 adalah argument ke 1 yg diinput
then 
echo true 
else #atau elif [[condition]]
echo false
fi
```

## Bash script pada terminal
bash script bisa langsung dicoba pada terminal <br />
note: 0 (true) 1 (false)<br />
contoh pada terminal
```sh
[[ 4 -ge 5 ]]
echo $? #untuk melihat exit code terakhir
1 #result echo 1 berarti false
```

## For loop pada bash

```sh
for (( i = $1; i >= 0; i-- ))
  do
    echo $i
    sleep 1 # memberi jeda 1 detik sesudah hasil dicetak
  done


```

## While loop pada bash script
```sh
  I=$1
  while [[ $I -ge 0 ]]
  do 
    echo $I
    (( I-- ))
    sleep 1
  done
```

## Comment multiline pada bash script
```sh
: '
 ini comment
 multiline
'
```
## Melihat semua environment variables
contoh varaible $RANDOM digunakan untuk merandom angka ( random number between 0 and 32767.)

```sh
printenv
# atau
declare -p # -p berarti print ke layar
```

## Penjumlahan / pengecekan pada terminal

```sh
# Case 1
I=5;
((I+5)) # I akan bertambah 5 yaitu 10
# Case 2
echo $((I + 5)) # result akan 10 tetapi nilai asli I tidak berubah
# Case 3
J=$(( I - 6 )) # Create variable J dengan nilai I - 6
# Case 4
[[ hello == world ]]; echo $? #hasil echo 1 is mean false
[[ hello =~ el ]]; echo $? #hasil echo 0 is mean true karena hello mengandung el
```

## Melihat variable yang telah dibuat atau variable bawaan system
```sh
declare -p # -p berarti print ke layar
declare -p RANDOM # Print kelayar nilai variable RANDOM
declare -p J # Print kelayar nilai variable J
```
contoh membuat variable random angka 0 - 75

```sh
NUMBER=$((RANDOM % 75 + 1))
```

## Membuat variable array pada bash script
```sh
ARR=("a" "b" "c") #tanpa koma
```
