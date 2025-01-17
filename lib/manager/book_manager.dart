import 'package:bbboooook/modules/Book.dart';
import 'package:flutter/foundation.dart';

class CartModel with ChangeNotifier {
  Map<int, int> _items = {}; // Используем Map для хранения товаров в корзине
  double _totalPrice = 0; // Общая стоимость товаров в корзине

  Map<int, int> get items => _items;
  double get totalPrice => _totalPrice;

  void addToCart(Book book) {
    if (_items.containsKey(book.id)) {
      _items[book.id] = _items[book.id]! + 1;
    } else {
      _items[book.id] = 1;
    }
    _totalPrice += book.price;
    notifyListeners();
  }

  void removeFromCart(Book book) {
    if (_items.containsKey(book.id) && _items[book.id]! > 1) {
      _items[book.id] = _items[book.id]! - 1;
    } else {
      _items.remove(book.id);
    }
    _totalPrice -= book.price;
    notifyListeners();
  }
}

class BookManager {
  static final List<Book> _books = [
    Book(
        id: 1,
        title: 'Объект контроля',
        author: 'Макс Глебов',
        description:
            'Галактику разделяет надвое невидимый сферический барьер, по одну сторону которого действуют привычные нам физические законы, а по другую люди способны к прямому управлению темной энергией. Граница проходит по рукаву Ориона, и Земле не повезло оказаться на рубеже, где столкнулись две цивилизации, ведущие агрессивную космическую экспансию… В основе могущества одной из них лежат технологии, намного опередившие земные, а стержнем другой стало то, что на Земле назвали бы магией. Полтора века назад обе цивилизации сошлись в сражении за Солнечную систему, и в тот момент судьба примитивных аборигенов, населявших третью планету, их совершенно не интересовала. Спустя сто пятьдесят лет среди потомков немногих выживших землян эта схватка известна, как Чужая война.',
        price: 279,
        year: 2023,
        edition: '1-ое издание',
        image: 'https://cv8.litres.ru/pub/c/cover_415/70184182.webp'),
    Book(
        id: 2,
        title: 'Разведчик барона',
        author: 'Макс Глебов',
        description:
            'После очень непростого перехода через Змеиный лес охотник за артефактами Сергей Белов наконец попадает в город. Это открывает перед ним новые возможности, но одновременно грозит и множеством опасностей. Его ждет сложный разговор в Особой канцелярии барона, а сотрудников тайной службы вряд ли можно назвать приятными собеседниками. От результатов этой беседы, а вернее, допроса, зависит очень многое, так что позволить себе ошибиться Сергей не может. Ему нужно получить лицензию охотника за головами и при этом не лишиться добытого в походе весьма недешевого трофея. Это очень непростая задача, особенно с учетом того, с какой организацией Сергею предстоит иметь дело.',
        price: 279,
        year: 2024,
        edition: '2-ое издание',
        image: 'https://cv6.litres.ru/pub/c/cover_415/70359262.webp'),
    Book(
        id: 3,
        title: 'Фактор дисбаланса',
        author: 'Макс Глебов',
        description:
            'Договоренности с кибами и единственным выжившим тайкуном дают Сергею Белову множество новых возможностей, но при этом сильно растут и риски. С каждым днем его всё глубже затягивает в запутанный клубок интриг аристократов постапокалиптического мира, сложившегося на Земле после Чужой войны. Сергей вынужден скрывать свои истинные планы от всех участников этой жестокой игры. Даже от тех, кто уже является или ещё только может стать его друзьями.',
        price: 249,
        year: 2024,
        edition: '3-тье издание',
        image: 'https://cv1.litres.ru/pub/c/cover_415/70620715.webp'),
    Book(
        id: 4,
        title: 'Коран в исламе',
        author: 'Мухаммад Хусайн Табатабаи',
        description:
            'Мухаммад Хусайн Табатабаи – крупный иранский философ и теолог XX в. Его книга «Коран в исламе» вышла в 1962 году и получила широкую популярность как доступное и систематизированное описание Корана и его значимости для исламского мира. Позднее книга была переиздана в рамках подготовки к выпуску собрания сочинений Табатабаи. Перевод на русский язык сделан с последнего издания и включает автобиографию ученого.В представляемой вниманию российского читателя книге иранский ученый рассматривает состав Корана и порядок входящих в него сур, обрисовывает историю ниспослания Корана, рассуждает об особенностях коранического учения, говорит о связях Корана с наукой, исследует распространение Корана среди мусульман, описывает стили рецитации Корана. Все это – корановедение, необходимое и тем, кто только начинает читать Коран, и тем, кто уже имеет навык чтения и размышления.Настоящее издание рассчитано на самый широкий круг читателей, интересующихся духовной культурой мусульманского мира.',
        price: 164,
        year: 2011,
        edition: '1',
        image: 'https://cv5.litres.ru/pub/c/cover_415/6220753.webp'),
    Book(
        id: 5,
        title: 'Ревизор: возвращение в СССР 18',
        author: 'Артем Шумилин',
        description:
            'Приключения московского аудитора, попавшего из нашего времени в 1971 год, продолжаются. Группировка комсоргов, поощренная Пашей, смело выступает против больших боссов, претендующих на ее активы. Фирдаус приезжает с новыми вопросами по поводу бизнеса. А тут и Межуев предлагает кое-что интересное… Сколько всего часов в сутках? Пора определяться с приоритетами…',
        price: 399,
        year: 2024,
        edition: '1',
        image: 'https://cv9.litres.ru/pub/c/cover_415/70581790.webp'),
    Book(
        id: 6,
        title: 'Альянс Неудачников. Новые Боги',
        author: 'Михаил Атаманов',
        description:
            'Главный герой попал в нехорошую историю. Его жизни угрожают, и таинственный незнакомец очень убедительно сообщает, что он – «нежилец». И предлагает альтернативу – переместиться в другой мир. Герою приходится с предложением согласиться, и он попадает в мир, существующий по законам игры. Спутником Сержанта (такой ник выбрал герой) становится случайно попавший с ним в этот мир котёнок. Герой и не догадывается, насколько важен для него маленький домашний питомец, ведь именно благодаря котёнку он достигает в новом мире больших успехов в развитии.',
        price: 289,
        year: 2023,
        edition: '1',
        image: 'https://cv5.litres.ru/pub/c/cover_415/70610851.webp'),
    Book(
        id: 7,
        title: 'Мышление предпринимателя',
        author: 'Станислав Сагдеев',
        description:
            'Если ты хочешь научиться ставить перед собой большие цели и, самое главное, достигать их, то эта книга для тебя. Ее автор прошел путь от монтера трамвайного пути где-то в Сибири до владельца железнодорожного бизнеса с филиалами в разных уголках страны. И на собственном примере доказал: успех зависит от мышления. Чем масштабнее ты мыслишь, чем невероятнее твои мечты, тем выше вершины, которые ты возьмешь. Книга основана на удивительной, мотивирующей истории автора. В ней есть лайфхаки по бизнесу, поучительные уроки из жизни, взлеты, падения и даже чудеса.Ты узнаешь себя в герое и поймешь, как действовать, чтобы исполнить свои мечты. Но самое главное, осознаешь простую истину, что все происходит к лучшему. Даже если кажется, что это не так.',
        price: 399,
        year: 2022,
        edition: '1',
        image: 'https://cv7.litres.ru/pub/c/cover_415/67779776.webp'),
    Book(
        id: 8,
        title: 'Сказать жизни «Да!»: психолог в концлагере',
        author: 'Виктор Франкл',
        description:
            'Эта удивительная книга сделала ее автора одним из величайших духовных учителей человечества в XX веке. В ней философ и психолог Виктор Франкл, прошедший нацистские лагеря смерти, открыл миллионам людей всего мира путь постижения смысла жизни. Дополнительный подарок для читателя настоящего издания – пьеса «Синхронизация в Биркенвальде», где выдающийся ученый раскрывает свою философию художественными средствами.',
        price: 259,
        year: 2011,
        edition: '1',
        image: 'https://cv1.litres.ru/pub/c/cover_415/147113.webp'),
    Book(
        id: 9,
        title:
            'Фашизм, неофашизм и их преступная практика. Сборник статей памяти Елены Дмитриевны Строгановой',
        author: 'Коллектив авторов',
        description:
            'В настоящей книге основанной на материалах, проходившей в мае 2020 г. в Военном учебно-научном центре Военно-воздушных сил «Военно-воздушная академия имени профессора Н.Е. Жуковского и Ю.А. Гагарина» Всероссийской научно-теоретической конференции «Фашизм, неофашизм и их преступная практика» рассматриваются проблемы, связанные с сущностностными чертами фашизма как международного феномена и его проявлениями в различных странах мира. Отдельные статьи посвящены анализу неофашизма и современным проявлениям правого радикализма.',
        price: 399,
        year: 2020,
        edition: 'Весь Мир',
        image: 'https://cv6.litres.ru/pub/c/cover_415/70559965.webp'),
    Book(
        id: 10,
        title: 'Реверанс с того света',
        author: 'Хачик Хутлубян',
        description:
            'В распоряжение молодого журналиста Андрея Примерова попал компромат на заместителя командующего военным округом генерал-лейтенанта Порошина. Публикация обличительной статьи в газете «Наш город», где работал Андрей, стала бы настоящей бомбой для военного чиновника и его окружения. Но этого не случилось. Все компрометирующие материалы на генерала были внезапно похищены, а сам Примеров попал под следствие по обвинению в убийстве проститутки Алисы, которая клеилась к нему в баре. Улики оказались настолько серьезными, что шансов доказать свою невиновность почти не осталось. Почти, если не считать одной маленькой и хрупкой надежды…',
        price: 149,
        year: 2016,
        edition: '1',
        image: 'https://cv5.litres.ru/pub/c/cover_415/18506555.webp'),
    Book(
        id: 11,
        title: 'Спустившийся с гор',
        author: 'Хачик Хутлубян',
        description:
            'Эта книга явилась как нельзя вовремя. На протяжении двух последних веков судьба Кавказа неотделима от судьбы России. Кавказ не только область романтических влечений, но и зона повышенной опасности, таящая угрозу политических, этнических и межконфессиональных «разборок». Тем важнее постигнуть ментальность этого мира изнутри, взглянуть на него глазами участника или очевидца описываемых событий. В скупой, аскетической, «дневниковой» прозе Хачилава (ее кажущаяся простота даже порождает соблазн увенчать автора лаврами «дагестанского Хемингуэя») нашли отражение драматические реалии современного Кавказа: от мощного брожения национального духа до все более усиливающегося владычества мафиозных структур и криминализации всего общества сверху донизу. (Впрочем, последнее уже не является чисто региональной особенностью.) История «спустившегося с гор» молодого героя (в журнальной публикации представлены отдельные ее эпизоды) не укладывается в рамки традиционного литературного сюжета, суть которого исчерпывалась бы сакраментальным словом «падение». Ибо, как мы догадываемся, речь здесь идет не только об этом. От внимательного читателя не укроются сокровенные смыслы этого текста, «наивность» которого лишь подчеркивает трагизм воплощенной в нем жизни.',
        price: 1,
        year: 1995,
        edition: '2',
        image: 'https://cv0.litres.ru/pub/c/cover_415/40105709.webp'),
    Book(
        id: 12,
        title: 'Мужчина. Инструкция по эксплуатации',
        author: 'Александра Шервинская',
        description:
            'Когда тебе уже за тридцать, и в прошлом сплошные разочарования, то поневоле перестаёшь верить в чудо. А оно есть и не дремлет! Только чтобы встретиться с ним, нужно перестать себя жалеть и позволить себе быть счастливой. И пусть ты считаешь, что это ненадолго. У судьбы могу быть на тебя совершенно другие планы. Из раннего. Небольшой рассказ без претензий на серьёзность. В 2021 году рассказ стал серебряным призёром конкурса "Красивые истории о любви. Однажды в городе"',
        price: 99,
        year: 2024,
        edition: '1',
        image: 'https://cv7.litres.ru/pub/c/cover_415/70627873.webp'),
    Book(
        id: 13,
        title: 'Квента. Трилогия',
        author: 'Мери Ли',
        description:
            'Джо попадает в мир, где практически нарушена грань с реальностью. Ей предстоит пройти испытания, чтобы вспомнить, кто она и как здесь оказалась. На пути Джо встречает двоих мужчин, но как понять, кто из них друг, а кто враг? Квента - история одного персонажа. Трилогия под одной обложкой.',
        price: 399,
        year: 2023,
        edition: '1',
        image: 'https://cv9.litres.ru/pub/c/cover_415/70628395.webp'),
    Book(
        id: 14,
        title: 'Оруэлл. 1945. Руины. Военные репортажи',
        author: 'Джордж Оруэлл',
        description:
            '15 февраля 1945 года Джордж Оруэлл в качестве военного корреспондента отправился в Германию, чтобы как очевидец рассказать о жизни в разрушенной Европе. Здесь впервые собраны его яркие и глубокие заметки сороковых годов о мировой войне, ее цене и последствиях.Война была в фокусе радио и газетных выступлений Оруэлла еще со времени его участия в боях с франкистами в Испании в 1936–1937 гг. В 1944 году дом, в котором Оруэлл жил с семьей, был разрушен немецкими бомбами. У писателя было много причин для ненависти к противникам. Но в своих публицистических работах он прежде всего думает о будущем и ищет для всех людей выход из кровавых тупиков тотальной войны и разобщенности.',
        price: 279,
        year: 1945,
        edition: '1',
        image: 'https://cv5.litres.ru/pub/c/cover_415/70581559.webp'),
    Book(
        id: 15,
        title:
            'Внутренняя инженерия. Путь к радости. Практическое руководство от йога',
        author: 'Садхгуру',
        description:
            'Человек – самый сложный механизм на планете, а йога – инструкция по его применению. Так считает Садхгуру – йог, мистик и коуч ведущих компаний мира. Эта увлекательная книга основана на разработанной им системе «Внутренняя инженерия», призванной убрать с йоги культурные наслоения и представить ее как технологию достижения радости и благополучия, доступную любому человеку. Руководствуясь этой древней мудростью, поданной в современном ключе, каждый может сделать свою жизнь именно такой, какой хочет.Садхгуру успешно выступал с лекциями о «Внутренней инженерии» в самых авторитетных учреждениях и университетах по всему миру, включая ООН, Google, General Electric, Сбербанк, а также Оксфорд, Стэнфорд, Гарвард, Йельский университет, Уортонскую школу бизнеса, Массачусетский технологический институт и так далее.Садхгуру также является основателем некоммерческой благотворительной организации Isha, насчитывающей более 7 миллионов волонтеров по всему миру. Фонду присвоен специальный консультативный статус при Экономическом и Социальном Совете ООН.',
        price: 519,
        year: 2011,
        edition: '1',
        image: 'https://cv1.litres.ru/pub/c/cover_415/33387215.webp')
  ];

  static Book getBookById(int id) {
    return _books.firstWhere((book) => book.id == id);
  }

  static List<Book> getBooksByIds(List<int> ids) {
    return _books.where((book) => ids.contains(book.id)).toList();
  }
}
