import 'package:flutter/material.dart';

class SholawatStanza {
  final String arabic;
  final String latin;
  final String translation;

  const SholawatStanza(this.arabic, this.latin, this.translation);
}

class SholawatItem {
  final String title;
  final String subtitle;
  final List<SholawatStanza> stanzas;

  const SholawatItem(this.title, this.subtitle, this.stanzas);
}

const List<SholawatItem> mockSholawatList = [
  SholawatItem(
    "Ya Rosulallah Salamun Alaik",
    "Qosidah puji-pujian untuk Rasulullah",
    [
      SholawatStanza(
        "يَا رَسُولَ اللهِ سَلَامٌ عَلَيْكَ\nيَا رَفِيعَ الشَّانِ وَالدَّرَجِ",
        "(Reff)\nYa Rosulallah salamun 'alaik\nYa rofi'asy-syani waddaroji",
        "(Reff)\nWahai Utusan Allah, kesejahteraan semoga tercurah kepadamu\nWahai sosok yang luhur kedudukan dan derajatnya"
      ),
      SholawatStanza(
        "عَطْفَةً يَا جِيرَةَ الْعَلَمِ\nيَا أُهَيْلَ الْجُودِ وَالْكَرَمِ",
        "'Athfatan ya jirotal 'alami\nYa uhailal judi walkaromi",
        "Berikanlah belas kasihmu wahai tetangga kemuliaan\nWahai ahli kedermawanan dan kemuliaan"
      ),
      SholawatStanza(
        "نَحْنُ جِيرَانٌ بِذَا الْحَرَمِ\nحَرَمِ الْإِحْسَانِ وَالْحَسَنِ",
        "Nahnu jiranun bidzal haromi\nHaromil ihsani wal hasani",
        "Kami adalah tetangga di tanah haram ini\nTanah haram tempat berbuat baik dan kebaikan"
      ),
      SholawatStanza(
        "نَحْنُ مِنْ قَوْمٍ بِهِ سَكَنُوا\nوَبِهِ مِنْ خَوْفِهِمْ أَمِنُوا",
        "Nahnu min qoumin bihi sakanu\nWa bihi min khoufihim aminu",
        "Kami berasal dari kaum yang menetap di sana\nDan karena tempat itu mereka merasa aman dari rasa ketakutan"
      ),
      SholawatStanza(
        "وَبِآيَاتِ الْقُرْآنِ عُنُوا\nفَاتَّئِدْ فِينَا أَخَا الْوَهَنِ",
        "Wa bi-ayatil qur'ani 'unu\nFatta'id fina akhal wahani",
        "Dan dengan ayat-ayat Al-Quran mereka dilindungi\nMaka tenanglah bersama kami, wahai saudara yang lemah"
      ),
      SholawatStanza(
        "نَعْرِفُ الْبَطْحَا وَتَعْرِفُنَا\nوَالصَّفَا وَالْبَيْتُ يَأْلَفُنَا",
        "Na'riful bath-ha wa ta'rifuna\nWash-shofa wal baitu ya'lafuna",
        "Kami mengenal lembah Batha (Mekah) dan ia pun mengenal kami\nBukit Shafa dan Baitullah juga merindukan kami"
      ),
      SholawatStanza(
        "وَلَنَا الْمَعْلَى وَخَيْفُ مِنَى\nفَاعْلَمَنْ هَذَا وَكُنْ وَكِنِ",
        "Wa lanal ma'la wa khoifu mina\nFa'laman hadza wa kun wakin",
        "Bagi kamilah Ma'la dan Masjid Khaif di Mina\nMaka ketahuilah hal ini dan jadilah engkau aman"
      ),
      SholawatStanza(
        "وَلَنَا خَيْرُ الْأَنَامِ أَبُ\nوَعَلِيُّ الْمُرْتَضَى حَسَبُ",
        "Wa lana khoirul anami abu\nWa 'aliyyul murtadho hasabu",
        "Dan bagi kami sebaik-baik manusia adalah bapak kami\nDan Ali Al-Murtadha adalah nasab tumpuan kami"
      ),
      SholawatStanza(
        "كَمْ إِمَامٍ بَعْدَهُ خَلَفُوا\nمِنْهُ سَادَاتٌ بِذَا عُرِفُوا",
        "Kam imamim ba'dahu kholafu\nMinhu sadatun bidza 'urifu",
        "Keturunan beliau banyak yang jadi pemimpin\nDari beliau adalah para tuan (sayyid) yang kita kenal"
      ),
      SholawatStanza(
        "وَبِهَذَا الْوَصْفِ قَدْ وُصِفُوا\nمِنْ قَدِيمِ الدَّهْرِ وَالزَّمَنِ",
        "Wa bihadzal washfi qod wushifu\nMin qodimid-dahri wazzamani",
        "Demikianlah mereka disifati\nSemenjak zaman dahulu kala dibilang"
      ),
      SholawatStanza(
        "مِثْلُ زَيْنِ الْعَابِدِينَ عَلِي\nوَابْنِهِ الْبَاقِرِ خَيْرِ وَلِي",
        "Mitslu zainil 'abidina 'ali\nWabnihil baqir khoiri wali",
        "Seperti Ali Zainal Abidin\nDan putranya Al-Baqir sebaik-baik wali"
      ),
      SholawatStanza(
        "وَالْإِمَامِ الصَّادِقِ الْحَفِلِ\nوَعَلِيٍّ ذِي الْعُلَى الْيَقِينِ",
        "Wal imamis shodiqil hafili\nWa 'aliyyin dzil 'ulal yaqini",
        "Dan Imam Ja'far As-Shadiq yang agung\nSerta Ali dengan keyakinan yang tinggi"
      ),
      SholawatStanza(
        "فَهُمُ الْقَوْمُ الَّذِينَ هُدُوا\nوَبِفَضْلِ اللهِ قَدْ سُعِدُوا",
        "Fahumul qoumul ladzina hudu\nWa bifadhlillahi qod su'idu",
        "Mereka adalah kaum yang diberi petunjuk\nDan dengan karunia Allah mereka memperoleh keberuntungan"
      ),
      SholawatStanza(
        "أَهْلُ بَيْتِ الْمُصْطَفَى الطُّهُرِ\nهُمْ أَمَانُ الْأَرْضِ فَادَّكِرِ",
        "Ahlu baitil musthofath thuhuri\nHum amanul ardhi faddakiri",
        "Ahli bait (keluarga) Nabi pilihan yang suci\nMereka adalah keamanan bumi, maka renungkanlah"
      ),
      SholawatStanza(
        "شُبِّهُوا بِالْأَنْجُمِ الزُّهُرِ\nمِثْلَ مَا قَدْ جَاءَ فِي السُّنَنِ",
        "Syubbihu bil anjumiz zuhuri\nMitsla ma qod ja-a fis-sunani",
        "Mereka diserupakan dengan bintang-bintang yang terang\nSeperti apa yang telah datang disabdakan dalam hadits"
      ),
      SholawatStanza(
        "وَسَفِينٌ لِلنَّجَاةِ إِذَا\nخِفْتَ مِنْ طُوفَانِ كُلِّ أَذَى",
        "Wa safinun linnajati idza\nKhifta min thufani kulli adza",
        "Dan bagaikan bahtera keselamatan apabila\nEngkau takut dari badai segala mara bahaya"
      ),
      SholawatStanza(
        "فَانْجُ فِيهَا لَا تَكُونُ كَذَا\nوَاعْتَصِمْ بِاللهِ وَاسْتَعِنِ",
        "Fanjun fiha la takun kadza\nWa'tashim billahi wasta'ini",
        "Maka selamatlah padanya, janganlah kau berpaling\nDan berpegang teguhlah kepada Allah serta mohonlah pertolongan"
      ),
      SholawatStanza(
        "رَبِّ فَانْفَعْنَا بِبَرْكَتِهِمْ\nوَاهْدِنَا الْحُسْنَى بِحُرْمَتِهِمْ",
        "Robbi fanfa'na bibarkatihim\nWahdinal husna bihurmatihim",
        "Ya Tuhan, berilah kami manfaat dengan keberkahan mereka\nDan tunjukkanlah kami kepada kebaikan demi kehormatan mereka"
      ),
      SholawatStanza(
        "وَأَمِتْنَا فِي طَرِيقَتِهِمْ\nوَمُعَافَاةٍ مِنَ الْفِتَنِ",
        "Wa amitna fi thoriqotihim\nWa mu'afatin minal fitani",
        "Dan matikanlah kami dalam jalan (tarekat) mereka\nDan lindungilah dari berbagai fitnah"
      ),
    ]
  ),
  SholawatItem(
    "Ya Robbi Sholli Ala Muhammad",
    "Sholawat pengagungan dari Maulid Diba/Simtudduror",
    [
      SholawatStanza(
        "يَارَبِّ صَلِّ عَلَى مُحَمَّدْ\nيَارَبِّ صَلِّ عَلَيْهِ وَسَلِّمْ",
        "(Reff)\nYa robbi sholli 'ala Muhammad\nYa robbi sholli 'alaihi wasallim",
        "(Reff)\nYa Tuhanku, bersholawatlah kepada Nabi Muhammad\nYa Tuhanku, bersholawat dan bersalamlah kepadanya"
      ),
      SholawatStanza(
        "يَارَبِّ بَلِّغْهُ الْوَسِيْلَةْ\nيَارَبِّ خُصَّهُ بِالْفَضِيْلَةْ",
        "Ya robbi balligh-hul wasilah\nYa robbi khus-shohu bilfadlilah",
        "Ya Tuhanku, sampaikanlah beliau pada kedudukan wasilah\nYa Tuhanku, khususkanlah beliau dengan keutamaan"
      ),
      SholawatStanza(
        "يَارَبِّ وَارْضَ عَنِ الصَّحَابَةْ\nيَارَبِّ وَارْضَ عَنِ السُّلاَلَةْ",
        "Ya robbi wardlo 'anis-shohabah\nYa robbi wardlo 'anis-sulalah",
        "Ya Tuhanku, ridhoilah para sahabatnya\nYa Tuhanku, ridhoilah keturunannya"
      ),
      SholawatStanza(
        "يَارَبِّ وَارْضَ عَنِ الْمَشَايِخْ\nيَارَبِّ فَارْحَمْ وَالِدِيْنَا",
        "Ya robbi wardlo 'anil masya-yikh\nYa robbi farham walidina",
        "Ya Tuhanku, ridhoilah kaum guru-guru\nYa Tuhanku, rahmatilah kedua orang tua kami"
      ),
      SholawatStanza(
        "يَارَبِّ وَارْحَمْنَا جَمِيْعًا\nيَارَبِّ وَارْحَمْ كُلَّ مُسْلِمْ",
        "Ya robbi warhamna jami'an\nYa robbi warham kulla muslim",
        "Ya Tuhanku, rahmatilah kami semua\nYa Tuhanku, rahmatilah setiap muslim"
      ),
      SholawatStanza(
        "يَارَبِّ وَاغْفِرْ لِكُلِّ مُذْنِبْ\nيَارَبِّ لَا تَقْطَعْ رَجَانَا",
        "Ya robbi waghfir likulli mudznib\nYa robbi la taqtho' rojana",
        "Ya Tuhanku, ampunilah setiap yang berdosa\nYa Tuhanku, janganlah Engkau putuskan harapan kami"
      ),
      SholawatStanza(
        "يَارَبِّ يَا سَامِعْ دُعَانَا\nيَارَبِّ بَلِّغْنَا نَزُوْرُهْ",
        "Ya robbi ya sami' du'ana\nYa robbi ballighna nazuruh",
        "Ya Tuhanku, wahai Dzat Yang Maha Mendengar doa kami\nYa Tuhanku, sampaikanlah kami agar dapat menziarahinya"
      ),
      SholawatStanza(
        "يَارَبِّ تَغْشَانَا بِنُوْرِهْ\nيَارَبِّ حِفْظَانَكَ وَأَمَانَكَ",
        "Ya robbi taghsyana binurih\nYa robbi hifdzonaka wa amanaka",
        "Ya Tuhanku, liputilah kami dengan cahayanya\nYa Tuhanku, (mohon) penjagaan-Mu dan keamanan-Mu"
      ),
      SholawatStanza(
        "يَارَبِّ وَاسْكِنَّا جِنَانَكَ\nيَارَبِّ أَجِرْنَا مِنْ عَذَابِكَ",
        "Ya robbi waskinna jinanaka\nYa robbi ajirnaa min 'adzabik",
        "Ya Tuhanku, tempatkanlah kami di surga-Mu\nYa Tuhanku, lindungilah kami dari azab-Mu"
      ),
      SholawatStanza(
        "يَارَبِّ وَارْزُقْنَا الشَّهَادَةْ\nيَارَبِّ حِطْنَا بِالسَّعَادَةْ",
        "Ya robbi warzuqnasy-syahadah\nYa robbi hithna bis-sa'adah",
        "Ya Tuhanku, anugerahkanlah kami mati syahid\nYa Tuhanku, lingkupilah kami dengan kebahagiaan"
      ),
      SholawatStanza(
        "يَارَبِّ وَاصْلِحْ كُلَّ مُصْلِحْ\nيَارَبِّ وَاكِفْ كُلَّ مُؤْذِي",
        "Ya robbi washlih kulla mushlih\nYa robbi wakif kulla mu'dzi",
        "Ya Tuhanku, perbaikilah setiap orang yang berbuat kebaikan\nYa Tuhanku, cegahlah setiap orang yang berbuat menyakiti"
      ),
      SholawatStanza(
        "يَارَبِّ نَخْتِمْ بِالْمُشَفَّعْ\nيَارَبِّ صَلِّ عَلَيْهِ وَسَلِّمْ",
        "Ya robbi nakhtim bil musyaffa'\nYa robbi sholli 'alaihi wasallim",
        "Ya Tuhanku, akhirilah (hidup kami) dengan syafaat beliau\nYa Tuhanku, bersholawat dan bersalamlah kepadanya"
      ),
    ]
  ),
  SholawatItem(
    "Mahallul Qiyam",
    "Puncak kecintaan saat membaca Maulid",
    [
      SholawatStanza(
        "يَانَبِى سَلاَمٌ عَلَيْكَ\nيَارَسُوْلْ سَلاَمٌ عَلَيْكَ\nيَاحَبِيْبْ سَلاَمٌ عَلَيْكَ\nصَلَوَاتُ الله عَلَيْكَ",
        "(Reff)\nYa nabi salam 'alaika\nYa rosul salam 'alaika\nYa habib salam 'alaika\nSholawatullah 'alaika",
        "(Reff)\nWahai Nabi, salam sejahtera untukmu\nWahai Rasul, salam sejahtera untukmu\nWahai Kekasih, salam sejahtera untukmu\nShalawat Allah semoga tercurah untukmu"
      ),
      SholawatStanza(
        "أَشْرَقَ الْبَدْرُ عَلَيْنَا",
        "Asyroqol badru 'alaina",
        "Telah terbit bulan purnama pada kita"
      ),
      SholawatStanza(
        "فَاخْتَفَتْ مِنْهُ الْبُدُوْرُ",
        "Fakhtafat minhul buduru",
        "Maka lenyaplah semua purnama-purnama lainnya"
      ),
      SholawatStanza(
        "مِثْلَ حُسْنِكْ مَا رَأَيْنَا",
        "Mitsla husnik ma ro'aina",
        "Belum pernah kami melihat ketampanan seperti ketampananmu"
      ),
      SholawatStanza(
        "قَطُّ يَا وَجْهَ السُّرُوْرِ",
        "Qoththu ya wajhas-sururi",
        "Sama sekali, wahai wajah yang memancarkan kegembiraan"
      ),
      SholawatStanza(
        "أَنْتَ شَمْسٌ أَنْتَ بَدْرٌ",
        "Anta syamsun anta badrun",
        "Engkau laksana matahari, engkau laksana bulan purnama"
      ),
      SholawatStanza(
        "أَنْتَ نُوْرٌ فَوْقَ نُوْرِ",
        "Anta nurun fauqo nurin",
        "Engkau adalah cahaya di atas segala cahaya"
      ),
      SholawatStanza(
        "أَنْتَ إِكْسِيْرٌ وَغَالِي",
        "Anta iksirun wa gholi",
        "Engkau bagaikan ramuan obat yang sangat berharga"
      ),
      SholawatStanza(
        "أَنْتَ مِصْبَاحُ الصُّدُوْرِ",
        "Anta mishbahush-shuduri",
        "Engkau adalah pelita bagi setiap dada yang gelap"
      ),
      SholawatStanza(
        "يَاحَبِيْبِي يَامُحَمَّدْ",
        "Ya habibi Ya Muhammad",
        "Wahai Kekasihku, wahai Muhammad"
      ),
      SholawatStanza(
        "يَاعَرُوْسَ الْخَافِقَيْنِ",
        "Ya 'arusal khofiqoini",
        "Wahai pengantin bagi dua ufuk (Timur dan Barat)"
      ),
      SholawatStanza(
        "يَامُؤَيَّدْ يَامُمَجَّدْ",
        "Ya mu-ayyad ya mumajjad",
        "Wahai yang dikuatkan, wahai yang diagungkan"
      ),
      SholawatStanza(
        "يَاإِمَامَ الْقِبْلَتَيْنِ",
        "Ya imamal qiblataini",
        "Wahai Imam dari dua kiblat"
      ),
      SholawatStanza(
        "مَنْ رَأَى وَجْهَكَ يَسْعَدْ",
        "Man ro-a wajhaka yas'ad",
        "Barangsiapa yang melihat wajahmu pasti akan bahagia"
      ),
      SholawatStanza(
        "يَاكَرِيْمَ الْوَالِدَيْنِ",
        "Ya karimal walidaini",
        "Wahai manusia yang mulia kedua orang tuanya"
      ),
      SholawatStanza(
        "حَوْضُكَ الصَّافِى الْمُبَرَّدْ",
        "Haudlukash-shofil mubarrad",
        "Telagamu yang jernih dan sejuk"
      ),
      SholawatStanza(
        "وِرْدُنَا يَوْمَ النُّشُوْرِ",
        "Wirduna yauman-nusyuri",
        "Akan menjadi tempat kami minum di hari kebangkitan kelak"
      ),
    ]
  ),
  SholawatItem(
    "Burdah",
    "Qosidah Burdah Imam Al-Bushiri",
    [
      SholawatStanza(
        "مَوْلَايَ صَلِّ وَسَلِّمْ دَائِمًا أَبَدًا\nعَلىٰ حَبِيْبِكَ خَيْرِ الْخَلْقِ كُلِّهِمِ\nهُوَ الْحَبِيْبُ الَّذِيْ تُرْجَى شَفَاعَتُهُ\nلِكُلِّ هَوْلٍ مِنَ الْأَهْوَالِ مُقْتَحِمِ",
        "(Reff Lengkap)\nMaulaya sholli wa sallim da-iman abada\n'Ala habibika khoiril kholqi kullihimi\nHuwal habibul-ladzi turja syafa'atuhu\nLikulli haulin minal ahwali muqtahimi",
        "(Reff Lengkap)\nWahai Tuhanku, limpahkanlah rahmat dan kesejahteraan senantiasa abadi\nKepada kekasih-Mu yang menjadi sebaik-baik ciptaan\nDialah kekasih yang syafa'atnya senantiasa diharapkan\nPada setiap datangnya musibah dan ketakutan yang mencekam"
      ),
      SholawatStanza(
        "أَمِنْ تَذَكُّرِ جِيْرَانٍ بِذِىْ سَلَمِ",
        "Amin tadzakkuri jironin bidzi salami",
        "Apakah karena mengingat tetangga (kekasih) di tempat bernama Dzi Salam"
      ),
      SholawatStanza(
        "مَزَجْتَ دَمْعًا جَرَى مِنْ مُقْلَةٍ بِدَمِ",
        "Mazajta dam'an jaro mim muqlatin bidami",
        "Engkau mencampurkan air mata yang mengalir dari pelupuk mata dengan darah?"
      ),
      SholawatStanza(
        "أَمْ هَبَّتِ الرِّيْحُ مِنْ تِلْقَاءِ كَاظِمَةٍ",
        "Am habbatir-rihu min tilqo-i kadhimatin",
        "Atau apakah karena tiupan angin dari arah Kadhimah"
      ),
      SholawatStanza(
        "وَأَوْمَضَ الْبَرْقُ فِى الظَّلْمَاءِ مِنْ إِضَمِ",
        "Wa aumadlol barqu fidh-dholma-i min idlami",
        "Dan kilatan petir menyambar di malam gulita dari arah Gunung Idlam?"
      ),
      SholawatStanza(
        "فَمَا لِعَيْنَيْكَ إِنْ قُلْتَ اكْفُفَا هَمَتَا",
        "Fama li'ainayka in qultakfufa hamata",
        "Maka mengapa kedua matamu tetap meneteskan air mata meski kau tahan"
      ),
      SholawatStanza(
        "وَمَا لِقَلْبِكَ إِنْ قُلْتَ اسْتَفِقْ يَهِـمِ",
        "Wa ma liqolbika in qultastafiq yahimi",
        "Dan mengapa hatimu tetap bergejolak rindu meski sudah kau tenangkan?"
      ),
      SholawatStanza(
        "أَيَحْسَبُ الصَّبُّ أَنَّ الْحُبَّ مُنْكَتِـمٌ",
        "Ayahsabus-shobbu annal hubba munkatimun",
        "Apakah orang yang dimabuk cinta menyangka bahwa cintanya dapat disembunyikan?"
      ),
      SholawatStanza(
        "مَا بَيْنَ مُنْسَجِمٍ مِنْهُ وَمُضْطَرِمِ",
        "Ma baina munsajimin minhu wa mudltorimi",
        "Di antara tetesan air mata dan hati yang menyala terbakar rindu?"
      ),
      SholawatStanza(
        "لَوْلَا الْهَوَى لَمْ تُرِقْ دَمْعًا عَلَى طَلَلِ",
        "Laulal hawa lam turiq dam'an 'ala tholali",
        "Andai bukan karena cinta, niscaya kau takkan meneteskan air mata di atas puing-puing kenangan"
      ),
      SholawatStanza(
        "وَلَا أَرِقْتَ لِذِكْرِ الْبَانِ وَالْعَلَمِ",
        "Wa la ariqta lidzikril bani wal 'alami",
        "Dan kau takkan terjaga (tidak bisa tidur) karena memikirkan pohon Ban dan Gunung Alam"
      ),
      SholawatStanza(
        "فَكَيْفَ تُنْكِرُ حُبًّا بَعْدَ مَا شَهِدَتْ",
        "Fakaifa tunkiru hubban ba'dama syahidat",
        "Maka bagaimana engkau dapat mengingkari cinta, padahal telah bersaksi..."
      ),
      SholawatStanza(
        "بِهِ عَلَيْكَ عُدُولُ الدَّمْعِ وَالسَّقَمِ",
        "Bihi 'alaika 'udulud-dam'i was-saqomi",
        "Saksi yang tak terbantahkan berupa deraian air mata dan duka cita yang mendalam?"
      ),
      SholawatStanza(
        "يَا رَبِّ بِالْمُصْطَفَى بَلِّغْ مَقَاصِدَنَا",
        "Ya robbi bil mushthofa balligh maqoshidana",
        "Ya Tuhanku, demi kemuliaan Nabi Al-Musthofa, sampaikanlah segala maksud dan tujuan kami"
      ),
      SholawatStanza(
        "وَاغْفِرْ لَنَا مَا مَضَى يَا وَاسِعَ الْكَرَمِ",
        "Waghfir lana ma madlo ya wasi'al karomi",
        "Dan ampunilah dosa-dosa kami yang telah lalu, wahai Dzat Yang Maha Luas Kemurahan-Nya"
      ),
      SholawatStanza(
        "سُبْحَانَ رَبِّكَ رَبِّ الْعِزَّةِ عَمَّا يَصِفُونَ",
        "Subhana robbika robbil 'izzati 'amma yashifun",
        "Maha Suci Tuhanmu, Tuhan Yang Maha Perkasa dari apa yang mereka sifatkan"
      ),
      SholawatStanza(
        "وَسَلَامٌ عَلَى الْمُرْسَلِينَ",
        "Wa salamun 'alal mursalin",
        "Dan keselamatan semoga dilimpahkan kepada para utusan-Nya"
      ),
      SholawatStanza(
        "وَالْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ",
        "Walhamdulillahi robbil 'alamin",
        "Dan segala puji bagi Allah, Tuhan seru sekalian alam"
      ),
    ]
  ),
];

class SholawatsCollectionScreen extends StatefulWidget {
  const SholawatsCollectionScreen({super.key});

  @override
  State<SholawatsCollectionScreen> createState() => _SholawatsCollectionScreenState();
}

class _SholawatsCollectionScreenState extends State<SholawatsCollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Cari Sholawat...",
              prefixIcon: const Icon(Icons.search, color: Color(0xFF045B45)),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xFF045B45)),
              ),
            ),
          ),
        ),
        
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: mockSholawatList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final sholawat = mockSholawatList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SholawatDetailScreen(sholawat: sholawat)),
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE5E0D8)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFDFBF7),
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.5)),
                        ),
                        child: const Center(
                          child: Icon(Icons.favorite, color: Color(0xFFD4AF37), size: 18),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sholawat.title,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF045B45)),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              sholawat.subtitle,
                              style: const TextStyle(color: Colors.black54, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class SholawatDetailScreen extends StatelessWidget {
  final SholawatItem sholawat;
  const SholawatDetailScreen({super.key, required this.sholawat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sholawat.title, style: const TextStyle(fontSize: 18)),
        backgroundColor: const Color(0xFFFDFBF7),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24.0),
        itemCount: sholawat.stanzas.length + 1,
        separatorBuilder: (context, index) => const Divider(height: 32, color: Color(0xFFE5E0D8)),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF045B45).withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيم",
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 28,
                  height: 2.2,
                  color: Color(0xFF045B45),
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            );
          }
          
          final stanza = sholawat.stanzas[index - 1];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                stanza.arabic,
                style: const TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 28,
                  height: 2.2,
                  color: Color(0xFF045B45),
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 16),
              Text(
                stanza.latin,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFFD4AF37),
                  fontStyle: FontStyle.italic,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                stanza.translation,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
