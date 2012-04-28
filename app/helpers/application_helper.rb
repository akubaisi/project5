module ApplicationHelper

def title
	base_title = "Generic party"
	if @title.nil?
		base_title
	else
		"#{base_title} | #{@title}"
	end
end

end
