(() => {
  const archive = document.querySelector('[data-writings-archive]');
  if (!archive) return;

  const search = archive.querySelector('#writings-search');
  const searchControls = archive.querySelector('.archive-search');
  const summary = archive.querySelector('.archive-summary');
  const more = archive.querySelector('.archive-more');
  const empty = archive.querySelector('.archive-empty');
  const clear = archive.querySelector('.archive-clear');
  const categoryLinks = Array.from(archive.querySelectorAll('.writings-filters a'));
  const noun = archive.dataset.noun || 'writings';
  const batchSize = 12;
  let limit = batchSize;
  let timer;

  // Decode entities left in migrated HTML before making a plain-text index.
  const entityNames = { amp: '&', quot: '"', apos: "'", nbsp: ' ', lt: '<', gt: '>', rsquo: "'", lsquo: "'", rdquo: '"', ldquo: '"', ndash: '-', mdash: '-' };
  const decodeEntities = text => text.replace(/&(#x[0-9a-f]+|#\d+|[a-z]+);/gi, (entity, value) => {
    if (value[0] !== '#') return entityNames[value.toLowerCase()] || entity;
    const code = value[1].toLowerCase() === 'x' ? parseInt(value.slice(2), 16) : parseInt(value.slice(1), 10);
    return code > 0 && code <= 0x10ffff ? String.fromCodePoint(code) : ' ';
  });
  const normalize = text => decodeEntities(text).normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase().replace(/['’‘]/g, '').replace(/[^\p{L}\p{N}]+/gu, ' ').trim();
  const entries = Array.from(archive.querySelectorAll('.archive-entry')).map(element => ({
    element,
    text: normalize(element.dataset.search || element.textContent)
  }));

  const queryFromUrl = new URL(window.location.href).searchParams.get('q');
  if (queryFromUrl !== null) search.value = queryFromUrl;

  function updateLinks(query) {
    categoryLinks.forEach(link => {
      const url = new URL(link.href);
      if (query) url.searchParams.set('q', query);
      else url.searchParams.delete('q');
      link.href = url.href;
    });
  }

  function render() {
    const query = search.value.trim();
    const terms = normalize(query).split(' ').filter(Boolean);
    const matches = entries.filter(entry => terms.every(term => entry.text.includes(term)));
    const visible = new Set(matches.slice(0, limit));
    entries.forEach(entry => { entry.element.hidden = !visible.has(entry); });
    more.hidden = matches.length <= limit;
    empty.hidden = matches.length !== 0;
    const count = Math.min(limit, matches.length);
    summary.textContent = query
      ? `Showing ${count} of ${matches.length} ${matches.length === 1 ? 'match' : 'matches'} for “${query}” · Newest first`
      : `Showing ${count} of ${entries.length} ${noun} · Newest first`;
    updateLinks(query);
    return matches;
  }

  function updateSearch() {
    limit = batchSize;
    render();
    const url = new URL(window.location.href);
    const query = search.value.trim();
    if (query) url.searchParams.set('q', query);
    else url.searchParams.delete('q');
    window.history.replaceState(null, '', url);
  }

  search.addEventListener('input', () => {
    updateLinks(search.value.trim());
    window.clearTimeout(timer);
    timer = window.setTimeout(updateSearch, 150);
  });
  clear.addEventListener('click', () => {
    window.clearTimeout(timer);
    search.value = '';
    updateSearch();
    search.focus();
  });
  more.addEventListener('click', () => {
    const previousLimit = limit;
    limit += batchSize;
    const matches = render();
    const firstNewEntry = matches[previousLimit];
    if (firstNewEntry) firstNewEntry.element.querySelector('.archive-entry__title a').focus();
  });

  render();
  searchControls.hidden = false;
})();
