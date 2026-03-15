---
layout: page
title: Poetry
permalink: /writings/poetry/
nav_section: writings
---

{% assign entries = site.writings | where: "category", "Poetry" | sort: "date" | reverse %}

<section class="section section--tight">
  <div class="shell panel prose">
    <p>Poems, reflections, and shorter lyric pieces preserved with their original formatting and imagery.</p>
  </div>
</section>

<section class="section section--tight">
  <div class="shell writing-grid">
    {% for entry in entries %}
      {% include writing-card.html entry=entry show_category=false %}
    {% endfor %}
  </div>
</section>
