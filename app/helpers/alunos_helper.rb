module AlunosHelper
  
      # Returns the Gravatar for the given aluno.
  def gravatar_for_aluno(aluno, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(aluno.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: aluno.nome, class: "gravatar")
  end
  
end
