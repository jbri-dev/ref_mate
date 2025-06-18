# Copilot Instructions

## Projektübersicht

Flutter-App für Basketball-Schiedsrichter zur Verwaltung von Ansetzungen, Einnahmen, Statistiken und Regeltraining.

## Wichtige Technologien & Frameworks

- **Flutter** (aktuelle stabile Version)
- **Dart**
- **Riverpod** für State-Management
- **sqflite** für SQLite-Zugriff
- **path_provider** für Dateipfad-Zugriff (z. B. Datenbank-Dateien)
- **Material Design** UI-Widgets

## Coding-Konventionen

- Dart-Code folgt dem offiziellen Styleguide (`dart format`)
- Projektstruktur ist **seitenbasiert (Page-orientiert)**:
  - Jede Hauptseite hat einen eigenen Ordner: `lib/pages/<page_name>/`
  - Innerhalb jeder Seite:
    - `*_page.dart` – Hauptentry der Seite
    - `widgets/` – Seitenspezifische UI-Komponenten
- App-weite Ordner:
  - `lib/widgets/` – Wiederverwendbare UI-Komponenten (buttons, cards etc.)
  - `lib/utils/` – Hilfsfunktionen (Formatierer, Parser etc.)
  - `lib/constants/` – Globale Konstanten (Farben, Padding, Text, etc.)
  - `lib/data/` – Datenmodelle und -strukturen (darunter modelle, repositories, helper, schema, ...)
     - es gibt keine seitenbasierten Datenmodelle, sondern nur globale Datenmodelle
- Namenskonvention:
  - Dateinamen: `snake_case`
  - Klassennamen: `PascalCase`
  - Methoden/Funktionen: `camelCase`
  - Dateibenennung nach Funktion: `*_page.dart`, `*_widget.dart`, `*_provider.dart`
  - **nur englische Bezeichnungen verwenden (einzige außnahme sind visuelle Texte, alles andere auch Datenbankbezogen bleibt auf englisch)**
- Trennung von UI, Logik und Datenzugriff ist strikt einzuhalten
- Möglichst stateless Widgets verwenden
- Datenfluss:
  - UI (Page/Widget) → Riverpod-Provider → Repository/Service → SQLite via sqflite
- Verwendung des Repository-Patterns zur Trennung von Datenquelle und Logik

## Zu vermeidende Vorschläge

- Keine Lokalisierungsvorschläge – App bleibt auf Deutsch
- Keine Empfehlungen für veraltete Flutter- oder Dart-Pakete
- Keine experimentellen Flutter-Features ohne explizite Freigabe
- Keine direkten Datenbankzugriffe in Widgets – immer über Provider/Repository
- Keine Kommentare in Code, die nicht unbedingt notwendig sind

## Sicherheitsanforderungen

- Keine sensiblen Daten im Klartext speichern
- Einnahmen- und Einsatzdaten lokal speichern, aber durch saubere Validierung absichern
- Offline-first Design: Keine Datenübertragung, kein Tracking

## Performance-Anforderungen

- Effiziente Datenbankabfragen mit sinnvollen Indexen
- Minimale Rebuilds durch gezieltes Riverpod-State-Management
- App muss auch bei vielen Datensätzen flüssig bleiben
- Lazy-Loading bei großen Listen (z. B. vergangene Spiele)

## Lokalisierung / Internationalisierung

- **Nicht notwendig** – App ist ausschließlich für den deutschen Markt.