import 'package:flutter/material.dart';

void main() {
  runApp(const CalendarioApp());
}

class CalendarioApp extends StatelessWidget {
  const CalendarioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calendario',
      theme: ThemeData(fontFamily: 'serif'),
      home: const CalendarioScreen(),
    );
  }
}

class CalendarioScreen extends StatelessWidget {
  const CalendarioScreen({super.key});

  static const Color negro = Color(0xFF0C0A11);
  static const Color panel = Color(0xFF16121E);
  static const Color dorado = Color(0xFFC9A24B);
  static const Color doradoClaro = Color(0xFFE6CD8A);
  static const Color marfil = Color(0xFFF3EEE3);
  static const Color grisTexto = Color(0xFF8D8698);
  static const Color rosaApagado = Color(0xFFB4728A);

  final List<List<Map<String, dynamic>>> semanas = const [
    [
      {'dia': 31, 'fuera': true},
      {'dia': 1, 'fuera': false},
      {'dia': 2, 'fuera': false},
      {'dia': 3, 'fuera': false},
      {'dia': 4, 'fuera': false},
      {'dia': 5, 'fuera': false},
      {'dia': 6, 'fuera': false},
    ],
    [
      {'dia': 7, 'fuera': false},
      {'dia': 8, 'fuera': false},
      {'dia': 9, 'fuera': false},
      {'dia': 10, 'fuera': false},
      {'dia': 11, 'fuera': false},
      {'dia': 12, 'fuera': false},
      {'dia': 13, 'fuera': false},
    ],
    [
      {'dia': 14, 'fuera': false},
      {'dia': 15, 'fuera': false},
      {'dia': 16, 'fuera': false},
      {'dia': 17, 'fuera': false},
      {'dia': 18, 'fuera': false},
      {'dia': 19, 'fuera': false},
      {'dia': 20, 'fuera': false},
    ],
    [
      {'dia': 21, 'fuera': false},
      {'dia': 22, 'fuera': false},
      {'dia': 23, 'fuera': false},
      {'dia': 24, 'fuera': false},
      {'dia': 25, 'fuera': false},
      {'dia': 26, 'fuera': false},
      {'dia': 27, 'fuera': false},
    ],
    [
      {'dia': 28, 'fuera': false},
      {'dia': 29, 'fuera': false},
      {'dia': 30, 'fuera': false},
      {'dia': 1, 'fuera': true},
      {'dia': 2, 'fuera': true},
      {'dia': 3, 'fuera': true},
      {'dia': 4, 'fuera': true},
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFE9E4F0),
        child: Center(child: _buildMarco()),
      ),
    );
  }

  Widget _buildMarco() {
    return Container(
      width: 380,
      height: 800,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: negro,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: dorado.withValues(alpha: 0.35), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 35,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(37),
        child: Container(
          color: negro,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildEncabezado(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildDiasSemana(),
                            const SizedBox(height: 6),
                            ...semanas.map((s) => _buildFilaSemana(s)),
                            const SizedBox(height: 16),
                            _buildLeyenda(),
                            const SizedBox(height: 26),
                            _buildDivisor(),
                            const SizedBox(height: 20),
                            Text(
                              'AGENDA',
                              style: TextStyle(
                                color: marfil,
                                fontSize: 14,
                                letterSpacing: 4,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildFilaEvento(
                              numero: '05',
                              mes: 'SEP',
                              titulo: 'Reunión de equipo',
                              hora: '10:00 a.m.',
                              icono: Icons.groups_outlined,
                              acento: dorado,
                            ),
                            _buildDivisorFino(),
                            _buildFilaEvento(
                              numero: '12',
                              mes: 'SEP',
                              titulo: 'Examen de programación',
                              hora: '9:00 a.m.',
                              icono: Icons.school_outlined,
                              acento: rosaApagado,
                            ),
                            _buildDivisorFino(),
                            _buildFilaEvento(
                              numero: '21',
                              mes: 'SEP',
                              titulo: 'Presentación de proyecto',
                              hora: '2:00 p.m.',
                              icono: Icons.auto_graph_rounded,
                              acento: doradoClaro,
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildBarraInferior(),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- ENCABEZADO LIMPIO TIPO REVISTA ----------
  Widget _buildEncabezado() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 34, 24, 24),
      color: panel,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.chevron_left, color: dorado.withValues(alpha: 0.7), size: 20),
              Column(
                children: [
                  Text(
                    'Septiembre',
                    style: TextStyle(
                      color: marfil,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    '2 0 2 6',
                    style: TextStyle(
                      color: dorado,
                      fontSize: 13,
                      letterSpacing: 4,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Icon(Icons.chevron_right, color: dorado.withValues(alpha: 0.7), size: 20),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'Cada día, una historia por escribir',
            style: TextStyle(
              color: grisTexto,
              fontSize: 11.5,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivisor() {
    return Row(
      children: [
        Expanded(child: Container(height: 1, color: dorado.withValues(alpha: 0.25))),
        const SizedBox(width: 8),
        Icon(Icons.diamond_outlined, size: 10, color: dorado.withValues(alpha: 0.6)),
        const SizedBox(width: 8),
        Expanded(child: Container(height: 1, color: dorado.withValues(alpha: 0.25))),
      ],
    );
  }

  Widget _buildDivisorFino() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(height: 1, color: Colors.white.withValues(alpha: 0.06)),
    );
  }

  // ---------- DÍAS DE LA SEMANA ----------
  Widget _buildDiasSemana() {
    const dias = ['L', 'M', 'X', 'J', 'V', 'S', 'D'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: dias
          .map((d) => Expanded(
                child: Center(
                  child: Text(
                    d,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: dorado.withValues(alpha: 0.7),
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildFilaSemana(List<Map<String, dynamic>> semana) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: semana.map((info) => _buildDia(info)).toList(),
      ),
    );
  }

  // ---------- CELDA DE DÍA ----------
  Widget _buildDia(Map<String, dynamic> info) {
    final int dia = info['dia'];
    final bool fuera = info['fuera'];

    Color textoColor = fuera ? grisTexto.withValues(alpha: 0.35) : marfil;
    Color? fondoCirculo;
    Color? colorEvento;

    if (!fuera) {
      if (dia == 5) {
        fondoCirculo = dorado; // hoy
        textoColor = negro;
      } else if (dia == 21) {
        colorEvento = doradoClaro; // destacado
        textoColor = doradoClaro;
      } else if (dia == 12) {
        colorEvento = rosaApagado;
        textoColor = rosaApagado;
      } else if (dia == 18) {
        colorEvento = dorado;
        textoColor = dorado;
      }
    }

    return Expanded(
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: fondoCirculo,
          shape: BoxShape.circle,
          border: colorEvento != null
              ? Border.all(color: colorEvento, width: 1.5)
              : null,
        ),
        child: Text(
          '$dia',
          style: TextStyle(
            color: textoColor,
            fontWeight: (fondoCirculo != null || colorEvento != null)
                ? FontWeight.bold
                : FontWeight.normal,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  // ---------- LEYENDA ----------
  Widget _buildLeyenda() {
    return Row(
      children: [
        _puntoLeyenda(dorado, 'Hoy'),
        const SizedBox(width: 16),
        _puntoLeyenda(doradoClaro, 'Destacado'),
        const SizedBox(width: 16),
        _puntoLeyenda(rosaApagado, 'Evento'),
      ],
    );
  }

  Widget _puntoLeyenda(Color color, String texto) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 5),
        Text(texto, style: TextStyle(color: grisTexto, fontSize: 10)),
      ],
    );
  }

  // ---------- FILA DE EVENTO (lista vertical, sin cortes) ----------
  Widget _buildFilaEvento({
    required String numero,
    required String mes,
    required String titulo,
    required String hora,
    required IconData icono,
    required Color acento,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: acento, width: 1.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  numero,
                  style: TextStyle(
                    color: acento,
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  mes,
                  style: TextStyle(
                    color: acento.withValues(alpha: 0.8),
                    fontSize: 8,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    color: marfil,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.5,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Icon(icono, color: grisTexto, size: 12),
                    const SizedBox(width: 5),
                    Text(hora, style: TextStyle(color: grisTexto, fontSize: 11)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------- BARRA INFERIOR ----------
  Widget _buildBarraInferior() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: panel,
        border: Border(top: BorderSide(color: dorado.withValues(alpha: 0.15), width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildItemBarra(Icons.calendar_today_rounded, 'CALENDARIO', true),
          _buildItemBarra(Icons.event_note_rounded, 'EVENTOS', false),
          _buildItemBarra(Icons.person_rounded, 'PERFIL', false),
        ],
      ),
    );
  }

  Widget _buildItemBarra(IconData icono, String texto, bool activo) {
    final color = activo ? dorado : grisTexto;
    return Column(
      children: [
        Icon(icono, color: color, size: 18),
        const SizedBox(height: 4),
        Text(
          texto,
          style: TextStyle(
            color: color,
            fontSize: 8.5,
            letterSpacing: 1,
            fontWeight: activo ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}