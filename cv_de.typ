#import "pii_de.typ": *

#show heading: set text()
#show link: underline
#set page(
 margin: (x: 0.9cm, y: 1.3cm),
)
#set par(justify: true)

#let chiline() = {v(-3pt); line(length: 100%); v(-5pt)}

#let icon(name, baseline: 1.5pt) = {
  box(
    baseline: baseline,
    height: 10pt,
    image(name)
  )
}

#let contact-icon(icon-path, value) = {
  if value != "" [
    #icon(icon-path) #value \
  ]
}

#box(height: 80pt, columns(2)[
  #set align(left)
  = Felix Schausberger
  #contact-icon("Icons/location.svg", pii-address)
  #if pii-email != "" [#icon("Icons/mail.svg") #pii-email | ]
  #contact-icon("Icons/phone.svg", pii-phone)
  #icon("Icons/github.svg") #link("https://github.com/FelixSchausberger")[GitHub] |
  #icon("Icons/linkedin.svg") #link("https://www.linkedin.com/in/felix-schausberger-a04104249/")[LinkedIn]

  #set align(right)
  #h(1fr) #image("FelixSchausberger_500x500.jpg", width: 30%)]
)

== Bildungsweg
#chiline()

*Master of Science in Robotics, Cognition, Intelligence* @ TU München #h(1fr) 04/2020 -- 05/2023 \
- Masterarbeit: Comparison of Controllers for Trunk Stabilization in a Bipedal Robot #h(1fr) ISCED 7 \

*Bachelor of Science in Engineering (Mechatronik/Robotik)* @ FH Technikum Wien #h(1fr) 09/2016 -- 06/2019 \
- Bachelorarbeit: Design and Construction of a Delta Robot to Study Inverse Kinematics #h(1fr) ISCED 6 \

*Zivildienst* @ Hof Feichtlgut, Ohlsdorf #h(1fr) 07/2015 -- 05/2016 \

*Allgemeine Hochschulreife* @ Bundesrealgymnasium Gmunden #h(1fr) 09/2007 -- 06/2015 \

== Berufspraxis
#chiline()

*PDTS GmbH - Member of the Frequentis Group* \
DevOps Engineer im Flugsicherheitssektor #h(1fr) 09/2025 -- dato \
- Systemintegration im Testlabor, Automatisierung von Deployments \
- Monitoring und Betrieb komplexer Systeme in Zusammenarbeit mit internationalen Entwicklungsteams

*Magazino GmbH - a Jungheinrich company* \
DevOps Engineer #h(1fr) 03/2025 -- 09/2025 \
- Unterstützung bei der unternehmensweiten Migration von Ubuntu zu NixOS \
- Entwicklung wiederholbarer Infrastruktur- und CI/CD-Prozesse mit Nix-Tooling

Robotics QA Engineer #h(1fr) 07/2024 -- 03/2025 \
- Setup von Robotern und Durchführung von End-of-Line-Tests \
- Analyse technischer Probleme gemeinsam mit Entwicklungs- und Produktionsteams

Solution Support Engineer #h(1fr) 07/2023 -- 07/2024 \
- Überwachung von Robotern, First-Level-Support und Bearbeitung von Tickets in Jira \
- Organisation von Serviceeinsätzen, Mitarbeiterschulungen, Standardisierung von Tests und Dokumentationen

*Robotise AG* #h(1fr) 01/2020 -- 08/2022 \
Werkstudent in Forschung & Entwicklung und Qualitätssicherung \
- Unterstützung in den Bereichen mobile Autonomie, Robotertests und Feldsupport \
- Programmierung in Python, C++ und ROS; Mitarbeit bei CAD-Konstruktion und Kunden-Onboarding

*Trotec GmbH (Praktikum)* #h(1fr) 09/2018 -- 01/2019 \
- Entwurf und Aufbau einer Hardware-in-the-Loop-Simulation für Lasercutter-Prototypen

== Persönliche Fähigkeiten
#chiline()

*Sprachen*: Deutsch: Muttersprache, Englisch: Fließend (TOEFL (IBT) (CEFR C1)), Spanisch: Grundkenntnisse (A2)

*Digitale Kompetenzen*: \
Microsoft Windows, GNU/Linux (Arch, Fedora, NixOS, Ubuntu), Microsoft Office (ECDL), LibreOffice, Git, Docker, Visual Studio Code, ROS/ROS2, Jira, Confluence, Tosca, Raspberry Pi, Arduino, RobotStudio, EPLAN, Siemens-TIA-Portal, LT-Spice, GeoGebra, Adobe, Gimp, PrusaSlicer, Grundkenntnisse in Netzwerktechnik

*Zertifikate*: ISTQB - Certified Tester Foundation Level, SolidWorks CSWA (Mechanical Design - Associate) \
*CAD-Kenntnisse*: SolidWorks, Onshape, FreeCAD, Grundkenntnisse in Blender \
*Programmierkenntnisse*: C, C++, Python, Rust, MATLAB, Nix, Simulink, LaTeX, Typst, Mikrocontroller \
*Führerschein*: Klasse B
