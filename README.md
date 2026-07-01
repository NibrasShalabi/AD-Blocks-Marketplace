# Ad Blocks Marketplace

A paid advertising platform built with a block-grid layout, inspired by the Million Dollar Homepage concept. Users purchase blocks in a grid and fill them with an image and an external link. The platform is organized into categories, with a dedicated VIP advertising system.

> **Status:** UI MVP with mock data. Backend integration is not yet connected.

## Concept

Users pay to reserve blocks (slots) in a grid and place an image/GIF plus an external link. An ad can be a product, a social account, a portfolio, or anything with a link.

- **Normal ad:** Tiered block packages, fixed ordering by priority (first come, first placed).
- **VIP ad:** A free bidding amount set by the user — the more you pay, the higher your position (open competition), with premium visual templates.

## Tech Stack

- **Flutter Web**
- **Bloc/Cubit** for state management
- **GoRouter** for navigation
- **Localization:** Arabic / English (follows device language) via flutter_localizations
- **Clean Architecture** (simplified for the MVP stage)

## Implemented Screens

- Home (VIP banner + categories + footer)
- Category (scrollable block grid)
- VIP (premium cards + details dialog)
- Ad upload (image + title + link + email)
- Ad type selection (normal / VIP)
- Block packages + VIP screen (free bidding)
- Payment (summary + terms + mandatory consent)
- Terms, Privacy, and Contact pages

## User Flow
Post an ad -> Choose type -> Package/Amount -> Upload data -> Payment

## Project Structure
lib/
├── core/          Theme, config, router
├── data/          Models + mock data
├── l10n/          Localization files
└── presentation/  Screens (each: cubit + view) + widgets
## Getting Started

```bash
flutter pub get
flutter gen-l10n
flutter run -d chrome
```

## Roadmap (Not Yet Implemented)

- Firebase integration (Firestore + Hosting)
- Image hosting via ImgBB
- Payment gateway (KazaWallet API)
- Admin panel and content moderation
- Reports system (tickets) — UI ready, persistence later

## Note

This project is under active development. The current interface is for display only and uses mock data.
 | Out-File -FilePath README.md -Encoding utf8