require 'test_helper'

class AlunosControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end
  
  test "should get index" do
    log_in_as(@user)
    get '/alunos'
    assert_template 'alunos/index'
    assert_select 'div.pagination'
    first_page_of_alunos = Aluno.paginate(page: 1)
    first_page_of_alunos.each do |aluno|
      assert_select 'a[href=?]', aluno_path(aluno), text: aluno.nome
      assert_select 'a[href=?]', aluno_path(aluno), text: 'delete'
    end
    assert_response :success
  end

end
