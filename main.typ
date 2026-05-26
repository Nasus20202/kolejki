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

#outline(
  title: "Kolejkowa heurystyka edukacyjna"
)

#include "zadanie1.typ"

