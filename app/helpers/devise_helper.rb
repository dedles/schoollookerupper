module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?
        
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved', count: resource.errors.count,
      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
	    <div id="error-content" class="card-panel red lighten-4">
				<div class="row">
		      <a id="button-dismiss"class="btn-floating btn-medium center teal lighten-3"><i class="material-icons">not_interested</i></a>
		      <h5>#{sentence}</h5>
	    	</div>
	      <div class="row">
		      <div class="col s4">
			      #{messages}
		      </div>
	      </div>
	    </div>
    HTML

    html.html_safe
  end
end