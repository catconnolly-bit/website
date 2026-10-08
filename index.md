---
layout: page
title: Home
permalink: /
page_class: page-home
display_title: false
---

<section class="home-hero" style="--home-hero-image: url('{{ '/assets/images/home/aacaad_ec12c2267e9e4245b3b08d13c4c4df21~mv2_d_5568_3712_s_4_2.jpg' | relative_url }}');">
  <div class="home-hero__content">
    <h1 class="home-hero__title">REV. CATHERINE CONNOLLY</h1>
    <p class="home-hero__subtitle">Priest - Preacher - Pastor</p>
  </div>
</section>

<section class="home-copy">
  <div class="home-copy__lead prose">
    <p>I am an Episcopal priest serving in parish ministry, with a vocation shaped by the beauty of liturgy, attentive pastoral care, and collaborative leadership. At the heart of my ministry is a desire to help people discover their belovedness and grow into the fullness of who God has created them to be.</p>
    <p>My passion is to help others cultivate a deep joy grounded in a life-giving relationship with God: the joy of knowing we bear God’s image, are held in God’s love, and have gifts to share. I delight in recognising and nurturing those gifts, helping people grow in confidence and discover how they are called to contribute.</p>
    <p>Thankfulness sustains this joy in my own life. A bedrock of my faith and sense of wholeness, it shapes how I notice God’s presence and how I live and lead. The beauty and rhythms of Episcopal worship nourish me, and I feel called to create space for others to discover and deepen the practices and experiences that feed their souls.</p>
    <p>I believe the Church flourishes when we live our faith with joy, depth, and beauty, share responsibility for our life together, and encourage one another to grow into the fullness of who God calls us to be.</p>
  </div>
</section>

<section class="home-section home-section--spaced">
  <div class="narrow">
    <h2 class="home-section__title">Prayer &amp; Worship</h2>
    <div class="home-video">
      <iframe
        class="home-video__frame"
        src="https://www.youtube.com/embed/s5DBE0e2yiI"
        title="New Zealand Compline - Sunday"
        loading="lazy"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
        referrerpolicy="strict-origin-when-cross-origin"
        allowfullscreen
      ></iframe>
    </div>
    <p class="home-section__text">a version of Compline, also known as Night Prayer. A gentle, reflective service to bring a close to your day.</p>
    <div class="button-row" style="justify-content:center;">
      <a class="button" href="https://www.youtube.com/user/katycat49" target="_blank" rel="noreferrer noopener">Visit YouTube</a>
    </div>
  </div>
</section>

<script id="compline-videos" type="application/json">{{ site.data.compline | jsonify }}</script>
<script src="{{ '/assets/js/home-video.js' | relative_url }}" defer></script>

<section class="connect">
  <div class="narrow">
    <h2 class="connect__title">LET'S CONNECT</h2>
    <a class="connect__email" href="mailto:revcatconnolly@gmail.com">revcatconnolly@gmail.com</a>
  </div>
</section>
