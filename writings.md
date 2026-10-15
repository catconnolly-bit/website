---
layout: page
title: Writings
permalink: /writings/
nav_section: writings
page_class: page-writings
display_title: false
---

{% assign writings = site.writings | sort: "date" | reverse %}

<section class="writings-landing shell">
  <h1 class="writings-heading">Writings</h1>
  <p class="writings-intro">Sermons, essays, and poetry. Reflections on faith and everyday life.</p>
  <div class="writings-doorways">
    {% for category in site.data.writing_categories %}
      {% assign category_url = '/writings/' | append: category.slug | append: '/' %}
      {% assign selections = writings | where: 'category', category.label %}
      {% if category.featured %}
        {% assign selections = selections | where_exp: 'entry', 'category.featured contains entry.slug' %}
      {% endif %}
      <section class="writings-doorway" aria-labelledby="category-{{ category.slug }}">
        <a class="writings-category" href="{{ category_url | relative_url }}">
          <img src="{{ category.image | relative_url }}" alt="" width="600" height="360" decoding="async">
          <h2 id="category-{{ category.slug }}">{{ category.label }}</h2>
          <p>{{ category.description }}</p>
        </a>
        <div class="writings-selections">
          <p class="writings-eyebrow">From the collection</p>
          {% for entry in selections limit: 2 %}
            {% assign image_variant = site.data.image_variants[entry.image] %}
            {% assign thumbnail = image_variant.thumbnail | default: entry.image %}
            <article class="writings-selection">
              <a class="writings-selection__photo" href="{{ entry.url | relative_url }}" aria-label="{{ entry.title | escape }}">
                <img src="{{ thumbnail | relative_url }}" alt="" width="54" height="66" loading="lazy" decoding="async">
              </a>
              <div>
                <h3><a href="{{ entry.url | relative_url }}">{{ entry.title | escape }}</a></h3>
                <p><time datetime="{{ entry.date | date: '%Y-%m-%d' }}">{{ entry.date | date: '%B %Y' }}</time></p>
              </div>
            </article>
          {% endfor %}
        </div>
        <a class="writings-browse" href="{{ category_url | relative_url }}">View all {{ category.label | downcase }} <span aria-hidden="true">→</span></a>
      </section>
    {% endfor %}
  </div>
  <p class="writings-all"><a class="writings-browse" href="{{ '/writings/all/' | relative_url }}">Browse all writings <span aria-hidden="true">→</span></a></p>
</section>
