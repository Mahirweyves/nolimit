module ApplicationHelper

  def has_role?(role)
    current_user && current_user.has_role?(role)
  end

	def gravatar_for(user, options = { size: 200})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "border-radius-50")
  end

  def markdown_to_html(text)
    Kramdown::Document.new(text).to_html
  end

  def product_author(product)
    user_signed_in? && current_user.id == product.user_id
  end

end
