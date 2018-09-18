class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception

	def hello
		render html: "!Hola Meke¡"
	end

	def goodbye
		render html: "!Adios Meke¡"
	end
end
