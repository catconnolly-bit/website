---
layout: page
title: Essays
permalink: /writings/essays/
nav_section: writings
display_title: false
---

{% assign entries = site.writings | where: "category", "Essays" | sort: "date" | reverse %}

<section class="archive-shell">
  {% include writings-tabs.html current='essays' %}
  <div class="writing-grid">
    {% for entry in entries %}
      {% include writing-card.html entry=entry %}
    {% endfor %}
  </div>
</section>
