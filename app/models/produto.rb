class Produto < ApplicationRecord

    belongs_to :departamento
    
    validates :nome, length: {minimum: 5}
    validates :descricao, presence: true
    validates :preco, presence: true
    validates :quantidade, presence: true
    validates :departamento, presence: true

end
