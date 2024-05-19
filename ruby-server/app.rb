require 'sinatra/base'
require 'json'
require 'rest-client'

class App < Sinatra::Base

  set :port, 9000

  before do
    headers['Access-Allow-Control-Methods'] = ['GET','POST']
    headers['Access-Allow-Control-Origin'] = '*'
  end

  get '/home' do
    view_response = RestClient.get('http://localhost:3000/view')

    data_response = RestClient.get('http://localhost:5000/data')
    data = JSON.parse(data_response.body)

    html_content = view_response.body.gsub('{{titulo}}', data['titulo'])
    html_content.gsub!('{{listaNotificaciones}}', data['notificaciones'].map { |notif| "<li>#{notif}</li>" }.join)

    content_type 'text/html'
    return html_content
  end

end

App.run! if __FILE__ == $0
