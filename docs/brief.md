# Astral Spatial — positioning brief

Status: approved by Andrew, 2026-11-23.

## What the business is

A New York studio that designs spatial audio as creative work, and builds the
systems that carry it. Two halves, deliberately unequal on the site:

- **Creative.** Spatialized sound design, interactive programming, adapting
  existing works into spatial formats. This leads.
- **Systems.** Control logic, room tuning, system architecture, and the
  workflows that make a room usable by someone who did not build it. Q-SYS
  programming, ambisonic templating, Dante routing. Ambisonics, wave field
  synthesis, Dolby Atmos, ambisonic decoding. This supports.

- **Fabrication.** Custom speaker installations, built as art rather than
  specified from a catalogue. Custom speakers, custom haptics, custom
  acoustic and electroacoustic instruments, and the enclosures for them.

The systems work is technical but not magical. The creative work is the
magic, and it is the harder thing to find anywhere else. The site leads with
the magic and lets the technical credibility sit underneath it.

The systems half is the logic and the artist-facing workflow, often running
on hardware someone else already installed. Where there is a physical
install, it is bespoke.

## Who it is for

The site is pitched at one buyer and positioned so the rest arrive on their
own.

**Primary: galleries, museums, and public art.** High-end art world. The
ambition for the coming year is one large gallery or public art commission.
Everything about the site should read as though it belongs in that world.

**Secondary, arriving from that position:** immersive venues and experiences,
artists and labels, commercial and retail spaces, and individuals.

These are not separate audiences to be served with separate pitches. The art
world framing is the filter. If the site reads right to a curator, the
immersive venue and the label will read it as a step up rather than a step
sideways.

## Proof

Four work records. Selection and wording are the team's call; the design
holds the slots.

- **Reforesters Laboratory, Williamsburg.** Complete, and the only finished
  project, so it carries the weight. Spelling confirmed against
  `reforesters.io`. A listening room and adaptogen cafe; its own site
  describes the room as 24.2 channel.

  The scope was software, not hardware. Astral Spatial did not design the
  physical system. It built the control logic and tuned the room: Q-SYS
  programming, ambisonic templating, and the signal path that takes a visiting
  artist from a laptop into an Allen & Heath SQ-5, over Dante, through the
  d&b audiotechnik amplifiers.

  The deliverable was a workflow. An artist arrives with their own work and
  can play it in ambisonics without an engineer rebuilding the room for them.
  That is the thing worth saying, and it is the half of the business that is
  hardest to buy anywhere else.

- **A custom speaker installation, in progress.** The client cannot be named
  yet. It is the first project where the physical build is Astral Spatial's
  own, and it is the proof that the fabrication offering is real rather than
  aspirational. It gets a placeholder on the site now and a name when it can
  be published.

- **MoFE.** Andrew Fox designed the system, Jupiter Sound executed it, Chloe
  Alexandra Thompson tuned it and refined sound design within it.

- **An anechoic chamber in Detroit.** Chloe Alexandra Thompson and Michael
  Amacio, within the last year. Details to be confirmed by the team.

- Further projects in development, unnamed until they can be shown.

- **The individual CVs.** This is the strongest proof the business has. All
  three have done significant work elsewhere, and the current site's bios
  carry the specifics: a 32–148 speaker array specialist and Max Certified
  Trainer who presented to the AES on wave field synthesis; a Dolby Atmos mix
  engineer and former MoFE audio director with commercial label credits; a
  touring production manager and live engineer with Philip Glass Ensemble and
  *32 Sounds* credits.
- The existing client list, which belongs to the people rather than the
  agency and should be framed accordingly.

The bio text is kept. The headshots are kept.

### Credit line

Every work record carries a credit line as a fixed field, so the design
reserves room for it on all records. Who appears on which line, and the
wording, is the team's call during the copy pass.

## Tone and design direction

Minimalist, high-end, art world. Thin line as the organising device. Some
motion, some interactivity, some mystery, some playfulness. Restraint over
decoration.

Four references, and what each one contributes:

| Reference | Take this | Leave this |
|---|---|---|
| **other-people.net** | The overall favourite. Light ground, hairline diagrams used as navigation, catalogue numbering as structure, condensed grotesque type, nothing explained before it is encountered | Near-total absence of motion |
| **ashley.systems** | Use of line, literally — glowing tubes as the only image, hairline frames, grain, darkness, a technical register that stays mysterious | Its current unfinished state |
| **publicrecords.nyc** | Typography. Full-bleed layout. Images passing under text. Panels sliding out from the right edge | Mouse-tracked parallax on the images. Dizzying. Too much interactivity |
| **blankforms.org** | Gallery register, editorial calm, parenthetical category labels, confident use of a serif | Static to the point of inert |

The common thread across all four is thin line, generous space, small type,
and no resemblance whatsoever to a startup landing page.

### Ground: light, decided

Both grounds were built and reviewed on staging on 2026-11-23. Light wins. It
reads better, it feels more spacious, and it matches the references. The dark
build felt cramped. Ground is `#EDEBE6` and the site is a single light theme.

A user-switchable dark mode is a possible later addition, not part of this
build.

### Three directions carried forward

- **A thin frame.** A 1–2px rule framing the site itself, not just its
  sections. The frame may carry the array plot's geometry rather than being a
  plain rectangle.
- **A repeated motif.** The spatial geometry of the array plot, reduced to a
  small mark that recurs as a section separator and as an icon. Other People's
  eye is the model: one small shape, used often enough to become the site's
  signature, never explained.
- **Layering.** Text passing over and under imagery, as on publicrecords.nyc,
  at mobile width as well as desktop. The layered effect is wanted; the
  mouse-tracked parallax that produced it there is not.
- **The cursor is the mark.** On pointer devices, replace the default cursor
  with the mark. Desktop only — there is no cursor on a phone, so the site
  cannot depend on it for anything.
- **Sound objects moving through the field.** The array plot is a
  three-dimensional field and the mark is its axes. Motion means objects
  travelling through that field: points moving along paths, not elements
  sliding in. This is where the site's motion budget is spent.

### Notes from the 2026-11-24 desktop review

- **Rules pass over text, text is never masked.** A hairline crossing a line
  of type should cross it. The opaque knockout that punches the rule out
  behind the text is wrong and comes out. This is the layered effect from
  publicrecords.nyc: things overlap and both remain visible.
- **Broken text lines.** Wrapping and line breaks are failing in several
  places. Every block gets checked at both widths.
- **The hero needs motion.** Sound objects travelling through the XYZ field,
  in the manner of a Dolby Atmos renderer display: a sphere carrying a
  number, moving on the plane. A greyed version of the axis mark changing
  scale, several at once, is an acceptable simpler form. The hero is the one
  place on the site that moves on its own.
- **Scroll interactivity, mobile included.** Not a desktop-only flourish.
- **Placeholder copy must look like placeholder.** "Project description goes
  here lorem ipsum", not plausible prose. Nobody should mistake a stand-in
  for a draft.
- **More line art and graphic, less brochure.** The balance is currently too
  far toward paragraphs in columns. Drawn elements carry more of the page.

Installation photography warms the site later, once it exists. The design
must work before it arrives and improve when it does.

## Call to action

Email. One address, clickable, repeated.

Not a booking link and not a calendar. Work gets vetted and scoped before a
call happens, and handing a stranger a calendar slot inverts that.

The address must survive bots. The site has drawn automated contact before,
and `info [at] astralspatial.com` as unlinked plain text is the wrong fix: it
defeats scrapers by also defeating every person on a phone. The replacement
has to be clickable for a human and uninteresting to a scraper.

## Must-keep

- The bio text, in substance.
- The three headshots.
- `info@astralspatial.com` as the contact route.

Everything else in the current design is replaceable.

## Corrections carried forward

| Item | Action |
|---|---|
| "Alanis Morisette" | Misspelled live. Correct is Morissette |
| `chloe.jpg` at 239KB | Six times the other portraits. Recompress |
| No favicon | Add |
| No `og:` or `twitter:` tags | Add. Shared links currently render bare |
| Contact unclickable | Replace per the call to action above |
| `nginx-astralspatial.conf` port 80 only | Correct as written. TLS terminates at Cloudflare |

## Who is not on the site

Astral Spatial is three people: Andrew Fox, Chloe Alexandra Thompson, and
Michael Amacio.

Cam Finley is a collaborator, not a member. He runs his own agency and
Astral Spatial works with him on fabrication. He gets no bio, no section, and
no billing as part of the team.

A friends and collaborators section is a later addition, once there is more
than one name to put in it and finished work to attach them to. The
information architecture should leave room for it without building it now.
