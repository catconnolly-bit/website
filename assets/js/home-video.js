(() => {
  const frame = document.querySelector('.home-video__frame');
  const data = document.getElementById('compline-videos');
  if (!frame || !data) return;

  // A snapshot of all three Compline playlists; update _data/compline.json
  // when videos are added or removed on YouTube.
  const videos = JSON.parse(data.textContent).flatMap(playlist => playlist.videos);
  if (!videos.length) return;

  const video = videos[Math.floor(Math.random() * videos.length)];
  frame.title = video.title;
  frame.src = 'https://www.youtube.com/embed/' + video.id;
})();
