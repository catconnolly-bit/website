---
layout: page
title: Sermons
permalink: /writings/sermons/
nav_section: writings
display_title: false
---

{% assign entries = site.writings | where: "category", "Sermons" | sort: "date" | reverse %}

<section class="archive-shell">
  {% include writings-tabs.html current='sermons' %}
  <div class="writing-grid">
    {% for entry in entries %}
      {% include writing-card.html entry=entry %}
    {% endfor %}
  </div>
</section>
