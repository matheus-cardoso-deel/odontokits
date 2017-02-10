require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end
  
  test "should get root" do
    get '/'
    assert_response :success
    assert_select "title", "#{@base_title}"
  end
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get helf_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
end
  
  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
end

  test "should get contact" do
    get '/contact'
    assert_response :success
    assert_select "title", #Esse title é a tag HTML title, e não a variável :title que o método provide() manda
                           #em contact.html.erb, ou seja, ele verifica se a tag title tem o texto "Contact | base_title"
    "Contact | #{@base_title}"
  end

end
