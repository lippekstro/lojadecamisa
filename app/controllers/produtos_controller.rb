class ProdutosController < ApplicationController
    
    before_action :set_produto, only: [:edit, :update, :destroy]
    
    def index
        @produtos = Produto.order :nome
    end

    def create
        @produto = Produto.new produto_params
        if @produto.save
            flash[:notice] = "Produto #{@produto.nome} salvo com sucesso"
            redirect_to root_url
        else
            renderiza :new
        end
    end

    def destroy
        if @produto.destroy
            flash[:notice] = "Produto #{@produto.nome} excluido com sucesso"
            redirect_to root_url
        else
            flash[:error] = "Produto #{@produto.nome} nao foi excluido"
            redirect_to root_url
        end
    end

    def edit
        renderiza :edit
    end

    def update
        if @produto.update produto_params
            flash[:notice] = "Produto #{@produto.nome} atualizado com sucesso"
            redirect_to root_url
        else
            renderiza :edit
        end
    end

    def busca
        @nome = params[:nome]
        @produtos = Produto.where "nome like ?", "%#{@nome}%"
    end

    def new
        @produto = Produto.new
        renderiza :new
    end

    private
    
    def renderiza(view)
        @departamentos = Departamento.all
        render view
    end

    def set_produto
        id = params[:id]
        @produto = Produto.find(id)
    end

    def produto_params
        params.require(:produto).permit :nome, :preco, :descricao, :quantidade, :departamento_id
    end

end
