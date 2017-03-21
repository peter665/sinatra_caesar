require 'sinatra'
require 'sinatra/reloader'

def caesar_cipher str, n
  letters = ('a'..'z').to_a
  result = ""
  str.split("").each do |s|
    if s.match(/[a-zA-Z]/)
      index = letters.index(s.downcase).to_i+n.to_i
      index = index > letters.length-1 ? index - 26 : index
      result = result + letters[index]
    else
      result = result + s
    end
  end
  result
end

get '/' do
  erb :index
end

post '/' do
  @coded_text = caesar_cipher params['orig_text'], params['shift']
  erb :result, :locals => {:coded_text => @coded_text, :orig_text => params['orig_text'] }
end
