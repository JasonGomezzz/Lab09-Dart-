// Datos en memoria: listas y mapas. Los pósters se cargan desde la nube.
const _w = 'https://upload.wikimedia.org/wikipedia';

/// Marcas del catálogo (filtro de la pantalla de inicio).
final List<Map<String, String>> categorias = [
  {'nombre': 'Disney', 'color': '0xFF0B2A6F'},
  {'nombre': 'Pixar', 'color': '0xFF1B6CA8'},
  {'nombre': 'Marvel', 'color': '0xFF8E1B1B'},
  {'nombre': 'Star Wars', 'color': '0xFF2B2B2B'},
  {'nombre': 'Nat Geo', 'color': '0xFFB38600'},
];

/// Catálogo completo: cada película es un mapa.
final List<Map<String, String>> catalogo = [
  {'titulo': 'Moana 2', 'marca': 'Disney', 'genero': 'Animación', 'anio': '2024', 'duracion': '1 h 40 min', 'imagen': '$_w/en/7/73/Moana_2_poster.jpg', 'sinopsis': 'Moana recibe una llamada de sus ancestros y viaja a los mares lejanos de Oceanía en una aventura peligrosa.', 'seccion': 'novedad'},
  {'titulo': 'Mufasa: El Rey León', 'marca': 'Disney', 'genero': 'Aventura', 'anio': '2024', 'duracion': '1 h 58 min', 'imagen': '$_w/en/0/0b/Mufasa_The_Lion_King_Movie_2024.jpeg', 'sinopsis': 'Rafiki cuenta a la cachorra Kiara la leyenda de Mufasa, un huérfano que llegó a ser rey.', 'seccion': 'novedad'},
  {'titulo': 'Frozen', 'marca': 'Disney', 'genero': 'Musical', 'anio': '2013', 'duracion': '1 h 42 min', 'imagen': '$_w/en/0/05/Frozen_%282013_film%29_poster.jpg', 'sinopsis': 'Anna busca a su hermana Elsa para detener un invierno eterno sobre Arendelle.', 'seccion': 'recomendada'},
  {'titulo': 'Encanto', 'marca': 'Disney', 'genero': 'Animación', 'anio': '2021', 'duracion': '1 h 49 min', 'imagen': '$_w/en/8/83/Encanto_poster.jpg', 'sinopsis': 'La familia Madrigal vive en una casa mágica en Colombia, y cada miembro recibe un don especial.', 'progreso': 'Quedan 45 min'},
  {'titulo': 'Moana', 'marca': 'Disney', 'genero': 'Aventura', 'anio': '2016', 'duracion': '1 h 47 min', 'imagen': '$_w/en/2/26/Moana_Teaser_Poster.jpg', 'sinopsis': 'Una joven navegante cruza el océano para salvar a su pueblo junto al semidiós Maui.'},
  {'titulo': 'El Rey León', 'marca': 'Disney', 'genero': 'Musical', 'anio': '1994', 'duracion': '1 h 28 min', 'imagen': '$_w/en/3/3d/The_Lion_King_poster.jpg', 'sinopsis': 'Simba debe aceptar su destino como rey de las Tierras del Reino.'},
  {'titulo': 'La Bella y la Bestia', 'marca': 'Disney', 'genero': 'Fantasía', 'anio': '2017', 'duracion': '2 h 9 min', 'imagen': '$_w/en/d/d6/Beauty_and_the_Beast_2017_poster.jpg', 'sinopsis': 'Bella descubre el corazón de una bestia encantada en un castillo misterioso.'},
  {'titulo': 'Aladdín', 'marca': 'Disney', 'genero': 'Aventura', 'anio': '2019', 'duracion': '2 h 8 min', 'imagen': '$_w/en/9/9a/Aladdin_%28Official_2019_Film_Poster%29.png', 'sinopsis': 'Un joven ladrón encuentra una lámpara mágica que cambiará su vida.'},
  {'titulo': 'Zootopia', 'marca': 'Disney', 'genero': 'Animación', 'anio': '2016', 'duracion': '1 h 48 min', 'imagen': '$_w/en/9/96/Zootopia_%28movie_poster%29.jpg', 'sinopsis': 'Una coneja policía y un zorro astuto resuelven un misterio en una ciudad de animales.'},
  {'titulo': 'Intensamente 2', 'marca': 'Pixar', 'genero': 'Animación', 'anio': '2024', 'duracion': '1 h 36 min', 'imagen': '$_w/en/f/f7/Inside_Out_2_poster.jpg', 'sinopsis': 'Riley entra en la adolescencia y llegan nuevas emociones a la central de mando de su cabeza.', 'seccion': 'novedad'},
  {'titulo': 'Elio', 'marca': 'Pixar', 'genero': 'Ciencia ficción', 'anio': '2025', 'duracion': '1 h 38 min', 'imagen': '$_w/en/4/4e/Elio_film_poster.jpg', 'sinopsis': 'Un niño es confundido con el embajador de la Tierra ante una comunidad intergaláctica.', 'seccion': 'novedad'},
  {'titulo': 'Coco', 'marca': 'Pixar', 'genero': 'Animación', 'anio': '2017', 'duracion': '1 h 45 min', 'imagen': '$_w/en/9/98/Coco_%282017_film%29_poster.jpg', 'sinopsis': 'Miguel viaja a la Tierra de los Muertos para descubrir la historia de su familia.', 'seccion': 'recomendada'},
  {'titulo': 'Toy Story', 'marca': 'Pixar', 'genero': 'Animación', 'anio': '1995', 'duracion': '1 h 21 min', 'imagen': '$_w/en/1/13/Toy_Story.jpg', 'sinopsis': 'Los juguetes de Andy cobran vida cuando nadie los ve y llega un nuevo juguete.', 'seccion': 'recomendada'},
  {'titulo': 'Up', 'marca': 'Pixar', 'genero': 'Animación', 'anio': '2009', 'duracion': '1 h 36 min', 'imagen': '$_w/en/0/05/Up_%282009_film%29.jpg', 'sinopsis': 'Carl ata miles de globos a su casa y vuela hacia Sudamérica.', 'progreso': 'Quedan 20 min'},
  {'titulo': 'Buscando a Nemo', 'marca': 'Pixar', 'genero': 'Animación', 'anio': '2003', 'duracion': '1 h 40 min', 'imagen': '$_w/en/2/29/Finding_Nemo.jpg', 'sinopsis': 'Marlin cruza el océano para encontrar a su hijo Nemo.', 'progreso': 'Quedan 1 h 5 min'},
  {'titulo': 'Ratatouille', 'marca': 'Pixar', 'genero': 'Comedia', 'anio': '2007', 'duracion': '1 h 51 min', 'imagen': '$_w/en/5/50/RatatouillePoster.jpg', 'sinopsis': 'Una rata con talento culinario sueña con convertirse en chef en París.'},
  {'titulo': 'WALL-E', 'marca': 'Pixar', 'genero': 'Ciencia ficción', 'anio': '2008', 'duracion': '1 h 38 min', 'imagen': '$_w/en/4/4c/WALL-E_poster.jpg', 'sinopsis': 'Un pequeño robot recolector de basura encuentra el amor y cambia el futuro de la humanidad.'},
  {'titulo': 'Soul', 'marca': 'Pixar', 'genero': 'Animación', 'anio': '2020', 'duracion': '1 h 40 min', 'imagen': '$_w/en/3/39/Soul_%282020_film%29_poster.jpg', 'sinopsis': 'Un profesor de música busca regresar a su cuerpo y descubre qué da sentido a la vida.'},
  {'titulo': 'Luca', 'marca': 'Pixar', 'genero': 'Animación', 'anio': '2021', 'duracion': '1 h 35 min', 'imagen': '$_w/en/3/33/Luca_%282021_film%29.png', 'sinopsis': 'Un monstruo marino vive un verano inolvidable en la costa italiana.'},
  {'titulo': 'Cars', 'marca': 'Pixar', 'genero': 'Animación', 'anio': '2006', 'duracion': '1 h 57 min', 'imagen': '$_w/en/3/34/Cars_2006.jpg', 'sinopsis': 'Rayo McQueen aprende el valor de la amistad en un pueblo olvidado de la Ruta 66.'},
  {'titulo': 'Deadpool & Wolverine', 'marca': 'Marvel', 'genero': 'Acción', 'anio': '2024', 'duracion': '2 h 8 min', 'imagen': '$_w/en/4/4c/Deadpool_%26_Wolverine_poster.jpg', 'sinopsis': 'Wade Wilson y Logan unen fuerzas en una misión descabellada.', 'seccion': 'novedad'},
  {'titulo': 'Avengers: Endgame', 'marca': 'Marvel', 'genero': 'Acción', 'anio': '2019', 'duracion': '3 h 1 min', 'imagen': '$_w/en/0/0d/Avengers_Endgame_poster.jpg', 'sinopsis': 'Los Vengadores se reúnen para revertir el chasquido de Thanos.', 'seccion': 'recomendada'},
  {'titulo': 'Pantera Negra', 'marca': 'Marvel', 'genero': 'Acción', 'anio': '2018', 'duracion': '2 h 14 min', 'imagen': '$_w/en/d/d6/Black_Panther_%28film%29_poster.jpg', 'sinopsis': 'T\'Challa regresa a Wakanda para reclamar el trono como rey.'},
  {'titulo': 'Iron Man', 'marca': 'Marvel', 'genero': 'Acción', 'anio': '2008', 'duracion': '2 h 6 min', 'imagen': '$_w/en/0/02/Iron_Man_%282008_film%29_poster.jpg', 'sinopsis': 'Tony Stark construye una armadura para escapar de sus captores y cambia su destino.'},
  {'titulo': 'Doctor Strange', 'marca': 'Marvel', 'genero': 'Fantasía', 'anio': '2016', 'duracion': '1 h 55 min', 'imagen': '$_w/en/a/a1/Doctor_Strange_%282016_film%29_poster.jpg', 'sinopsis': 'Un cirujano brillante descubre el mundo de las artes místicas.'},
  {'titulo': 'Thor: Ragnarok', 'marca': 'Marvel', 'genero': 'Acción', 'anio': '2017', 'duracion': '2 h 10 min', 'imagen': '$_w/en/7/7d/Thor_Ragnarok_poster.jpg', 'sinopsis': 'Thor debe escapar de un planeta de gladiadores para salvar Asgard.'},
  {'titulo': 'Guardianes de la Galaxia', 'marca': 'Marvel', 'genero': 'Ciencia ficción', 'anio': '2014', 'duracion': '2 h 1 min', 'imagen': '$_w/en/3/33/Guardians_of_the_Galaxy_%28film%29_poster.jpg', 'sinopsis': 'Un grupo de inadaptados se une para proteger un poderoso orbe.'},
  {'titulo': 'Star Wars: Una nueva esperanza', 'marca': 'Star Wars', 'genero': 'Ciencia ficción', 'anio': '1977', 'duracion': '2 h 1 min', 'imagen': '$_w/en/8/87/StarWarsMoviePoster1977.jpg', 'sinopsis': 'Luke Skywalker se une a la Rebelión para enfrentar al Imperio Galáctico.', 'seccion': 'recomendada'},
  {'titulo': 'El imperio contraataca', 'marca': 'Star Wars', 'genero': 'Ciencia ficción', 'anio': '1980', 'duracion': '2 h 4 min', 'imagen': '$_w/en/3/3f/The_Empire_Strikes_Back_%281980_film%29.jpg', 'sinopsis': 'Los rebeldes huyen del Imperio mientras Luke entrena con Yoda.'},
  {'titulo': 'El retorno del Jedi', 'marca': 'Star Wars', 'genero': 'Ciencia ficción', 'anio': '1983', 'duracion': '2 h 11 min', 'imagen': '$_w/en/b/b2/ReturnOfTheJediPoster1983.jpg', 'sinopsis': 'La Rebelión se enfrenta a la segunda Estrella de la Muerte.'},
  {'titulo': 'Rogue One', 'marca': 'Star Wars', 'genero': 'Ciencia ficción', 'anio': '2016', 'duracion': '2 h 13 min', 'imagen': '$_w/en/d/d4/Rogue_One%2C_A_Star_Wars_Story_poster.png', 'sinopsis': 'Un grupo de rebeldes intenta robar los planos de la Estrella de la Muerte.'},
  {'titulo': 'El despertar de la Fuerza', 'marca': 'Star Wars', 'genero': 'Ciencia ficción', 'anio': '2015', 'duracion': '2 h 18 min', 'imagen': '$_w/en/a/a2/Star_Wars_The_Force_Awakens_Theatrical_Poster.jpg', 'sinopsis': 'Una chatarrera y un desertor se unen a la Resistencia contra la Primera Orden.'},
  {'titulo': 'Free Solo', 'marca': 'Nat Geo', 'genero': 'Documental', 'anio': '2018', 'duracion': '1 h 40 min', 'imagen': '$_w/en/9/9c/Free_Solo.png', 'sinopsis': 'Alex Honnold intenta escalar El Capitán sin cuerdas ni protección.'},
  {'titulo': 'Jane', 'marca': 'Nat Geo', 'genero': 'Documental', 'anio': '2017', 'duracion': '1 h 30 min', 'imagen': '$_w/en/c/cc/Jane_%282017_film%29.png', 'sinopsis': 'La vida de la primatóloga Jane Goodall entre los chimpancés de Tanzania.'},
  {'titulo': 'Fire of Love', 'marca': 'Nat Geo', 'genero': 'Documental', 'anio': '2022', 'duracion': '1 h 33 min', 'imagen': '$_w/en/9/9c/Fire_of_Love_poster.jpeg', 'sinopsis': 'Dos vulcanólogos dedican su vida a estudiar volcanes y se enamoran en el camino.'},
];

List<Map<String, String>> porMarca(String marca) =>
    catalogo.where((p) => p['marca'] == marca).toList();

final List<Map<String, String>> novedades =
    catalogo.where((p) => p['seccion'] == 'novedad').toList();

final List<Map<String, String>> recomendadas =
    catalogo.where((p) => p['seccion'] == 'recomendada').toList();

final List<Map<String, String>> continuarViendo =
    catalogo.where((p) => p.containsKey('progreso')).toList();

/// Planes de la pantalla de suscripción (solo demostración, sin cobro real).
final List<Map<String, String>> planes = [
  {'nombre': 'Básico', 'precio': 'S/ 14.90 al mes', 'detalle': 'Con anuncios · 1 pantalla · HD'},
  {'nombre': 'Premium', 'precio': 'S/ 24.90 al mes', 'detalle': 'Sin anuncios · 4 pantallas · 4K y descargas'},
  {'nombre': 'Anual Premium', 'precio': 'S/ 249 al año', 'detalle': 'Ahorra 2 meses · Todo lo de Premium'},
];
