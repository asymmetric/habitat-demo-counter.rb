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
    %meta{charset: 'utf-8'}
    %meta{"http-equiv" => "content-type", content: "text/html; charset=UTF-8"}
    %title
      Habitat operator demo
    :css
      @import url('https://fonts.googleapis.com/css?family=Montserrat+Alternates|Titillium+Web');

      h1 {
          font-family: 'Montserrat Alternates', sans-serif;
          font-wieght: 400;
        font-size: 36px;
      }
      body {
          font-family: 'Titillium Web', sans-serif;
        background-color: rgb(40,60,76);
        color: rgb(255,255,255);
        text-align:center;
        font-size: 16px;
      }

      .container {
        width: 500px;
        margin-top: 60px;
        margin-right: auto;
        margin-left: auto;
      }

      .counter {
         width: 400px;
          margin-right: auto;
        margin-left: auto;
      }

      h3 {
        font-weight: 100;
        font-size: 25pt;
        margin: 2pt;
      }

      p {
        margin: 0;
        font-size: 70pt;
      }

      input {
        border: 2px;
        border-style: solid;
        padding: 10px;
        color: rgb(255,255,255);
        border-radius: 3px;
        width: 120px;
        background-color: rgba(0, 0, 0, 0);
        border-color: rgb(255, 144, 18);
        
        font-family: 'Titillium Web', sans-serif;
        font-size: 18pt;
      }
  %body
    .container
      %h1
        Hello from Habitat!
      .counter
        %h3
          View count:
          %span= @@counter
        %form{action: "/reset", method: "post"}
          %input{type: "submit", value: "reset"}
