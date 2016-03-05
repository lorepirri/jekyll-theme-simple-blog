![Jekyll Version](https://img.shields.io/badge/Jekyll-3.1.2-red.svg)
![Build Status](https://gitlab.com/jekyll-themes/default-bundler/badges/master/build.svg)

----

View site: https://jekyll-themes.gitlab.io/default-bundler/

-----
# Theme: Jekyll 3 Default

## Original source:

This project was created with [Jekyll] 3.1.2 default template by running `jekyll new project` locally. 
After that, the project was pushed to this repository with the following configurations:

- Jekyll version: 3.1.2
- Build Jekyll with Bundler: `bundle exec jekyll build`
- GitLab CI config: [`.gitlab-ci.yml`]
- Gemfile: [`Gemfile`]
- Gitignore: [`.gitignore`]
- Jekyll config: [`_config.yml`](https://gitlab.com/jekyll-themes/default-bundler/blob/master/_config.yml)

## Building Jekyll with Bundler on GitLab

[Bundler] is a native dependency manager which ensures that all the `gems` your project needs will be loaded properly.

In order to build your Jekyll site with Bundler in your **GitLab Pages** projects, you will need to configure them properly to do so.

### GitLab CI configuration

- `.gitlab-ci.yml`

```yaml
# requiring the environment of Ruby 2.1.x
image: ruby:2.1

# add bundle cache to 'vendor' for speeding up builds
cache:
  paths: 
    - vendor/

before_script:
  - bundle install --path vendor

# the 'pages' job will deploy and build your site to the 'public' path
pages:
  stage: deploy
  script:
    - bundle exec jekyll build -d public/
  artifacts:
    paths:
      - public
  only:
    - master # this job will affect only the 'master' branch
```

### Gemfile configuration

- `Gemfile`

```ruby
source "https://rubygems.org"

gem 'jekyll', '3.1.2' # this is the Jekyll version we are working with
# gem 'nokogiri', '1.6.7.2'
```

_**Note:** Nokogiri is a dependency that might cause errors if it's not explicitly added to the script. If you face building errors, uncomment it._

### Jekyll configuration

- `_config.yml`

```yaml
---
# your settings

exclude: [vendor] # make sure to exclude 'vendor' from the build 

---
```

_**Note:** CI is configured to bundle all gems in the_ `vendor` _directory, 
which Jekyll will mistakenly read and explode on. That's why you need to exclude it on_ `_config.yml`.

You can also exclude `Gemfile` and `Gemfile.lock` from the builds. If you don't, they will be rendered to the public site folder.
To do that, replace the line

`exclude: [vendor]`

for

`exclude: [vendor, "Gemfile", "Gemfile.lock"]`

## How to test builds in all branches

### Create a Test `job`

If you want to build Jekyll with Bundler and also perform a `test` job to every branch except `master`, 
and also deploy your website from `master` branch, this is what you need to do to your GitLab-ci file:

- `.gitlab-ci.yml`

```yaml
image: ruby:2.1

cache:
  paths: 
    - vendor/

before_script:
  - bundle install --path vendor

# add a job called 'test'
test:
  stage: test
  script:
    - bundle exec jekyll build -d public/
  except:
    - master # the 'test' job will affect all branches expect 'master'

pages:
  stage: deploy
  script:
    - bundle exec jekyll build -d public/
  artifacts:
    paths:
      - public # only the job 'pages' will generate the artifacts (similar to your local '_site' folder)
  only:
    - master
```

### `Test` static site folder

You can also generate your site `artifacts` and download them when testing your builds. 
By doing so, you can check your site before merging your `test` branch with `master`.
They will NOT override the content of the `public` folder if you assign a different
folder to the `test` job. To do that, replace the [job `test`](#create-a-test-job) for the code below:


```yaml
# add a job called 'test' and assign a folder to store the static site
test:
  stage: test
  script:
    - bundle exec jekyll build -d test/ # replacing 'public' for 'test'
  artifacts:
    paths:
      - test # the 'test' job will generate a 'test/' folder containing your static site
  except:
    - master 
```

# Building locally

_**Note:** We assume you already have [Jekyll 3.1.2][jek-312] installed and up and running on your computer._

To work locally with this project, there are a few options. But let's keep it simple:

- Fork, clone or download this project
- Install [Bundler] if you don't have it already: `gem install bundler`
- Navigate to the folder where you cloned the project `cd path/to/project`
- Run `bundle install`
- Adjust [`_config.yml`] according to your project
- Serve Jekyll with bundler: `bundle exec jekyll serve`

[`.gitlab-ci.yml`]: https://gitlab.com/jekyll-themes/default-bundler/blob/master/.gitlab-ci.yml
[`Gemfile`]: https://gitlab.com/jekyll-themes/default-bundler/blob/master/Gemfile
[`.gitignore`]: https://gitlab.com/jekyll-themes/default-bundler/blob/master/.gitignore
[`_config.yml`]: https://gitlab.com/jekyll-themes/default-bundler/blob/master/_config.yml

[Bundler]: http://bundler.io/
[Jekyll]: http://jekyllrb.com/
[jek-312]: https://rubygems.org/gems/jekyll/versions/3.1.2