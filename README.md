# Cross-platform mobilalkalmazás fejlesztése Flutterrel (szakmai gyakorlat tesztfeladat)

Ez a repository tartalmazza a szakmai gyakorlat tesztfeladatának megoldását. Mivel soha nem foglalkoztam még korábban Flutterrel, könnyen lehet, hogy lesznek olyan részletek, amiket nem a legoptimálisabban sikerült megvalósítani.
 
## Megvalósított feladatok

* A [randomuser](https://randomuser.me/) API felhasználásával userek listázása
* Lista oldal képekkel és nevekkel
  * Lista oldalon pull to refresh funkcionalitás
  * "Végtelen" lista, ha a végére érnénk a letöltött usereknek, újakat tölt be az alkalmazás az API *Pagination* részére támaszkodva
* Detail nézet az egyes userekhez
* Reszponzív felület (master-detail nézet)

## Tesztelés

Az alkalmazást három felületen próbáltam ki, ezekről látható alább pár képernyőkép.
A három eszköz:
- 1080 x 2340 pixel, 19.5:9 ratio (Xiaomi Mi Note 10 Lite, saját eszköz)
- 1080 x 1920 pixel, 16:9 ratio (Google Pixel, emulátor)
- 2560 x 1600 pixel (Nexus 10 tablet, emulátor)

Sajnos iOS-t futtató eszközön nem tudtam kipróbálni az alkalmazást. Az emulátoros tesztelésekből sem végeztem sokat, mert az Android Studio megette reggelire a betelt C meghajtójú laptopomat, ha még az emulátort is ráeresztettem :(

### 1080 x 2340 pixel


<div align="center">
<img src="https://github.com/CeceCeceCece/randomuser-flutter/blob/main/images/21_9_phone_portrait_list.jpg" width="360" height="780"> <img src="https://github.com/CeceCeceCece/randomuser-flutter/blob/main/images/21_9_phone_portrait_detail.jpg" width="360" height="780">
<br>
<br>
Helyes működés esetén portrait módban az alábbi kép fogad.
<br>
<br>
<br>
<br>

<img src="https://github.com/CeceCeceCece/randomuser-flutter/blob/main/images/21_9_phone_masterdetail_initial.jpg" width="780" height="360">

 <br>
 <br>
 Ha elforgatjuk a telefont, átváltunk master-detail nézetre. Ha nem volt még kiválasztva listaelem, a detail rész üres.
 <br>
 <br>
 <br>
 <br>

<img src="https://github.com/CeceCeceCece/randomuser-flutter/blob/main/images/21_9_phone_masterdetail.jpg" width="780" height="360">
 <br>
 <br>
 Egy listaelem kiválasztása után megjelenik jobb oldalt.
  <br>
 <br>
 <br>
 <br>
 
 
 


<img src="https://github.com/CeceCeceCece/randomuser-flutter/blob/main/images/21_9_phone_listview_error.jpg" width="360" height="780"> <img src="https://github.com/CeceCeceCece/randomuser-flutter/blob/main/images/21_9_phone_portrait_detail_picture_error.jpg" width="360" height="780">
 
 
 Amennyiben nem tudjuk le/betölteni a userhez tartozó képet vagy magát a listát, jelzi az alkalmazás ezt a felhasználóknak.
 <br>
 <br>
 <br>
 <br>


<img src="https://github.com/CeceCeceCece/randomuser-flutter/blob/main/images/21_9_phone_landscape_error.jpg" width="780" height="360">

 
 <br>
 <br>
 Ez ugyanúgy megtörténik, ha master-detail módban vagyunk.
  <br>
 <br>
 <br>
 <br>


<img src="https://github.com/CeceCeceCece/randomuser-flutter/blob/main/images/21_9_phone_landscape_detail_weirdness.jpg" width="760" height="360">
</div>


 <br>
 <br>
 Ha elforgatjuk az eszközt miután portrait módban rámegyünk a részletes nézetre, sajnos ez fogad minket. Próbáltam megoldani, hogy vagy fix portrait mód lehessen csak ebben a nézetben vagy lépjen vissza a lista nézetre, majd úgy rajzolja ki az alkalmazás újra a nézetet, de nem sikerült.
 <br>
 <br>

### 1080 x 1920 pixel
 
 <br>
 <br>
<div align="center">
<img src="https://github.com/CeceCeceCece/randomuser-flutter/blob/main/images/16_9_phone_list.png" width="360" height="640"> <img src="https://github.com/CeceCeceCece/randomuser-flutter/blob/main/images/16_9_phone_detail_portrait.png" width="360" height="640">
<br>
<br>
Helyes működés esetén portrait módban az alábbi kép fogad.
<br>
<br>
<br>
<br>

<img src="https://github.com/CeceCeceCece/randomuser-flutter/blob/main/images/16_9_phone_masterdetail.png" width="640" height="360">
 
 <br>
 <br>
 ..és a master-detail nézet.
 <br>
 <br>
 </div>
 
 
 ### 1600 x 2560 pixel
 
 

 <br>
 <br>

<div align="center">
<img src="https://github.com/CeceCeceCece/randomuser-flutter/blob/main/images/tablet_portrait.png" width="400" height="640">
<br>
<br>
Tablet esetén mind a két orientációban master-detail nézet fogad minket.
<br>
<br>
<br>
<br>

<img src="https://github.com/CeceCeceCece/randomuser-flutter/blob/main/images/tablet_landscape.png" width="640" height="400">
 
 <br>
 <br>
 </div>
 Tabletre annyira nem szép a UI. Ennek az az oka, hogy a töréspontot, amitől master-detail módban jelenik meg a UI viszonylag alacsonyra raktam (hogy telefonon is ki tudjam próbálni kellő alapossággal), így pedig a részletes nézet nagyon kicsi kellett legyen. Nem gondolom, hogy telefonra esetén egy ilyen jellegű alkalmazásnál van értelme annak, hogy master-detail módban jelenjen meg - még a Gmail alkalmazása még a 2340 pixel szélességen sem vált át ilyenre (persze logikai pixelekben ez kevesebb). Idő híján nem javítottam át a nézeteket, de a töréspontot nagyobbra venném (pl. 900-ra, és akkor mobilon nem is változik meg), és/vagy készítenék egy másfajta detail nézetet a tabletes master-detailhez.
 
## Egyéb funkciók

Mivel a hálózati műveletek sokáig tarthatnak - főleg a képek letöltése - kis CircularProgressIndicatorok jelennek meg a lista nézetben a felhasználók képe helyett, amíg azok be nem töltődnek, vagy akár csak amíg maga a lista feltöltődik adatokkal.

A részletes nézeten is ehhez hasonlóan megjelenik egy ilyen a profilkép körül, a nemhez illeszkedő színben. Az alábbi képen épp az áttűnés látható, de még ott van az indicator is:
<div align="center">
<img src="https://github.com/CeceCeceCece/randomuser-flutter/blob/main/images/circular.jpg" width="360" height="780"> 
 </div>

## Ismert hibák

* Az arab nevű felhasználók neve ugyanakkora betűmérettel több helyet foglal el, mint a többi felhasználóé és így picit eltolja némelyik részét a nézetnek - alig észrevehető
* Bizonyos embereknek olyan hosszú az email címe vagy a városnév, hogy nem fér ki egyes nézeteken (így járnak, akik *San Sebastián de Los Reyes* vagy ehhez hasonló helyeken laknak :( )


