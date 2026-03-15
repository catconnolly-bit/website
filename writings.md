---
layout: page
title: Writings
permalink: /writings/
nav_section: writings
---

{% assign writings = site.writings | sort: "date" | reverse %}
{% assign sermons = writings | where: "category", "Sermons" %}
{% assign poetry = writings | where: "category", "Poetry" %}
{% assign essays = writings | where: "category", "Essays" %}

<section class="section section--tight">
  <div class="shell panel prose">
    <p>This archive gathers the full writings collection currently published on the live site: sermons, poems, and essays, now migrated into local Jekyll pages with local media references.</p>
  </div>
</section>

<section class="section section--tight">
  <div class="shell category-grid">
    <article class="category-card">
      <p class="category-card__eyebrow">{{ sermons.size }} piece{% if sermons.size != 1 %}s{% endif %}</p>
      <h2 class="category-card__title">Sermons</h2>
      <p class="card__text">A selection of sermons and homilies preached at Church of England and Episcopal services.</p>
      <div class="button-row">
        <a class="button button--secondary" href="{{ '/writings/sermons/' | relative_url }}">Browse Sermons</a>
      </div>
    </article>
    <article class="category-card">
      <p class="category-card__eyebrow">{{ poetry.size }} piece{% if poetry.size != 1 %}s{% endif %}</p>
      <h2 class="category-card__title">Poetry</h2>
      <p class="card__text">Journaling poetry musings, whispers of God, and literary frolics.</p>
      <div class="button-row">
        <a class="button button--secondary" href="{{ '/writings/poetry/' | relative_url }}">Browse Poetry</a>
      </div>
    </article>
    <article class="category-card">
      <p class="category-card__eyebrow">{{ essays.size }} piece{% if essays.size != 1 %}s{% endif %}</p>
      <h2 class="category-card__title">Essays</h2>
      <p class="card__text">Reflective prose rooted in theology, ministry, and lived faith.</p>
      <div class="button-row">
        <a class="button button--secondary" href="{{ '/writings/essays/' | relative_url }}">Browse Essays</a>
      </div>
    </article>
  </div>
</section>

<section class="section section--tight">
  <div class="shell">
    <div class="archive-heading">
      <h2 class="section-title">Recent Writings</h2>
      <div class="archive-links">
        <a href="#sermons">Sermons</a>
        <a href="#poetry">Poetry</a>
        <a href="#essays">Essays</a>
      </div>
    </div>
    <div class="writing-grid">
      {% for entry in writings limit: 6 %}
        {% include writing-card.html entry=entry %}
      {% endfor %}
    </div>
  </div>
</section>

<section class="section section--tight" id="sermons">
  <div class="shell archive-stack">
    <section class="archive-section">
      <div class="archive-section__header">
        <h2 class="archive-section__title">Sermons</h2>
        <a class="archive-section__more" href="{{ '/writings/sermons/' | relative_url }}">View all</a>
      </div>
      <div class="writing-grid writing-grid--compact">
        {% for entry in sermons %}
          {% include writing-card.html entry=entry %}
        {% endfor %}
      </div>
    </section>
  </div>
</section>

<section class="section section--tight" id="poetry">
  <div class="shell archive-stack">
    <section class="archive-section">
      <div class="archive-section__header">
        <h2 class="archive-section__title">Poetry</h2>
        <a class="archive-section__more" href="{{ '/writings/poetry/' | relative_url }}">View all</a>
      </div>
      <div class="writing-grid writing-grid--compact">
        {% for entry in poetry %}
          {% include writing-card.html entry=entry %}
        {% endfor %}
      </div>
    </section>
  </div>
</section>

<section class="section section--tight" id="essays">
  <div class="shell archive-stack">
    <section class="archive-section">
      <div class="archive-section__header">
        <h2 class="archive-section__title">Essays</h2>
        <a class="archive-section__more" href="{{ '/writings/essays/' | relative_url }}">View all</a>
      </div>
      <div class="writing-grid writing-grid--compact">
        {% for entry in essays %}
          {% include writing-card.html entry=entry %}
        {% endfor %}
      </div>
    </section>
  </div>
</section>
