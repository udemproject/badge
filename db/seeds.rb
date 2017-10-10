# Setup questions for review.

Question.create(
  question: 'Abierto a nuevas ideas (por más locas que fueran).',
  q_type: :stars,
  individual: true
)

Question.create(
  question: 'Abierto a compartir información y a dar su opinión.',
  q_type: :stars,
  individual: true
)

Question.create(
  question: 'Dio su máximo esfuerzo demostrando ser proactivo en el desarrollo del proyecto',
  q_type: :stars,
  individual: true
)

Question.create(
  question: 'Estuvo siempre comprometido con el equipo.',
  q_type: :stars,
  individual: true
)

Question.create(
  question: 'Se relacionó con todos los integrantes del equipo.',
  q_type: :stars,
  individual: true
)

Question.create(
  question: 'Trabajó en conjunto para lograr los objetivos del equipo.',
  q_type: :stars,
  individual: true
)

Question.create(
  question: 'Trabajó siempre con buena actitud.',
  q_type: :stars,
  individual: true
)

Question.create(
  question: 'Asumió riesgos aún sabiendo la incertidumbre del proyecto.',
  q_type: :stars,
  individual: true
)

Question.create(
  question: 'Aún con la presión encima, demostró pasión y entusiasmo durante todo el evento.',
  q_type: :stars,
  individual: true
)

Question.create(
  question: 'Déjanos tus comentarios o sugerencias',
  q_type: :open,
  individual: false
)

# The profile hash must not include the leader of the team.

# e = Event.find_by(slug: 'disrupting-coflex')
#
# Team.create(
#   name: 'TENSION 1',
#   event_id: e.id,
#   profiles: { 'Maker' => 1, 'Non IT' => 1, 'Industrial Designer' => 1, 'Rockstars' => 1 }
# )
