import 'Contato.dart';

class Agenda {
  List<Contato> contatos = [];

  void adicionarContato(String nome, String telefone) {
    Contato novoContato = Contato(nome, telefone);
    contatos.add(novoContato);
  }

  bool removerContato(String nome) {
    Contato? contatoEncontrado = recuperarContato(nome);
    // ignore: unnecessary_null_comparison
    if (contatoEncontrado != null) {
      contatos.remove(contatoEncontrado);
      return true;
    } else {
      return false;
    }
  }

  Contato? recuperarContato(String nome) {
    for (Contato contato in contatos) {
      if (contato.nome == nome) {
        return contato;
      }
    }
    return null; // Retorna null se o contato não for encontrado
  }

  void listarContatos() {
    for (Contato contato in contatos) {
      print(contato);
    }
  }

  void atualizarContato(String nome, String novoTelefone) {
    Contato? contato = recuperarContato(nome);
    // ignore: unnecessary_null_comparison
    if (contato != null) {
      contato.telefone = novoTelefone;
    } else {
      print("Contato não encontrado.");
    }
  }
}
