#import "pii_en.typ": *

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

== Education
#chiline()

*Master of Science in Robotics, Cognition, Intelligence* @ TU Munich #h(1fr) 04/2020 -- 05/2023 \
- Master's thesis: Comparison of Controllers for Trunk Stabilization in a Bipedal Robot #h(1fr) ISCED 7 \

*Bachelor of Science in Engineering (Mechatronics/Robotics)* @ UAS Technikum Wien #h(1fr) 09/2016 -- 06/2019 \
- Bachelor's thesis: Design and Construction of a Delta Robot to Study Inverse Kinematics #h(1fr) ISCED 6 \

*Civilian service* @ Hof Feichtlgut, Ohlsdorf #h(1fr) 07/2015 -- 05/2016 \
*General qualification for university entrance* @ Bundesrealgymnasium Gmunden #h(1fr) 09/2007 -- 06/2015

== Work Experience
#chiline()

*PDTS GmbH - Member of the Frequentis Group* \
DevOps Engineer in the aviation safety sector #h(1fr) 09/2025 -- dato \
- System integration in the test lab, automation of deployments \
- Monitoring and operation of complex systems in collaboration with international development teams

*Magazino GmbH - a Jungheinrich company* \
DevOps Engineer #h(1fr) 03/2025 -- 09/2025 \
- Supporting company-wide migration from Ubuntu to NixOS \
- Contributing to reproducible infrastructure and CI/CD with Nix tooling

Robotics QA Engineer #h(1fr) 07/2024 -- 03/2025 \
- Set up production robots and conducted EOL tests \
- Investigated issues in collaboration with dev and production teams

Solution Support Engineer #h(1fr) 07/2023 -- 07/2024 \
- Monitored field robots, handled first-line support and Jira-based service \
- Coordinated service trips, trained staff, and standardized testing and documentation

*Robotise AG* #h(1fr) 01/2020 -- 08/2022 \
Working Student in R&D and QA \
- Supported mobile autonomy, robot testing, and field support \
- Worked with Python, C++, ROS; assisted in CAD and customer onboarding

*Trotec GmbH (Internship)* #h(1fr) 09/2018 -- 01/2019 \
- Designed and built a hardware-in-the-loop simulation for laser cutter prototypes

== Personal skills
#chiline()

*Languages*: German: native, English: fluent (TOEFL (IBT) (CEFR C1)), Spanish: basic (A2)

*Digital competences*: \
Microsoft Windows, GNU/Linux (Arch, Fedora, NixOS, Ubuntu), Microsoft Office (ECDL), LibreOffice, Git, Docker, Visual Studio Code, ROS/ROS2, Jira, Confluence, Tosca, Raspberry Pi, Arduino, RobotStudio, EPLAN, Siemens-TIA-Portal, LT-Spice, GeoGebra, Adobe, Gimp, PrusaSlicer, Basic knowledge of networking

*Certificates*: ISTQB - Certified Tester Foundation Level, SolidWorks CSWA (Mechanical Design - Associate) \
*CAD Knowledge*: SolidWorks, Onshape, FreeCAD, Basic knowledge of Blender \
*Programming skills*: C, C++, Python, Rust, MATLAB, Nix, Simulink, LaTeX, Typst, Microcontroller \
*Driving License*: Category B
