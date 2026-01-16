# Projekt Narzędziowy: Bash & LaTeX

Repozytorium zawiera zestaw skryptów automatyzujących pracę z plikami w systemie Linux oraz szablony i skrypty kompilacji dokumentów w systemie składu tekstu LaTeX.

## 🎯 Cel repozytorium
Głównym celem projektu jest dostarczenie gotowych narzędzi do:
* Zarządzania plikami (wykrywanie duplikatów, klasyfikacja treści).
* Automatyzacji procesu budowania złożonych dokumentów LaTeX.

---

## 📂 Zawartość katalogów

Repozytorium podzielone jest na dwie główne sekcje tematyczne:

### 1. `bash/`
Katalog zawierający skrypty powłoki Bash wspomagające administrację plikami:
* **`duplicates/find_duplicates.sh`**: Zaawansowany skrypt wykrywający duplikaty plików na podstawie sum kontrolnych SHA256. Oferuje interaktywny tryb usuwania powtarzających się danych.
* **`classification/classify.sh`**: Narzędzie do segregowania plików z katalogu `inbox` do odpowiednich podfolderów na podstawie słowa kluczowego `CATEGORY:` zawartego w treści pliku.

### 2. `latex/`
Katalog z dokumentacją oraz skryptami do automatycznej kompilacji:
* **`instruction/`**: Materiały dotyczące instrukcji wraz ze skryptem kompilującym.
* **`script/`**: Skrypty do generowania dokumentów złożonych z wielu części (modułów).

---

## 🚀 Instrukcja obsługi

### Skrypty Bash
Aby uruchomić skrypty, nadaj im uprawnienia do wykonywania:
```bash
chmod +x bash/duplicates/find_duplicates.sh
chmod +x bash/classification/classify.sh
```

* **Wyszukiwanie duplikatów**: `./find_duplicates.sh [sciezka_do_katalogu]`
* **Klasyfikacja plików**: `./classify.sh [opcjonalna_nazwa_wyjscia]`

### Kompilacja dokumentów LaTeX

Wymagane jest posiadanie zainstalowanego środowiska TeX Live (pakiety: `texlive`, `texlive-fonts-extra`, `texlive-lang-polish`).

W każdym z podfolderów `latex/` znajduje się skrypt `compile.sh`, który automatyzuje proces budowania pliku PDF.

**Sposób użycia:**

1. Przejdź do odpowiedniego katalogu:
```bash
cd latex/instruction/
```

2. Uruchom skrypt kompilacji:
```bash
./compile.sh
```

Skrypt automatycznie wywoła `pdflatex`, przetworzy pliki źródłowe i wygeneruje gotowy plik PDF (np. `instruction.pdf` lub `script_wdlk.pdf`).
