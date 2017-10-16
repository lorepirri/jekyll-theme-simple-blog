---
#
# Here you can change the text shown in the Home page before the Latest Posts section.
#
# Edit jekyll-theme-simple-blog's home layout in _layouts instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
#
layout: home
permalink: /indice.html
header:
  image: /assets/img/home-header.jpg
tagline: > # this means to ignore newlines until "repository:"
  Scrivi una fantastica descrizione del tuo nuovo sito qui. Puoi modificare
  questa descritione nel file index-it.md. Apparira' anche nel head meta (per
  risultati di ricerche Google) e nella descrizione del sito nel feed.xml.
excerpt: >
  Scrivi una fantastica descrizione del tuo nuovo sito qui. Puoi modificare
  questa descritione nel file index-it.md. Apparira' anche nel head meta (per
  risultati di ricerche Google) e nella descrizione del sito nel feed.xml.
repository:
  is_project_page: true
  show_downloads: true
  repository_url: https://gitlab.com/lorepirri/jekyll-theme-simple-blog
  zip_url: https://gitlab.com/lorepirri/jekyll-theme-simple-blog/repository/master/archive.zip
  tar_url: https://gitlab.com/lorepirri/jekyll-theme-simple-blog/repository/master/archive.tar.gz  
ref: home
lang: it
---

Simple Blog Theme e' un tema pulito e responsive per Jekyll, con alcune funzionalitá social. Si ispira al tema Cayman Blog.

Questo tema ha tutto quello di cui avete bisogno per iniziare con un blog in Jekyll con nessuno sforzo: pagine, post, bottoni social, commenti, integrazione con pagina Facebook. É responsive quindi funziona su mobile.

Si puo' specificare una pagina Facebook associata al sito web, con funzionalita' di mirroring per i commenti.

{% include facebook-page-summary.html %}

Dai un'occhiata alla pagina Gitlab per maggiori informazioni.

Trovi questo testo nel file `indice.md`, puoi modificarlo, o rimuoverlo completamente, a seconda delle tue necessitá.

<h2>Articoli Recenti</h2>
<div>&nbsp;</div>
{% include list-category-posts.html lang=page.lang category="articles" %}

---

<h2>Ultimi 3 Progetti</h2>
<div>&nbsp;</div>
{% include list-category-posts.html lang=page.lang category="projects" max=3 %}
