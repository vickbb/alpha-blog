require 'test_helper'

class CategoriasControllerTest < ActionDispatch::IntegrationTest
  def setup
    @categoria = Categoria.create(nome: "Esportes")
  end

  test "deve pegar index de categorias" do
    get categorias_path
    assert_response :success
  end

  test "deve pegar new de categorias" do
    get new_categoria_path
    assert_response :success
  end

  test "deve pegar show de categorias" do
    get categoria_path(@categoria)
    assert_response :success
  end

end