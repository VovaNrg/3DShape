# 3DShape

iOS-застосунок, який за допомогою LiDAR і камери сканує невеликі фігури на столі та перетворює їх на 3D-моделі з точними розмірами.

## Language

### Сканування

**Subject** (Об'єкт):
Фізична фігура до 30 см, що стоїть на столі і яку сканують.
_Avoid_: object, item, shape, фігура (у коді)

**Scan Session** (Сеанс сканування):
Один процес сканування Subject від «Почати» до «Завершити» або «Скасувати». Сеанс можна ставити на паузу й відновлювати, але після збереження Scanned Model його не можна продовжити.
_Avoid_: scan, capture, запис

**Scan Phase** (Етап сканування):
Стан Scan Session: Ready → Detecting → Scanning ⇄ Paused → Finished → Reconstructing → Review → Saved або Cancelled.
_Avoid_: status, mode

**Review** (Перегляд результату):
Етап після реконструкції: користувач бачить модель, Integrity, Missing Regions і Measured Dimensions, може виконати Scale Calibration, а потім зберігає або скасовує.
_Avoid_: preview, result screen

**Pause** (Пауза):
Тимчасова зупинка Scan Session з можливістю відновлення. Кнопка «Зупинити» означає саме Pause, а не завершення.
_Avoid_: stop

**Flip** (Перевертання):
Додатковий, необов'язковий прохід у тому самому Scan Session: Subject кладуть на бік, щоб відсканувати дно.
_Avoid_: rotate, second scan

**Bounding Box** (Рамка):
Коробка на площині столу, яка обмежує Subject. Жодна сторона не перевищує 30 см. Спершу визначається автоматично, далі користувач може її підправити.
_Avoid_: bounds, frame, area

### Розміри

**Dimensions** (Розміри):
Висота (перпендикулярно до столу), ширина й довжина Subject; для Closed Model додатково об'єм.
_Avoid_: size, measurements

**Live Dimensions** (Орієнтовні розміри):
Dimensions, взяті з Bounding Box під час сканування. Вони приблизні, в інтерфейсі показуються зі знаком «≈».
_Avoid_: preview size

**Measured Dimensions** (Виміряні розміри):
Dimensions, виміряні по реконструйованій Scanned Model. Тільки вони зберігаються, і тільки до них застосовується вимога точності.
_Avoid_: final size, real size

**Scale Calibration** (Калібрування масштабу):
Рівномірне перемасштабування Scanned Model за одним відомим розміром, який увів користувач; доступне в Review і для вже збереженої моделі, його можна скинути до Measured Dimensions. Scanned Model пам'ятає, чи її калібрували.
_Avoid_: correction, fix scale

**Reference Object** (Еталон):
Предмет із розмірами, виміряними штангенциркулем, на якому перевіряють точність Measured Dimensions.
_Avoid_: test object, sample

### Повнота

**Coverage** (Покриття):
Частка секторів огляду навколо Bounding Box, з яких уже є кадри; рахується під час сканування. Дно входить у Coverage лише після Flip.
_Avoid_: progress, completeness, заповнення

**Integrity** (Цілісність):
Частка поверхні реконструйованої Scanned Model без дір.
_Avoid_: completeness, quality, заповнення

**Missing Region** (Пропущене місце):
Ділянка Subject, якої бракує: невідсканований сектор під час сканування або діра в Scanned Model після реконструкції.
_Avoid_: gap, hole (окремо), пропуск

**Closed Model** / **Open Model** (Закрита / відкрита модель):
Scanned Model без Missing Region на поверхні або з ними. Модель без Flip завжди відкрита знизу.
_Avoid_: watertight (в інтерфейсі)

### Результат

**Scanned Model** (Модель):
Збережений результат завершеного Scan Session, який показано в табі «Збережені».
_Avoid_: Model (без префікса), object, scan, item, file

**Model Viewer** (Перегляд моделі):
Повноекранний інтерактивний перегляд однієї Scanned Model; відкривається натисканням на картку в табі «Збережені».
_Avoid_: preview, detail screen

**Export** (Експорт):
Перетворення Scanned Model на файл зовнішнього 3D-формату на вимогу користувача, в момент поширення.
_Avoid_: save as, convert
