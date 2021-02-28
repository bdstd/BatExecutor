BatExecutor

Launcher sederhana untuk mengeksekusi file batch, serta menyembunyikan console window dari batch yang di eksekusi.
Launcher otomatis akan mengeksekusi file bat yang memiliki nama yang sama, dengan nama launcher-nya.

Changelog 1.5:
* Add Debug Mode = memunculkan consol window. Bertujuan untuk debugging/mengecek/logging "aktifitas" batch
* Add Forward Parameter = membuat variable console/shell berdasarkan parameter yang "diberikan" pada launcher, sehingga dapat digunakan oleh batch untuk "mem-forward" parameter ke exe lain yang akan di eksekusi
* Add Check Batch File = memeriksa dan memunculkan console window, jika file bat tidak tersedia

Aturan Main Debug Mode:
Buat file kosong dengan nama ".debug", dan letakkan 1 folder/path dengan file launcher

Aturan Main Forward Parameter:
* BatExecutor memiliki 2 parameter, yaitu:

all_exe_param = semua parameter yang diberikan ke launcher
exe_param[number] = parameter tertentu yang diberikan ke launcher berdasarkan "urutan" parameter

* Parameter akan tersedia pada variable console/shell windows
contoh parameter:

start BatExecutor.exe asd 123 321

maka, variable dan value yang tersedia pada console/shell windows, adalah:

variable all_exe_param=asd 123 321

variable exe_param0=BatExecutor.exe

variable exe_param1=asd

variable exe_param2=123

variable exe_param3=321

contoh forward parameter ke exe lain berdasarkan parameter di atas

start cmd.exe /k echo %all_exe_param%
start cmd.exe /k echo %exe_param0%
start cmd.exe /k echo %exe_param1%
start cmd.exe /k echo %exe_param2%
start cmd.exe /k echo %exe_param3%
