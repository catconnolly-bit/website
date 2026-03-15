---
layout: page
title: Essays
permalink: /writings/essays/
nav_section: writings
---

{% assign entries = site.writings | where: "category", "Essays" | sort: "date" | reverse %}

<section class="section section--tight">
  <div class="shell panel prose">
    <p>Reflective prose rooted in theology, ministry, and everyday life.</p>
  </div>
</section>

<section class="section section--tight">
  <div class="shell writing-grid">
    {% for entry in entries %}
      {% include writing-card.html entry=entry show_category=false %}
    {% endfor %}
  </div>
</section>
