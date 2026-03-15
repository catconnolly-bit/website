---
layout: page
title: Sermons
permalink: /writings/sermons/
nav_section: writings
---

{% assign entries = site.writings | where: "category", "Sermons" | sort: "date" | reverse %}

<section class="section section--tight">
  <div class="shell panel prose">
    <p>Sermons and homilies preached in parish ministry, gathered here as a local archive rather than a live Wix feed.</p>
  </div>
</section>

<section class="section section--tight">
  <div class="shell writing-grid">
    {% for entry in entries %}
      {% include writing-card.html entry=entry show_category=false %}
    {% endfor %}
  </div>
</section>
