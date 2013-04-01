class Confession
 	attr_accessible :content, :dislikes, :likes
 	

 	def initialize(attributes = {})
	    @content  = attributes[:content]
	    @likes = attributes[:likes]
	    @dislikes = attributes[:dislikes]
 	end

  def formatted_email
    "#{@content.to_s} has #{@likes.to_i} likes and #{@dislikes.to_i} dislikes."
  end
end