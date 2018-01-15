require 'test_helper'

class CategoriaTest < ActiveSupport::TestCase

  def setup
    @categoria = Categoria.new(nome: "Esportes")
  end

  test "categoria deve ser valida" do
    assert @categoria.valid?
  end

  test "nome deve estar presente" do
    @categoria.nome = " "
    assert_not @categoria.valid?
  end

  test "nome deve ser unico" do
    @categoria.save
    categoria2 = Categoria.new(nome: "Esportes")
    assert_not categoria2.valid?
  end

  test "nome não deve ser muito grande" do
    @categoria.nome = "a" * 26
    assert_not @categoria.valid?
  end

  test "nome não deve ser muito curto" do
    @categoria.nome = "aa"
    assert_not @categoria.valid?
  end
end