---
layout: page
title: Poetry
permalink: /writings/poetry/
nav_section: writings
display_title: false
---

{% assign entries = site.writings | where: "category", "Poetry" | sort: "date" | reverse %}

<section class="archive-shell">
  {% include writings-tabs.html current='poetry' %}
  <div class="writing-grid">
    {% for entry in entries %}
      {% include writing-card.html entry=entry %}
    {% endfor %}
  </div>
</section>
