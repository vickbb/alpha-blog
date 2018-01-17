require 'test_helper'

class CreateCategoriasTest < ActionDispatch::IntegrationTest

  test "get new categoria form e criar categoria"  do
    get new_categoria_path
    assert_template 'categorias/new'
    assert_difference 'Categoria.count', 1 do
      post categorias_path, params: {categoria: {nome: "Esportes"}}
      follow_redirect!
    end
    assert_template 'categorias/index'
    assert_match "Esportes", response.body
  end

  test "categoria invalida resulta em falha" do
    get new_categoria_path
    assert_template 'categorias/new'
    assert_no_difference 'Categoria.count' do
      post categorias_path, params: {categoria: {nome: " "}}
    end
    assert_template 'categorias/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

end