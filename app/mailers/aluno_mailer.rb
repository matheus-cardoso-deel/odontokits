class AlunoMailer < ApplicationMailer
   default from: 'nao-responda@odontokits.ufrn.br'
   def receipt_email(feed)
  	@feed = feed
  	@kit = @feed.kit
    @aluno = @kit.aluno
    mail(to: @aluno.email, subject: 'Comprovante de Movimentação de Item - Setor de Esterelização')
  end
end
