Rails.application.routes.draw do

  	# Shortcut helper to add the via: [:get, :post] options to a match directive
	def gp_match(path, options={})
		match path, options.merge(via: [:get,:post])
	end

	root 'driver#index'




	gp_match 'driver',           to: 'driver#index',           as: 'driver_index'
end
