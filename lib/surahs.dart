const Map<int, Map<String, dynamic>> surahMap = {
  1: {"name": "الفاتحة", "aya": 7, "english": "Al Fatiha", "place": "Makkah"},
  2: {
    "name": "البقرة",
    "aya": 286,
    "english": "Al Baqarah",
    "place": "Madinah"
  },
  3: {
    "name": "آل عمران",
    "aya": 200,
    "english": "Al Imran",
    "place": "Madinah"
  },
  4: {"name": "النساء", "aya": 176, "english": "An Nisa", "place": "Madinah"},
  5: {
    "name": "المائدة",
    "aya": 120,
    "english": "Al Ma'idah",
    "place": "Madinah"
  },
  6: {"name": "الأنعام", "aya": 165, "english": "Al An'am", "place": "Makkah"},
  7: {"name": "الأعراف", "aya": 206, "english": "Al A'raf", "place": "Makkah"},
  8: {"name": "الأنفال", "aya": 75, "english": "Al Anfal", "place": "Madinah"},
  9: {"name": "التوبة", "aya": 129, "english": "At Tawbah", "place": "Madinah"},
  10: {"name": "يونس", "aya": 109, "english": "Al Yunus", "place": "Makkah"},
  11: {"name": "هود", "aya": 123, "english": "Hud", "place": "Makkah"},
  12: {"name": "يوسف", "aya": 111, "english": "Yusuf", "place": "Makkah"},
  13: {"name": "الرعد", "aya": 43, "english": "Ar Ra'd", "place": "Madinah"},
  14: {"name": "ابراهيم", "aya": 52, "english": "Ibrahim", "place": "Makkah"},
  15: {"name": "الحجر", "aya": 99, "english": "Al Hijr", "place": "Makkah"},
  16: {"name": "النحل", "aya": 128, "english": "An Nahl", "place": "Makkah"},
  17: {"name": "الإسراء", "aya": 111, "english": "Al Isra'", "place": "Makkah"},
  18: {"name": "الكهف", "aya": 110, "english": "Al Kahf", "place": "Makkah"},
  19: {"name": "مريم", "aya": 98, "english": "Maryam", "place": "Makkah"},
  20: {"name": "طه", "aya": 135, "english": "Ta Ha", "place": "Makkah"},
  21: {
    "name": "الأنبياء",
    "aya": 112,
    "english": "Al Anbiya",
    "place": "Makkah"
  },
  22: {"name": "الحج", "aya": 78, "english": "Al Hajj", "place": "Madinah"},
  23: {
    "name": "المؤمنون",
    "aya": 118,
    "english": "Al Mu minun",
    "place": "Makkah"
  },
  24: {"name": "النور", "aya": 64, "english": "An Nur", "place": "Madinah"},
  25: {"name": "الفرقان", "aya": 77, "english": "Al Furqan", "place": "Makkah"},
  26: {
    "name": "الشعراء",
    "aya": 227,
    "english": "As Su'ara",
    "place": "Makkah"
  },
  27: {"name": "النمل", "aya": 93, "english": "An Naml", "place": "Makkah"},
  28: {"name": "القصص", "aya": 88, "english": "Al Qasas", "place": "Makkah"},
  29: {
    "name": "العنكبوت",
    "aya": 69,
    "english": "Al Ankabut",
    "place": "Makkah"
  },
  30: {"name": "الروم", "aya": 60, "english": "Ar Rum", "place": "Makkah"},
  31: {"name": "لقمان", "aya": 34, "english": "Luqman", "place": "Makkah"},
  32: {"name": "السجدة", "aya": 30, "english": "As Sajdah", "place": "Makkah"},
  33: {"name": "الأحزاب", "aya": 73, "english": "Al Ahzab", "place": "Madinah"},
  34: {"name": "سبإ", "aya": 54, "english": "Saba'", "place": "Makkah"},
  35: {"name": "فاطر", "aya": 45, "english": "Fatir", "place": "Makkah"},
  36: {"name": "يس", "aya": 83, "english": "Ya'sin", "place": "Makkah"},
  37: {
    "name": "الصافات",
    "aya": 182,
    "english": "As Saffat",
    "place": "Makkah"
  },
  38: {"name": "ص", "aya": 88, "english": "Saad", "place": "Makkah"},
  39: {"name": "الزمر", "aya": 75, "english": "Az Zumar", "place": "Makkah"},
  40: {"name": "غافر", "aya": 85, "english": "Ghafir", "place": "Makkah"},
  41: {"name": "فصلت", "aya": 54, "english": "Fussilat", "place": "Makkah"},
  42: {"name": "الشورى", "aya": 53, "english": "As Sura", "place": "Makkah"},
  43: {"name": "الزخرف", "aya": 89, "english": "Az Zukhruf", "place": "Makkah"},
  44: {"name": "الدخان", "aya": 59, "english": "Ad Dukhan", "place": "Makkah"},
  45: {
    "name": "الجاثية",
    "aya": 37,
    "english": "Al Jaathiyah",
    "place": "Makkah"
  },
  46: {"name": "الأحقاف", "aya": 35, "english": "Al Ahqaf", "place": "Makkah"},
  47: {"name": "محمد", "aya": 38, "english": "Muhammad", "place": "Madinah"},
  48: {"name": "الفتح", "aya": 29, "english": "Al Fath", "place": "Madinah"},
  49: {
    "name": "الحجرات",
    "aya": 18,
    "english": "Al Hujurut",
    "place": "Madinah"
  },
  50: {"name": "ق", "aya": 45, "english": "Qaaf", "place": "Makkah"},
  51: {
    "name": "الذاريات",
    "aya": 60,
    "english": "Ad Dariyat",
    "place": "Makkah"
  },
  52: {"name": "الطور", "aya": 49, "english": "At Toor", "place": "Makkah"},
  53: {"name": "النجم", "aya": 62, "english": "An Najm", "place": "Makkah"},
  54: {"name": "القمر", "aya": 55, "english": "Al Qamar", "place": "Makkah"},
  55: {"name": "الرحمن", "aya": 78, "english": "Ar Rahman", "place": "Madinah"},
  56: {"name": "الواقعة", "aya": 96, "english": "Al Waqiah", "place": "Makkah"},
  57: {"name": "الحديد", "aya": 29, "english": "Al Hadeed", "place": "Madinah"},
  58: {
    "name": "المجادلة",
    "aya": 22,
    "english": "Al Mujadila",
    "place": "Madinah"
  },
  59: {"name": "الحشر", "aya": 24, "english": "Al Hashr", "place": "Madinah"},
  60: {
    "name": "الممتحنة",
    "aya": 13,
    "english": "Al Mumtahanah",
    "place": "Madinah"
  },
  61: {"name": "الصف", "aya": 14, "english": "As Saff", "place": "Madinah"},
  62: {
    "name": "الجمعة",
    "aya": 11,
    "english": "Al Jumu'ah",
    "place": "Madinah"
  },
  63: {
    "name": "المنافقون",
    "aya": 11,
    "english": "Al Munafiqoon",
    "place": "Madinah"
  },
  64: {
    "name": "التغابن",
    "aya": 18,
    "english": "At Taghabun",
    "place": "Madinah"
  },
  65: {"name": "الطلاق", "aya": 12, "english": "At Talaq", "place": "Madinah"},
  66: {
    "name": "التحريم",
    "aya": 12,
    "english": "At Tahreem",
    "place": "Madinah"
  },
  67: {"name": "الملك", "aya": 30, "english": "Al Mulk", "place": "Makkah"},
  68: {"name": "القلم", "aya": 52, "english": "Al Qalam", "place": "Makkah"},
  69: {"name": "الحاقة", "aya": 52, "english": "Al Haaqqah", "place": "Makkah"},
  70: {
    "name": "المعارج",
    "aya": 44,
    "english": "Al Ma'arij",
    "place": "Makkah"
  },
  71: {"name": "نوح", "aya": 28, "english": "Nooh", "place": "Makkah"},
  72: {"name": "الجن", "aya": 28, "english": "Al Jinn", "place": "Makkah"},
  73: {
    "name": "المزمل",
    "aya": 20,
    "english": "Al Muzammil",
    "place": "Makkah"
  },
  74: {
    "name": "المدثر",
    "aya": 56,
    "english": "Al Muddathir",
    "place": "Makkah"
  },
  75: {
    "name": "القيامة",
    "aya": 40,
    "english": "Al Qiyamah",
    "place": "Makkah"
  },
  76: {
    "name": "الانسان",
    "aya": 31,
    "english": "Al Insaan",
    "place": "Madinah"
  },
  77: {
    "name": "المرسلات",
    "aya": 50,
    "english": "Al Mursalat",
    "place": "Makkah"
  },
  78: {"name": "النبأ", "aya": 40, "english": "An Naba", "place": "Makkah"},
  79: {
    "name": "النازعات",
    "aya": 46,
    "english": "An Naaziat",
    "place": "Makkah"
  },
  80: {"name": "عبس", "aya": 42, "english": "Abasa", "place": "Makkah"},
  81: {
    "name": "التكوير",
    "aya": 29,
    "english": "At Takweer",
    "place": "Makkah"
  },
  82: {
    "name": "الإنفطار",
    "aya": 19,
    "english": "Al Infitar",
    "place": "Makkah"
  },
  83: {
    "name": "المطففين",
    "aya": 36,
    "english": "Al Mutaffifin",
    "place": "Makkah"
  },
  84: {
    "name": "الإنشقاق",
    "aya": 25,
    "english": "Al Inshiqaaq",
    "place": "Makkah"
  },
  85: {"name": "البروج", "aya": 22, "english": "Al Burooj", "place": "Makkah"},
  86: {"name": "الطارق", "aya": 17, "english": "At Taariq", "place": "Makkah"},
  87: {"name": "الأعلى", "aya": 19, "english": "Al A'laa", "place": "Makkah"},
  88: {
    "name": "الغاشية",
    "aya": 26,
    "english": "Al Ghaashiyah",
    "place": "Makkah"
  },
  89: {"name": "الفجر", "aya": 30, "english": "Al Fajr", "place": "Makkah"},
  90: {"name": "البلد", "aya": 20, "english": "Al Balad", "place": "Makkah"},
  91: {"name": "الشمس", "aya": 15, "english": "Ash Shams", "place": "Makkah"},
  92: {"name": "الليل", "aya": 21, "english": "Al Layl", "place": "Makkah"},
  93: {"name": "الضحى", "aya": 11, "english": "Ad Dhuha", "place": "Makkah"},
  94: {"name": "الشرح", "aya": 8, "english": "Ash Sharh", "place": "Makkah"},
  95: {"name": "التين", "aya": 8, "english": "At Teen", "place": "Makkah"},
  96: {"name": "العلق", "aya": 19, "english": "Al Alaq", "place": "Makkah"},
  97: {"name": "القدر", "aya": 5, "english": "Al Qadr", "place": "Makkah"},
  98: {
    "name": "البينة",
    "aya": 8,
    "english": "Al Bayyinah",
    "place": "Madinah"
  },
  99: {
    "name": "الزلزلة",
    "aya": 8,
    "english": "Az Zalzalah",
    "place": "Madinah"
  },
  100: {
    "name": "العاديات",
    "aya": 11,
    "english": "Al Aadiyaat",
    "place": "Makkah"
  },
  101: {
    "name": "القارعة",
    "aya": 11,
    "english": "Al Qaari'ah",
    "place": "Makkah"
  },
  102: {
    "name": "التكاثر",
    "aya": 8,
    "english": "At Takaathur",
    "place": "Makkah"
  },
  103: {"name": "العصر", "aya": 3, "english": "Al Asr", "place": "Makkah"},
  104: {"name": "الهمزة", "aya": 9, "english": "Al Humazah", "place": "Makkah"},
  105: {"name": "الفيل", "aya": 5, "english": "Al Feel", "place": "Makkah"},
  106: {"name": "قريش", "aya": 4, "english": "Quraysh", "place": "Makkah"},
  107: {
    "name": "الماعون",
    "aya": 7,
    "english": "Al Maa'oon",
    "place": "Makkah"
  },
  108: {"name": "الكوثر", "aya": 3, "english": "Al Kawthar", "place": "Makkah"},
  109: {
    "name": "الكافرون",
    "aya": 6,
    "english": "Al Kaafiroon",
    "place": "Makkah"
  },
  110: {"name": "النصر", "aya": 3, "english": "An Nasr", "place": "Madinah"},
  111: {"name": "المسد", "aya": 5, "english": "Al Masad", "place": "Makkah"},
  112: {
    "name": "الإخلاص",
    "aya": 4,
    "english": "Al Ikhlaas",
    "place": "Makkah"
  },
  113: {"name": "الفلق", "aya": 5, "english": "Al Falaq", "place": "Makkah"},
  114: {"name": "الناس", "aya": 6, "english": "An Naas", "place": "Makkah"}
};
