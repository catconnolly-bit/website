---
layout: page
title: Writings
permalink: /writings/
nav_section: writings
display_title: false
---

{% assign writings = site.writings | sort: "date" | reverse %}

<section class="archive-shell">
  {% include writings-tabs.html current='all' %}
  <div class="writing-grid">
    {% for entry in writings %}
      {% include writing-card.html entry=entry %}
    {% endfor %}
  </div>
</section>
