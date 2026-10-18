#import "@preview/modern-g7-32:0.2.0": abstract, gost, custom-title-template
#import "title-mephi.typ" as title-mephi


#show: gost.with(
  title-template: custom-title-template.from-module(title-mephi),
  ministry: [МИНИСТЕРСТВО НАУКИ И ВЫСШЕГО ОБРАЗОВАНИЯ\ РОССИЙСКОЙ ФЕДЕРАЦИИ],
  university: [Федеральное государственное автономное образовательное учреждение высшего образования «Национальный исследовательский ядерный университет «МИФИ»],
  department: [Кафедра №42 «Криптология и кибербезопасность»],
  step-number: 1,
  subject: "СИСТЕМА АВТОМАТИЗИРОВАННОГО СБОРА И АНАЛИЗА ЦИФРОВЫХ АРТЕФАКТОВ В КОНТЕЙНЕРНЫХ СРЕДАХ ДЛЯ РАССЛЕДОВАНИЯ ИНЦИДЕНТОВ ИНФОРМАЦИОННОЙ БЕЗОПАСНОСТИ",
  manager: (name: "М. С. Карапетьянц", position: "Ассистент"),
  student: (name: "М. А. Горячев", group: "Б23-505"),
  city: "Москва",
)

#set enum(numbering: "1)")
// #set figure(supplement: "Рис.")
#set text(lang: "ru", hyphenate: true)
#set par(justify: true)



#include "abstract.typ"

#outline()

#include "terms.typ"
#include "abbreviations.typ"
#include "intro.typ"
#include "postanovka.typ"

#include "1chap.typ"
#include "2chap.typ"
#include "3chap.typ"
#include "4chap.typ"
#include "5concl.typ"

#bibliography("references.bib")

#include "6appendixes.typ"
//#include "prilozheniya.typ"

