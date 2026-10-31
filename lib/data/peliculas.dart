// Datos en memoria: listas y mapas. Los pósters se cargan desde la nube.
const _w = 'https://upload.wikimedia.org/wikipedia';

final List<Map<String, String>> categorias = [
  {'nombre': 'DISNEY', 'color': '0xFF0B2A6F'},
  {'nombre': 'PIXAR', 'color': '0xFF1B6CA8'},
  {'nombre': 'MARVEL', 'color': '0xFF8E1B1B'},
  {'nombre': 'STAR WARS', 'color': '0xFF2B2B2B'},
  {'nombre': 'NAT GEO', 'color': '0xFFB38600'},
];

final List<Map<String, String>> novedades = [
  {'titulo': 'Moana 2', 'genero': 'Animación', 'anio': '2024', 'duracion': '1 h 40 min', 'imagen': '$_w/en/7/73/Moana_2_poster.jpg', 'sinopsis': 'Moana recibe una llamada inesperada de sus ancestros y viaja a los mares lejanos de Oceanía en una aventura peligrosa.'},
  {'titulo': 'Inside Out 2', 'genero': 'Animación', 'anio': '2024', 'duracion': '1 h 36 min', 'imagen': '$_w/en/f/f7/Inside_Out_2_poster.jpg', 'sinopsis': 'Riley entra en la adolescencia y llegan nuevas emociones a la central de mando de su cabeza.'},
  {'titulo': 'Deadpool & Wolverine', 'genero': 'Acción', 'anio': '2024', 'duracion': '2 h 7 min', 'imagen': '$_w/en/4/4c/Deadpool_%26_Wolverine_poster.jpg', 'sinopsis': 'Wade Wilson y Logan unen fuerzas en una misión descabellada que pondrá a prueba su paciencia.'},
  {'titulo': 'Mufasa: El Rey León', 'genero': 'Aventura', 'anio': '2024', 'duracion': '1 h 58 min', 'imagen': '$_w/en/0/0b/Mufasa_The_Lion_King_Movie_2024.jpeg', 'sinopsis': 'Rafiki cuenta a la cachorra Kiara la leyenda de Mufasa, un huérfano que llegó a ser un rey.'},
  {'titulo': 'Elio', 'genero': 'Ciencia ficción', 'anio': '2025', 'duracion': '1 h 38 min', 'imagen': '$_w/en/4/4e/Elio_film_poster.jpg', 'sinopsis': 'Un niño es confundido con el embajador de la Tierra ante una comunidad intergaláctica.'},
];

final List<Map<String, String>> recomendadas = [
  {'titulo': 'Coco', 'genero': 'Animación', 'anio': '2017', 'duracion': '1 h 45 min', 'imagen': '$_w/en/9/98/Coco_%282017_film%29_poster.jpg', 'sinopsis': 'Miguel viaja a la Tierra de los Muertos para descubrir la historia de su familia.'},
  {'titulo': 'Frozen', 'genero': 'Musical', 'anio': '2013', 'duracion': '1 h 42 min', 'imagen': '$_w/en/0/05/Frozen_%282013_film%29_poster.jpg', 'sinopsis': 'Anna busca a su hermana Elsa para detener un invierno eterno sobre Arendelle.'},
  {'titulo': 'Avengers: Endgame', 'genero': 'Acción', 'anio': '2019', 'duracion': '3 h 1 min', 'imagen': '$_w/en/0/0d/Avengers_Endgame_poster.jpg', 'sinopsis': 'Los Vengadores se reúnen para revertir el chasquido de Thanos.'},
  {'titulo': 'Toy Story', 'genero': 'Animación', 'anio': '1995', 'duracion': '1 h 21 min', 'imagen': '$_w/en/1/13/Toy_Story.jpg', 'sinopsis': 'Los juguetes de Andy cobran vida cuando nadie los ve y llega un nuevo juguete.'},
];

final List<Map<String, String>> continuarViendo = [
  {'titulo': 'Encanto', 'genero': 'Animación', 'anio': '2021', 'duracion': '1 h 49 min', 'progreso': 'Quedan 45 min', 'imagen': '$_w/en/8/83/Encanto_poster.jpg', 'sinopsis': 'La familia Madrigal vive en una casa mágica en Colombia.'},
  {'titulo': 'Up', 'genero': 'Animación', 'anio': '2009', 'duracion': '1 h 36 min', 'progreso': 'Quedan 20 min', 'imagen': '$_w/en/0/05/Up_%282009_film%29.jpg', 'sinopsis': 'Carl ata miles de globos a su casa y vuela hacia Sudamérica.'},
  {'titulo': 'Buscando a Nemo', 'genero': 'Animación', 'anio': '2003', 'duracion': '1 h 40 min', 'progreso': 'Quedan 1 h 5 min', 'imagen': '$_w/en/2/29/Finding_Nemo.jpg', 'sinopsis': 'Marlin cruza el océano para encontrar a su hijo Nemo.'},
];
