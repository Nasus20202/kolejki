#set text(
  font: "New Computer Modern",
  size: 11pt
)
#set page(
  paper: "a4",
  margin: (x: 0.5cm, y: 1cm),
  numbering: "1 / 1",
  footer: context [
    #set text(8pt)
    #h(1fr)
    #counter(page).display(
      "1 / 1",
      both: true
    )
  ]
)
#set figure(numbering: none)

#let slide-thumb(path, slide-page) = box(width: 100%)[
  #align(center)[
    #figure(
      image(path, page: slide-page, fit: "contain"),
      caption: [Strona #slide-page]
    )
  ]
]

#let pdf-handout(path, slides) = [
  #let chunks = slides.chunks(3)
  #for i in range(chunks.len()) [
    #let chunk = chunks.at(i)
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 8pt,
      ..chunk.map(slide-page => slide-thumb(path, slide-page)),
    )
  ]
]

#let old-exam-handout(path, slides) = [
  #let chunks = slides.chunks(2)
  #for i in range(chunks.len()) [
    #let chunk = chunks.at(i)
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      ..chunk.map(slide-page => slide-thumb(path, slide-page)),
    )
    #if i + 1 < chunks.len() [
      #pagebreak()
    ]
  ]
]

#outline(
  title: "Kolejkowa heurystyka edukacyjna"
)
#pagebreak()

#include "zadanie1.typ"
#pagebreak()

#include "zadanie2.typ"
#pagebreak()

#include "zadanie3.typ"
#pagebreak()

#include "zadanie4.typ"
#pagebreak()

#include "wzory.typ"
#pagebreak()

#set page(
  flipped: true
)

= Wykłady

== Część 1
#pdf-handout("external/wykłady-TK-część-1_2026.pdf", range(4, 30))

== Część 2
#pdf-handout("external/wykłady-TK-część-2_2026.pdf", range(2, 21))

== Część 3
#pdf-handout("external/wykłady-TK-część-3_2026.pdf", range(2, 25))

== Część 4
#pdf-handout("external/wykłady-TK-część-4_2026.pdf", range(2, 15))

== Część 5
#pdf-handout("external/wykłady-TK-część-5_2026.pdf", range(2, 14))

= Stare kolokwia

#old-exam-handout("external/BO_tests_merged.pdf", range(1, 32))
