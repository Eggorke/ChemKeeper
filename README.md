# ChemKeeper

> Developed for guild **BELUGA** - Nordanaar, Turtle WoW
>
> Author: **Eggorkus**

---

## English

### Overview

ChemKeeper is a Turtle WoW / Vanilla 1.12 addon for planning raid consumables, tracking your current stock, and safely refilling missing items from the bank.

It helps you keep role-specific consumable setups, compare target vs bags vs bank, and quickly prepare before raids.

### Features

- Draggable minimap button
- `Edit List` tab with tracked consumables and target quantities
- Built-in consumable catalog based on the current RABuffs item list
- Custom item input by item link or item ID
- `Overview` tab with `Target`, `Bags`, `Bank`, and `Missing`
- `Withdraw Missing` button for safe bank withdrawal
- Profile system with create, rename, delete, and per-profile tracking
- Built-in preset profiles:
- `HEALER`
- `PHYSTANK`
- `SPDTANK`
- Planned preset profiles:
- `DPS` - TBD
- `SPDDPS` - TBD

### How It Works

1. Pick or create a profile.
2. Add consumables from the catalog or through the custom item field.
3. Set the target amount for each tracked item.
4. Open your bank.
5. Switch to `Overview`.
6. Press `Withdraw Missing` to pull missing items from the bank.

### Notes

- The addon avoids unsafe stack-swapping behavior when moving items from the bank.
- Charge-based items such as weapon oils are handled as individual items instead of raw charge counts.
- If you do not have enough free bag space, ChemKeeper will warn you in chat.

---

## Русский

### Описание

ChemKeeper - это аддон для Turtle WoW / Vanilla 1.12, который помогает заранее собрать нужную химию и расходники перед рейдом.

Он позволяет вести отдельные профили под разные роли, задавать желаемое количество расходников, сравнивать `Target / Bags / Bank / Missing` и добирать недостающее из банка.

### Возможности

- Перетаскиваемая кнопка у миникарты
- Вкладка `Edit List` со списком отслеживаемых расходников
- Встроенный каталог расходников на основе актуального списка из RABuffs
- Добавление кастомного предмета по item link или item ID
- Вкладка `Overview` с колонками `Target`, `Bags`, `Bank`, `Missing`
- Кнопка `Withdraw Missing` для безопасного добора из банка
- Система профилей: создание, переименование, удаление и отдельный трекинг для каждого профиля
- Встроенные пресет-профили:
- `HEALER`
- `PHYSTANK`
- `SPDTANK`
- Планируемые пресет-профили:
- `DPS` - TBD
- `SPDDPS` - TBD

### Как использовать

1. Выбери готовый профиль или создай свой.
2. Добавь расходники из каталога или через `Add Custom Item`.
3. Укажи нужное количество для каждого предмета.
4. Открой банк.
5. Переключись на вкладку `Overview`.
6. Нажми `Withdraw Missing`, чтобы аддон добрал недостающее.

### Примечания

- Аддон специально сделан так, чтобы избегать небезопасного поведения со swap/stack при переносе предметов из банка.
- Предметы с зарядами, вроде weapon oils, учитываются как отдельные предметы, а не как суммарные заряды.
- Если в сумках не хватает свободного места, ChemKeeper сообщит об этом в чат.
