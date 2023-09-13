class Contato {
  //Atributos que irão armazenar nome e telefone
  String nome;
  String telefone;

  Contato(this.nome, this.telefone);

  @override
  //construtor que ira exibir as informações sobre contato
  String toString() {
    return 'Nome: $nome, Telefone: $telefone';
  }
}
