// MindForge — UML Diagrams Print
// Auto-generated Typst document for full-page UML diagram printing

#set text(font: "Helvetica", size: 12pt)

// ── Title Page (portrait) ──
#page(paper: "a4", margin: 1cm)[
  #align(center + horizon)[
    #text(size: 28pt, weight: "bold")[MindForge]
    #v(0.5cm)
    #text(size: 18pt)[UML Diagrams]
    #v(1cm)
    #text(size: 12pt, fill: luma(100))[Black Sphere Industries]
    #v(0.3cm)
    #text(size: 10pt, fill: luma(140))[Generated #datetime.today().display()]
  ]
]

// ── Class Diagram (portrait: 1499x3416) ──
#page(paper: "a4", margin: 1cm, flipped: false)[
  #text(size: 9pt, fill: luma(100))[Class Diagram]
  #v(0.15cm)
  #block(width: 100%, height: 1fr)[
    #image("uml-class-diagram.svg", fit: "contain", width: 100%, height: 100%)
  ]
]

// ── Sequence — Interaction (portrait: 1347x2586) ──
#page(paper: "a4", margin: 1cm, flipped: false)[
  #text(size: 9pt, fill: luma(100))[Sequence Diagram — Interaction]
  #v(0.15cm)
  #block(width: 100%, height: 1fr)[
    #image("uml-seq-interaction.svg", fit: "contain", width: 100%, height: 100%)
  ]
]

// ── Sequence — Main (portrait: 2774x3821) ──
#page(paper: "a4", margin: 1cm, flipped: false)[
  #text(size: 9pt, fill: luma(100))[Sequence Diagram — Main]
  #v(0.15cm)
  #block(width: 100%, height: 1fr)[
    #image("uml-seq-main.svg", fit: "contain", width: 100%, height: 100%)
  ]
]

// ── Sequence — Secondary (portrait: 2388x2916) ──
#page(paper: "a4", margin: 1cm, flipped: false)[
  #text(size: 9pt, fill: luma(100))[Sequence Diagram — Secondary]
  #v(0.15cm)
  #block(width: 100%, height: 1fr)[
    #image("uml-seq-secondary.svg", fit: "contain", width: 100%, height: 100%)
  ]
]

// ── State Diagram (landscape: 1651x1616) ──
#page(paper: "a4", margin: 1cm, flipped: true)[
  #text(size: 9pt, fill: luma(100))[State Diagram]
  #v(0.15cm)
  #block(width: 100%, height: 1fr)[
    #image("uml-states.svg", fit: "contain", width: 100%, height: 100%)
  ]
]
