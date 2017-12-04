require 'bundler/setup'

Bundler.require :default

@@counter = 0

get '/' do
  @@counter += 1
  haml :index
end

post '/reset' do
  @@counter = 0

  redirect '/', 303
end

__END__


@@ index
!!!
%html
  %head
    %meta{:charset => "utf-8"}/
    %title Habitat operator demo
    %link{:href => "css/style.css", :rel => "stylesheet", :type => "text/css"}/
    %link{:href => "images/favicon.ico", :rel => "shortcut icon", :type => "image/x-icon"}/
  %body
    .container
      %h1 Welcome to the Habitat operator demo app.
      .counter
        %h3 View count
        %p.count= @@counter
        %form{:action => "/reset", :method => "post"}
          %input.button{:type => "submit", :value => "Reset"}/
  %section.logos
    .habitat-logo
      %img{:alt => "Habitat logo", :src => "images/habitat-logo-by-chef.svg"}/
    .kubernetes-logo
      %img{:alt => "Kubernetes logo", :src => "images/kubernetes-logo.svg"}/
  %footer
    %img.habicat-jumping{:alt => "Habicat jumping", :src => "images/image-cat-jumping.svg"}/
    %img.habicat-set{:alt => "Habicat standing with package", :src => "images/image-cat-set.svg"}/
