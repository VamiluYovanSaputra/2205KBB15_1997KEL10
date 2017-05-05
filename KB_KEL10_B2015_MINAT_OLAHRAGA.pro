/******************************************** 

FINAL PROJECT ARTIFICIAL INTELLIGENCE
PART OF B2K15

CREATE BY 'TEN GROUP'

********************************************/


DOMAINS
list = symbol*
minat = symbol
syarat = symbol
tanya = string
jawab = char


DATABASE
ytermasuk(syarat)
ttermasuk(syarat)


PREDICATES
buat_list(list) - procedure (i)
mulai
mulai2
termasuk(tanya,syarat)
tidaktermasuk(tanya,syarat)
nondeterm syarat(syarat)
clear_fakta2
simpan(syarat,jawab)
tanya(tanya,syarat,jawab)
nondeterm dugaan(minat)
nondeterm kesimpulan(minat)


CLAUSES
buat_list([]). /* If the list is empty, do nothing more. */
buat_list([H|T]):- /* Match the head to H and the tail to T, then... */
	write(H),nl,
	buat_list(T).

mulai:-mulai2,nl,nl,nl,nl,nl,
write("|                                Terimakasih Telah Menggunakan Program Test Minat Ini :)                                 |"),nl,
write("|    Semoga Dapat Membantu Anda Dalam Menentukan Minat pada Cabang Olahraga Bola Besar     |"),nl,
write("|                                                di Universitas Olahraga Samarinda                                                      |"),
nl,nl,      
write("____________________________"),nl,
write("Ulangi (Y/T) ?"),
readchar(Jawab),nl,
Jawab = 'y',
write("____________________________"),nl,nl,
mulai.
mulai2:-dugaan(_),!,
save("minat.txt"),
clear_fakta2.
               
                        
mulai2:-write("Maaf Anda Tidak Dapat Melanjutkan Test Ini, Silahkan Kenali Diri Anda Terlebih Dahulu"),nl,
clear_fakta2.

termasuk(_,Syarat):-ytermasuk(Syarat),!.
termasuk(Tanya,Syarat):-not(ttermasuk(Syarat)),tanya(Tanya,Syarat,Jawab),Jawab='y'.
tidaktermasuk(_,Syarat):-ttermasuk(Syarat),!.
tidaktermasuk(Tanya,Syarat):-not(ytermasuk(Syarat)),tanya(Tanya,Syarat,Jawab),Jawab='t'.
tanya(Tanya,Syarat,Jawab):-write(Tanya),readchar(Jawab),write(Jawab),nl,
simpan(Syarat,Jawab).
simpan(Syarat,'y'):-asserta(ytermasuk(Syarat)). %asserta=menambah fakta,
simpan(Syarat,'t'):-asserta(ttermasuk(Syarat)). 
clear_fakta2:-retract(ytermasuk(_)),fail.
clear_fakta2:-retract(ttermasuk(_)),fail. %menghapus fakta
clear_fakta2.

syarat(Syarat):-ytermasuk(Syarat),!.
syarat(Syarat):-ttermasuk(Syarat),!,fail.

syarat(dunia):-termasuk("Apakah Anda Menyukai Dunia Olahraga(Y/T)? ",dunia). 
syarat(menonton):-termasuk("Apakah Anda Tertarik Menonton Siaran Tentang Olahraga(Y/T)? ", menonton).
syarat(olahraga):-termasuk("Apakah Anda Mampu Berolahraga 2-3 Kali Dalam 1 Minggu(Y/T)? ",olahraga).
syarat(mengontrol):-termasuk("Apakah Anda Mampu Mengontrol Bola Dengan Baik(Y/T)? ",mengontrol).

syarat(fifa):-termasuk("Apakah Benar FIFA Merupakan Induk Organisasi Internasional Dari Sepak Bola(Y/T)? ",fifa).
syarat(duakali):-termasuk("Apakah Benar Lama Waktu Permainan Sepak Bola 2x45 Menit(Y/T)? ",duakali).
syarat(formasi):-termasuk("Apakah Anda Mengetahui Formasi Pemain Dalam Sepak Bola(Y/T)? ",formasi).

syarat(servis):-termasuk("Apakah Anda Dapat Melakukan Servis Dengan Baik(Y/T)? ",servis).
syarat(tosser):-termasuk("Apakah Benar Istilah Tosser Terdapat Dalam Permainan Bola Voli(Y/T)? ",tosser).
syarat(passing_bawah):-termasuk("Apakah Anda Dapat Melakukan Passing Bawah(Y/T)?",passing_bawah).

syarat(shooting):-termasuk("Apakah Anda Dapat Melakukan Shooting Ke Dalam Ring(Y/T)? ",shooting).
syarat(bounce_pass):-termasuk("Apakah Benar Teknik Bounce Pass Dilakukan Dalam Permainan Bola Basket(Y/T)? ",bounce_pass).        
syarat(three):-termasuk("Apakah Anda Menguasai permainan 3 on 3(Y/T)? ",three).


dugaan("Sangat Minat Sepak Bola"):-
	syarat(dunia),
	syarat(menonton),
	syarat(olahraga),
	syarat(mengontrol),
	syarat(fifa),
	syarat(duakali),
	syarat(formasi),nl,
	kesimpulan("Anda Sangat Memiliki Minat Pada SEPAK BOLA	"),nl,
	buat_list(["Karena Anda Menguasai Pengetahuan dalam Teknik Dasar Yang Dapat Menunjang Mengembangkan Minat Anda","Kembangkan Kemampuan Anda,Untuk Menjadi Pemain Sepak Bola Yang Handal","KEEP SPIRIT AND KEEP PRACTICE! "]).

dugaan("Minat Sepak Bola"):-
        syarat(dunia),
	syarat(menonton),
	syarat(mengontrol),
	syarat(fifa),
	syarat(duakali),nl,
	kesimpulan("Anda Memiliki Minat Pada SEPAK BOLA"),nl,
	buat_list(["Untuk Lebih Mengembangkan Minat Anda, Maka Anda Perlu Meningkatkan Penguasaan Pada Pengetahuan Teknik Dasar Dalam Olahraga Sepak Bola","Rekomendasi Olahraga Yang Hampir Serupa Adalah Futsal","Serta Selalu Semangat Dalam Berlatih!"]).
	
             
dugaan("Cukup Minat Sepak Bola"):-
        syarat(dunia),
	syarat(menonton),
	syarat(duakali),nl,
	kesimpulan("Anda Memiliki Cukup Minat Pada SEPAK BOLA"),nl,
	buat_list(["Karena Anda Hanya Menguasi Pengetahuan Umum Terkait Sepak Bola","Tetapi Anda Tidak Memiliki Cukup Keahlian Menjadi Pemain Sepak Bola Yang Handal","Sehingga, Anda Diharuskan Untuk Berlatih Lebih Giat Dalam Mengembangkan Minat dan Keahlian Anda"]).
	
             
                   
dugaan("Sangat Minat Bola Voli"):-
	syarat(dunia),
	syarat(menonton),
	syarat(olahraga),
	syarat(mengontrol),
	syarat(servis),
	syarat(tosser),
	syarat(passing_bawah),nl,
	kesimpulan("Anda Sangat Memiliki Minat Pada BOLA VOLI"),nl,
	buat_list(["Karena Anda Menguasai Pengetahuan dalam Teknik Dasar Yang Dapat Menunjang Mengembangkan Minat Anda","Kembangkan Kemampuan Anda, Untuk Menjadi Pemain  Bola Voli Yang Handal","KEEP SPIRIT AND KEEP PRACTICE! "]).
	   
dugaan("Minat Bola Voli"):-
        syarat(dunia),
	syarat(olahraga),
	syarat(mengontrol),
	syarat(tosser),
	syarat(passing_bawah),nl,
	kesimpulan("Anda Memiliki Minat Pada BOLA VOLI"),nl,
	buat_list(["Untuk Lebih Mengembangkan Minat Anda, Maka Anda Perlu Meningkatkan Penguasaan Pada Pengetahuan Teknik Dasar Dalam Olahraga Bola Voli","Rekomendasi Olahraga Yang Hampir Serupa Adalah Voli Pantai","Serta Selalu Semangat Dalam Berlatih!"]). 
	
dugaan("Cukup Minat Bola Voli"):-
        syarat(dunia),
	syarat(menonton),
	syarat(passing_bawah),
	kesimpulan("Anda Memiliki Cukup Minat Pada Bola Voli"),nl,
	buat_list(["Karena Anda Hanya Menguasi Pengetahuan Umum Terkait Bola Voli","Tetapi Anda Tidak Memiliki Cukup Keahlian Menjadi Pemain Bola Voli Yang Handal","Sehingga Anda Diharuskan Untuk Berlatih Lebih Giat Dalam Mengembangkan Minat dan Keahlian Anda"]).
		
	
	
dugaan("Sangat Minat Bola Basket"):-
	syarat(dunia),
	syarat(menonton),
	syarat(olahraga),
	syarat(mengontrol),
	syarat(shooting),
	syarat(bounce_pass),
	syarat(three),nl,
	kesimpulan("Anda Sangat Memiliki Minat Pada BOLA BASKET"),nl,
	buat_list(["Karena Anda Menguasai Pengetahuan dalam Teknik Dasar Yang Dapat Menunjang Mengembangkan Minat Anda","Kembangkan Kemampuan Anda, Untuk Menjadi Pemain  Bola Basket Yang Handal" , "KEEP SPIRIT AND KEEP PRACTICE!"]).
	
dugaan("Minat Bola Basket"):-
	syarat(dunia),
	syarat(olahraga),
	syarat(mengontrol),
	syarat(shooting),
	syarat(bounce_pass),nl,
	kesimpulan("Anda Memiliki Minat Pada BOLA BASKET"),nl,
	buat_list(["Untuk Lebih Mengembangkan Minat Anda Maka Anda Perlu Meningkatkan Penguasaan Pada Pengetahuan Teknik Dasar Dalam Olahraga Bola Basket","Rekomendasi Olahraga Yang Hampir Serupa Adalah KorfBall","Serta Selalu Semangat Dalam Berlatih!"]). 

dugaan("Cukup Minat Bola Basket"):-
        syarat(dunia),
	syarat(menonton),
	syarat(bounce_pass),nl,
	kesimpulan("Anda Memiliki Cukup Minat Pada Bola Basket"),nl,
	buat_list(["Karena Anda Hanya Menguasi Pengetahuan Umum Terkait Bola Basket","Tetapi Anda Tidak Memiliki Cukup Keahlian Menjadi Pemain Bola Basket Yang Handal","Sehingga Anda Diharuskan Untuk Berlatih Lebih Giat Dalam Mengembangkan Minat dan Keahlian Anda"]).
	
	
	
dugaan("Lain lain"):-
        syarat(dunia),nl,        
        kesimpulan("Maaf Anda Tidak Memiliki Minat Terhadap Cabang Bola Besar Apapun, Silahkan Kenali Diri Anda Terlebih Dahulu").
                       
kesimpulan(Hasil):-nl,nl,write("- - > Hasil Test Anda :....  ",Hasil),nl.



GOAL

write("--------------------------------------------------------------------------------------------------------------------------------------------------------------"),nl,
write("         SELAMAT DATANG DI PROGRAM TEST PEMINATAN CABANG OLAHRAGA BOLA BESAR			"),nl,
write("--------------------------------------------------------------------------------------------------------------------------------------------------------------"),nl,nl,
write("|. . . . . . . ^^ Kelompok 10 ^^ . . . . . . .|"),nl,
buat_list(["Celine Aloyshima Haris:053","Vamilu Yovan Saputra:063","Syamsul Fatah:068"]),
write("|. . . . . . . . . . . . . . . . . . . . . . . . . . . .|"),nl,nl,nl,nl,


write("--------------------------------------------------------------------------------------------------------------------------------------------------------------"),nl,
write("         SISTEM PENDUKUNG KEPUTUSAN KLASIFIKASI MINAT PADA CABANG OLAHRAGA 			"),nl,
write("                  BOLA BESAR DI UNIVERSITAS OLAHRAGA SAMARINDA					"),nl,
write("--------------------------------------------------------------------------------------------------------------------------------------------------------------"),nl,nl,nl,

write("--- Program Ini Akan Membantumu, Menemukan Minatmu ---"),nl,
write("       _________SIIIAAPP..TEST AKAN DIMULAI________          "),nl,nl,

mulai.