import '../models/word.dart';

class WordsDatabase {
  static final List<Word> words = [
    // Hayvanlar
    const Word(word: "KEDİ", taboos: ["miyav", "tüy", "pati", "kum", "fare"]),
    const Word(word: "KÖPEK", taboos: ["hav", "tasma", "kemik", "sadık", "oyun"]),
    const Word(word: "KUŞ", taboos: ["kanat", "uç", "gaga", "tüy", "kafes"]),
    const Word(word: "BALIK", taboos: ["yüz", "su", "deniz", "pul", "olta"]),
    const Word(word: "AT", taboos: ["koş", "eyer", "nal", "ahır", "jokey"]),
    const Word(word: "FİL", taboos: ["hortum", "dev", "kulak", "Afrika", "fildişi"]),
    const Word(word: "ASLAN", taboos: ["kükreme", "yele", "orman", "kral", "vahşi"]),
    const Word(word: "YILAN", taboos: ["zehir", "sürün", "pul", "dil", "yumurta"]),
    const Word(word: "KARTAL", taboos: ["uç", "kanat", "gaga", "dağ", "avlan"]),
    const Word(word: "KAPLUMBAĞA", taboos: ["kabuk", "yavaş", "deniz", "yeşil", "su"]),
    
    // Yiyecekler
    const Word(word: "PİZZA", taboos: ["İtalyan", "hamur", "peynir", "domates", "dilim"]),
    const Word(word: "HAMBURGER", taboos: ["Amerika", "köfte", "ekmek", "fast food", "patates"]),
    const Word(word: "DONDURMA", taboos: ["tatlı", "soğuk", "eriyen", "külah", "çikolata"]),
    const Word(word: "ÇORBA", taboos: ["sıcak", "kaşık", "tuz", "mercimek", "içme"]),
    const Word(word: "MAKARNA", taboos: ["İtalyan", "spagetti", "haşla", "sos", "çatal"]),
    const Word(word: "PİDE", taboos: ["Türk", "fırın", "peynir", "hamur", "kıyma"]),
    const Word(word: "KEBAP", taboos: ["et", "mangal", "şiş", "Türk", "ızgara"]),
    const Word(word: "BAKLAVA", taboos: ["tatlı", "fıstık", "yufka", "şerbet", "Gaziantep"]),
    const Word(word: "MEYVE", taboos: ["vitamin", "tatlı", "asit", "muz", "elma"]),
    const Word(word: "SEBZE", taboos: ["yeşil", "sağlıklı", "vitamin", "domates", "salata"]),
    
    // Teknoloji
    const Word(word: "TELEFON", taboos: ["ara", "mobil", "konuş", "numara", "zil"]),
    const Word(word: "BİLGİSAYAR", taboos: ["klavye", "fare", "ekran", "internet", "program"]),
    const Word(word: "TABLET", taboos: ["dokunmatik", "ekran", "iPad", "taşınabilir", "uygulama"]),
    const Word(word: "INTERNET", taboos: ["ağ", "site", "bağlan", "wifi", "tarayıcı"]),
    const Word(word: "KLAVYE", taboos: ["tuş", "yaz", "harf", "bilgisayar", "Q"]),
    const Word(word: "FARE", taboos: ["tıkla", "bilgisayar", "sürükle", "sol", "sağ"]),
    const Word(word: "EKRAN", taboos: ["görüntü", "monitör", "bak", "piksel", "TV"]),
    const Word(word: "YAZICI", taboos: ["kağıt", "mürekkep", "baskı", "çıktı", "ofis"]),
    const Word(word: "KAMERA", taboos: ["fotoğraf", "çek", "lens", "poz", "video"]),
    const Word(word: "KULAKLIK", taboos: ["kulak", "müzik", "dinle", "ses", "wireless"]),
    
    // Spor
    const Word(word: "FUTBOL", taboos: ["top", "gol", "kale", "hakem", "ofsayt"]),
    const Word(word: "BASKETBOL", taboos: ["pota", "top", "NBA", "kort", "sayı"]),
    const Word(word: "TENİS", taboos: ["raket", "kort", "top", "servis", "smaç"]),
    const Word(word: "VOLEYBOL", taboos: ["file", "smaç", "top", "set", "servis"]),
    const Word(word: "YÜZME", taboos: ["havuz", "su", "stil", "kullaç", "dalış"]),
   const Word(word: "KOŞU", taboos: ["maraton", "hız", "ayakkabı", "tempo", "mesafe"]),
    const Word(word: "GÜREŞ", taboos: ["minder", "kispet", "rakip", "Türkiye", "tuş"]),
    const Word(word: "BOKS", taboos: ["yumruk", "ring", "eldiven", "raund", "nakavt"]),
    const Word(word: "SATRANÇ", taboos: ["tahta", "şah", "mat", "piyon", "hamle"]),
    const Word(word: "GOLF", taboos: ["sopa", "top", "delik", "yeşil", "vuruş"]),
    
    // Meslekler
    const Word(word: "DOKTOR", taboos: ["hasta", "tedavi", "hastane", "ilaç", "muayene"]),
    const Word(word: "ÖĞRETMEN", taboos: ["okul", "ders", "öğrenci", "sınıf", "tahta"]),
    const Word(word: "POLİS", taboos: ["karakol", "suç", "yakala", "üniforma", "kelepçe"]),
    const Word(word: "İTFAİYECİ", taboos: ["yangın", "söndür", "kırmızı", "hortum", "merdiven"]),
    const Word(word: "AŞÇI", taboos: ["yemek", "mutfak", "pişir", "tava", "tarif"]),
    const Word(word: "MÜHENDİS", taboos: ["teknik", "proje", "inşaat", "hesap", "çizim"]),
    const Word(word: "AVUKAT", taboos: ["mahkeme", "dava", "kanun", "müvekkil", "savun"]),
    const Word(word: "BERBER", taboos: ["saç", "kes", "tıraş", "makas", "jilet"]),
    const Word(word: "DİŞÇİ", taboos: ["diş", "çek", "dolgu", "ağız", "muayene"]),
    const Word(word: "MİMAR", taboos: ["bina", "çiz", "tasarım", "proje", "plan"]),
    
    // Doğa
    const Word(word: "AĞAÇ", taboos: ["yaprak", "dal", "kök", "gölge", "orman"]),
    const Word(word: "ÇİÇEK", taboos: ["yaprak", "koku", "bahçe", "renk", "gül"]),
    const Word(word: "GÜNEŞ", taboos: ["ışık", "sıcak", "gökyüzü", "sarı", "gündüz"]),
    const Word(word: "AY", taboos: ["gece", "yıldız", "dolunay", "gökyüzü", "uydu"]),
    const Word(word: "YILDIZ", taboos: ["gece", "parlak", "gökyüzü", "ışık", "uzay"]),
    const Word(word: "BULUT", taboos: ["gök", "beyaz", "yağmur", "uçak", "gökyüzü"]),
    const Word(word: "YAĞMUR", taboos: ["su", "damla", "ıslak", "şemsiye", "bulut"]),
    const Word(word: "KAR", taboos: ["beyaz", "kış", "soğuk", "adam", "tanesi"]),
    const Word(word: "RÜZGAR", taboos: ["es", "hava", "uçurtma", "fırtına", "hızlı"]),
    const Word(word: "DENİZ", taboos: ["su", "dalga", "tuzlu", "kum", "plaj"]),
    
    // Ev Eşyaları
    const Word(word: "MASA", taboos: ["ahşap", "üst", "sandalye", "yemek", "çalış"]),
    const Word(word: "SANDALYE", taboos: ["otur", "ayak", "sırt", "masa", "iskemle"]),
    const Word(word: "YATAK", taboos: ["uyu", "yorgan", "yastık", "oda", "rahat"]),
    const Word(word: "DOLAP", taboos: ["giysi", "kapak", "raf", "kıyafet", "asılı"]),
    const Word(word: "SAAT", taboos: ["zaman", "akrep", "yelkovan", "saniye", "alarm"]),
    const Word(word: "LAMBA", taboos: ["ışık", "aydınlat", "elektrik", "ampul", "tavan"]),
    const Word(word: "AYNA", taboos: ["yansı", "bak", "görüntü", "cam", "kendi"]),
    const Word(word: "HALI", taboos: ["yer", "döşe", "desen", "minder", "kilim"]),
    const Word(word: "PERDE", taboos: ["pencere", "kumaş", "as", "gizle", "ışık"]),
    const Word(word: "YASTIK", taboos: ["baş", "yumuşak", "yatak", "uyku", "kılıf"]),
    
    // Ulaşım
    const Word(word: "ARABA", taboos: ["sür", "motor", "tekerlek", "yol", "direksiyon"]),
    const Word(word: "OTOBÜS", taboos: ["yolcu", "şoför", "durak", "bilet", "toplu"]),
    const Word(word: "TREN", taboos: ["ray", "vagon", "istasyon", "hızlı", "bilet"]),
    const Word(word: "UÇAK", taboos: ["uç", "pilot", "havaalanı", "kanat", "bilet"]),
    const Word(word: "GEMİ", taboos: ["deniz", "yüz", "kaptan", "liman", "sal"]),
    const Word(word: "BİSİKLET", taboos: ["pedal", "tekerlek", "zincir", "gidon", "sür"]),
    const Word(word: "MOTOR", taboos: ["hızlı", "iki", "tekerlek", "kask", "gaz"]),
    const Word(word: "TAKSİ", taboos: ["sarı", "şoför", "taksimetre", "ücret", "dur"]),
    const Word(word: "METRO", taboos: ["yer altı", "ray", "hızlı", "istasyon", "toplu"]),
    const Word(word: "TELEFERİK", taboos: ["kablo", "dağ", "kabin", "yüksek", "havada"]),
    
    // Renkler & Şekiller
    const Word(word: "KIRMIZI", taboos: ["renk", "kan", "domates", "bayrak", "elma"]),
    const Word(word: "MAVİ", taboos: ["renk", "gökyüzü", "deniz", "lacivert", "soğuk"]),
    const Word(word: "YEŞİL", taboos: ["renk", "yaprak", "çimen", "orman", "doğa"]),
    const Word(word: "SARI", taboos: ["renk", "güneş", "limon", "parlak", "altın"]),
    const Word(word: "DAİRE", taboos: ["yuvarlak", "şekil", "merkez", "çember", "pi"]),
    const Word(word: "KARE", taboos: ["şekil", "köşe", "dört", "eşit", "kenar"]),
    const Word(word: "ÜÇGEN", taboos: ["şekil", "köşe", "üç", "piramit", "açı"]),
    const Word(word: "BEYAZ", taboos: ["renk", "kar", "temiz", "süt", "aydınlık"]),
    
    // Müzik & Enstrümanlar
    const Word(word: "GİTAR", taboos: ["tel", "çal", "müzik", "ses", "akustik"]),
    const Word(word: "PİYANO", taboos: ["tuş", "nota", "beyaz", "siyah", "çal"]),
    const Word(word: "DAVUL", taboos: ["vur", "baget", "ritim", "ses", "davulcu"]),
    const Word(word: "KEMAN", taboos: ["yay", "tel", "çal", "nota", "klasik"]),
    const Word(word: "FLÜT", taboos: ["üf", "delik", "nefes", "ince", "çal"]),
    const Word(word: "MİKROFON", taboos: ["ses", "konuş", "sahne", "söyle", "kayıt"]),
    const Word(word: "HOPARLÖR", taboos: ["ses", "yüksek", "müzik", "çıkar", "stereo"]),
    const Word(word: "ŞARKI", taboos: ["müzik", "söyle", "ses", "söz", "beste"]),
    
    // Yerler & Binalar
    const Word(word: "OKUL", taboos: ["öğrenci", "öğretmen", "ders", "sınıf", "eğitim"]),
    const Word(word: "HASTANE", taboos: ["doktor", "hasta", "tedavi", "ameliyat", "ilaç"]),
    const Word(word: "MARKET", taboos: ["alışveriş", "sepet", "kasa", "ürün", "para"]),
    const Word(word: "SİNEMA", taboos: ["film", "ekran", "bilet", "koltuk", "mısır"]),
    const Word(word: "PARK", taboos: ["yeşil", "ağaç", "salıncak", "çocuk", "bank"]),
    const Word(word: "PLAJ", taboos: ["deniz", "kum", "güneş", "yüz", "mayo"]),
    const Word(word: "CAMİ", taboos: ["namaz", "minare", "kubbe", "ibadet", "ezan"]),
    const Word(word: "MÜZE", taboos: ["eser", "tablo", "sanat", "sergi", "antika"]),
    const Word(word: "STADYUM", taboos: ["maç", "tribün", "futbol", "saha", "seyirci"]),
    const Word(word: "RESTORAN", taboos: ["yemek", "garson", "menü", "ye", "masa"]),
    
    // Duygular
    const Word(word: "MUTLU", taboos: ["gül", "sevinç", "neşe", "keyif", "haz"]),
    const Word(word: "ÜZGÜN", taboos: ["ağla", "keder", "hüzün", "gözyaşı", "mutsuz"]),
    const Word(word: "KORKU", taboos: ["ürk", "dehşet", "panik", "endişe", "fobi"]),
    const Word(word: "ÖFKE", taboos: ["sinir", "kızgın", "hiddet", "bağır", "gazap"]),
    const Word(word: "AŞK", taboos: ["sevgi", "kalp", "romantik", "sevgili", "öp"]),
    const Word(word: "HEYECAN", taboos: ["coşku", "telaş", "çarp", "ateş", "sevinç"]),
    const Word(word: "GÜVEN", taboos: ["inan", "emin", "sadık", "dürüst", "sağlam"]),
    
    // Kıyafetler
    const Word(word: "PANTOLON", taboos: ["bacak", "kumaş", "kot", "cep", "kemer"]),
    const Word(word: "GÖMLEK", taboos: ["düğme", "yaka", "kol", "ütü", "beyaz"]),
    const Word(word: "AYAKKABI", taboos: ["ayak", "bağcık", "deri", "yürü", "tabak"]),
    const Word(word: "ÇORAP", taboos: ["ayak", "örgü", "çift", "ayakkabı", "giy"]),
    const Word(word: "ŞAPKA", taboos: ["baş", "güneş", "kasket", "giy", "fötr"]),
    const Word(word: "CEKET", taboos: ["kol", "fermuar", "mont", "üst", "dış"]),
    const Word(word: "ETEK", taboos: ["kadın", "diz", "kumaş", "giy", "mini"]),
    const Word(word: "KRAVAT", taboos: ["boyun", "düğüm", "takım", "erkek", "ipek"]),
    const Word(word: "ELDİVEN", taboos: ["el", "parmak", "kış", "soğuk", "yün"]),
    const Word(word: "ATKI", taboos: ["boyun", "yün", "kış", "sar", "soğuk"]),
    
    // Yiyecek & İçecek
    const Word(word: "KAHVE", taboos: ["içecek", "sıcak", "kahverengi", "fincan", "Türk"]),
    const Word(word: "ÇAY", taboos: ["içecek", "sıcak", "bardak", "demleme", "şeker"]),
    const Word(word: "SU", taboos: ["hayat", "içmek", "şişe", "musluk", "sıvı"]),
    const Word(word: "EKMEK", taboos: ["hamur", "fırın", "dilim", "yemek", "buğday"]),
    const Word(word: "PEYNİR", taboos: ["süt", "beyaz", "tuzlu", "dilim", "kahvaltı"]),
    const Word(word: "YUMURTA", taboos: ["tavuk", "sarı", "beyaz", "pişir", "omlet"]),
    const Word(word: "ZEYTİN", taboos: ["siyah", "yeşil", "ağaç", "yağ", "kahvaltı"]),
    const Word(word: "MUZ", taboos: ["sarı", "meyve", "soy", "tatlı", "maymun"]),
    const Word(word: "ELMA", taboos: ["kırmızı", "meyve", "ağaç", "Newton", "çekirdek"]),
    const Word(word: "PORTAKAL", taboos: ["turuncu", "meyve", "C vitamini", "soy", "sık"]),
    
    // Okul & Eğitim
    const Word(word: "KİTAP", taboos: ["oku", "sayfa", "yazar", "hikaye", "kapak"]),
    const Word(word: "KALEM", taboos: ["yaz", "mürekkep", "kağıt", "uç", "tükenmez"]),
    const Word(word: "DEFTER", taboos: ["kağıt", "sayfa", "yaz", "okul", "cilt"]),
    const Word(word: "ÇANTA", taboos: ["taşı", "omuz", "cep", "fermuar", "sırt"]),
    const Word(word: "GÖZLÜK", taboos: ["göz", "cam", "görüş", "çerçeve", "tak"]),
    const Word(word: "CÜZDAN", taboos: ["para", "cep", "kart", "deri", "taşı"]),
    const Word(word: "ANAHTAR", taboos: ["kilit", "aç", "metal", "kapı", "anahtarlık"]),
    
    // Doğa Olayları
    const Word(word: "GÖKKUŞAĞI", taboos: ["renk", "yağmur", "gökyüzü", "yedi", "kemer"]),
    const Word(word: "ŞİMŞEK", taboos: ["yıldırım", "elektrik", "gökyüzü", "fırtına", "çak"]),
    const Word(word: "DEPREM", taboos: ["titer", "sallan", "doğa", "afet", "yer"]),
    const Word(word: "YANGIN", taboos: ["ateş", "yak", "duman", "kırmızı", "söndür"]),
    const Word(word: "SEL", taboos: ["su", "taş", "afet", "yağmur", "nehir"]),
    const Word(word: "FIRTINA", taboos: ["rüzgar", "şiddetli", "dalga", "hava", "kasırga"]),
    
    // Oyuncaklar & Eğlence
    const Word(word: "UÇURTMA", taboos: ["havalandır", "ip", "rüzgar", "uç", "kağıt"]),
    const Word(word: "BALON", taboos: ["şiş", "uç", "hava", "patlat", "yuvarlak"]),
    const Word(word: "OYUNCAK", taboos: ["çocuk", "oyun", "bebek", "araba", "oyna"]),
    const Word(word: "BEBEK", taboos: ["küçük", "ağla", "anne", "bez", "emzik"]),
    
    // Aile
    const Word(word: "ANNE", taboos: ["doğur", "çocuk", "sevgi", "baba", "aile"]),
    const Word(word: "BABA", taboos: ["erkek", "çocuk", "aile", "anne", "ebeveyn"]),
    const Word(word: "KARDEŞ", taboos: ["abla", "abi", "kan", "aile", "öz"]),
    const Word(word: "DEDE", taboos: ["yaşlı", "babaanne", "nine", "torun", "aile"]),
    const Word(word: "NİNE", taboos: ["yaşlı", "büyükanne", "dede", "torun", "aile"]),
    
    // Film & TV
    const Word(word: "TELEVİZYON", taboos: ["izle", "ekran", "kanal", "kumanda", "dizi"]),
    const Word(word: "FİLM", taboos: ["sinema", "izle", "yönetmen", "oyuncu", "senaryo"]),
    const Word(word: "DİZİ", taboos: ["bölüm", "sezon", "izle", "karakter", "hikaye"]),
    const Word(word: "HABER", taboos: ["spiker", "gündem", "bilgi", "televizyon", "gazete"]),
    const Word(word: "REKLAM", taboos: ["tanıt", "ürün", "satış", "kısa", "mesaj"]),
    
    // Müzik Türleri
    const Word(word: "POP", taboos: ["şarkı", "popüler", "radyo", "hit", "dans"]),
    const Word(word: "ROCK", taboos: ["gitar", "elektro", "sert", "müzik", "grup"]),
    const Word(word: "JAZZ", taboos: ["saksafon", "doğaçlama", "yumuşak", "Amerika", "trompet"]),
    const Word(word: "KLASİK", taboos: ["Mozart", "orkestra", "keman", "opera", "beste"]),
    const Word(word: "TÜRKÜ", taboos: ["Türk", "halk", "bağlama", "saz", "gelenek"]),
    
    // Diğer
    const Word(word: "OKYANUS", taboos: ["deniz", "büyük", "Atlas", "Pasifik", "Hint"]),
    const Word(word: "GÖL", taboos: ["su", "tatlı", "yüz", "balık", "kıyı"]),
    const Word(word: "NEHİR", taboos: ["ak", "su", "kıyı", "kaynak", "deniz"]),
    const Word(word: "DAĞ", taboos: ["yüksek", "zirve", "tırman", "kar", "kaya"]),
    const Word(word: "ÇÖL", taboos: ["kum", "sıcak", "susuz", "deve", "kuru"]),
    const Word(word: "ORMAN", taboos: ["ağaç", "yeşil", "hayvan", "odun", "doğa"]),
    const Word(word: "ADA", taboos: ["su", "etraf", "deniz", "izole", "kıyı"]),
  ];
}
