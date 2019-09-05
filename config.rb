###
# Page options, layouts, aliases and proxies
###

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

# Autoprefixer setup, uses same options as
# https://github.com/postcss/autoprefixer#browsers
activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  #blog.prefix = 'blog'

  # blog.permalink = "posts/{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  blog.sources = "posts/{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  blog.layout = 'layouts/layout'
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = 'tag.html'
  blog.calendar_template = 'calendar.html'

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
  activate :sprockets
  # activate :syntax, :line_numbers => true
  activate :directory_indexes
  activate :search_engine_sitemap
  # activate :deploy do |deploy|
  #   deploy.deploy_method = :git
  #   # Optional Settings
  #   # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
  #   deploy.branch   = 'master' # default: gh-pages
  #   # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  #   # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
  #   deploy.build_before = true
  # end
end

# Build-specific configuration
configure :build do
  activate :sprockets
  # Minify CSS on build
  activate :minify_css
  # Minify Javascript on build
  activate :minify_javascript
  # activate :syntax, :line_numbers => true
  activate :directory_indexes
  activate :search_engine_sitemap
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'master'
  deploy.build_before = true
end
