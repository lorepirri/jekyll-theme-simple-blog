---
#
# Here you can change the text shown in the Home page before the Latest Posts section.
#
# Edit jekyll-theme-simple-blog's home layout in _layouts instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
#
layout: home
permalink: /index.html
header:
  image: /assets/img/home-header.jpg
tagline: > # this means to ignore newlines until "repository:"
  Write an awesome description for your new site here. You can edit this
  line in index.md. It will appear in your document head meta (for
  Google search results) and in your feed.xml site description.
excerpt: >
  Write an awesome description for your new site here. You can edit this
  line in index.md. It will appear in your document head meta (for
  Google search results) and in your feed.xml site description.
repository:
  is_project_page: true
  show_downloads: true
  repository_url: https://gitlab.com/lorepirri/jekyll-theme-simple-blog
  zip_url: https://gitlab.com/lorepirri/jekyll-theme-simple-blog/repository/master/archive.zip
  tar_url: https://gitlab.com/lorepirri/jekyll-theme-simple-blog/repository/master/archive.tar.gz
ref: home
lang: en
---

Simple Blog Theme is a clean, responsive blogging theme for Jekyll, with social features. It is inspired by the Cayman Blog Theme.

This theme has all you need to start today blogging with Jekyll, and no effort: pages, posts, few social buttons. Try loading this on mobile too.

It has already a Facebook Page associated with it, which gathers all the interactions.

{% include facebook-page-summary.html %}

Have a look at the Github page for more information.

You find this descriptive text in the `index.md` file, so you can change it, or remove it completely, according to your needs.

<h2>Latest Articles</h2>
<div>&nbsp;</div>
{% include list-category-posts.html lang=page.lang category="articles" %}

---

<h2>Latest 3 Projects</h2>
<div>&nbsp;</div>
{% include list-category-posts.html lang=page.lang category="projects" max=3 %}
