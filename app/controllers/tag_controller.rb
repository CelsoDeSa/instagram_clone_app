class TagController < ApplicationController
  
  def index
    query = params[:q]
    query = query.chomp(" ").downcase
    @tags = ActsAsTaggableOn::Tag.where("tags.name LIKE ?", "%#{query}%")

	if @tags.empty?
		@tags = ActsAsTaggableOn::Tag.find_or_create_by_name_and_id(id: "#{query}", name: "#{query}")
	else 
		respond_to do |format|
	    	format.html
	        format.json { render json: @tags.collect{ |tag| {id: tag.name, name: tag.name } } }
		end
     end			
  end
end