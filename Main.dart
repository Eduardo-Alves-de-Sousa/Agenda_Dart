import 'dart:io';
import 'Agenda.dart';

void main() {
  //instância da class Agenda para armazenar na variavel minhaAgenda
  Agenda minhaAgenda = Agenda();
  //usada para ler as entradas do usuário
  var scanner = stdin;

  //loop infinito que irá executar a interface até que o usuário escolha sair
  while (true) {
    print("\nEscolha uma operação que deseja realizar:");
    print("1. Adicionar Contato");
    print("2. Remover Contato");
    print("3. Recuperar Contato");
    print("4. Listar Contatos");
    print("5. Atualizar Contato");
    print("6. Sair \n");

    var entrada = scanner.readLineSync();

    if (entrada == null || entrada.isEmpty) {
      print("Entrada inválida. Tente novamente.");
      continue;
    }

    var escolha = int.tryParse(entrada);

    if (escolha == null || escolha < 1 || escolha > 6) {
      print("Opção inválida. Escolha novamente.");
      continue;
    }

    switch (escolha) {
      case 1:
        print("Digite o nome do contato:");
        var nome = scanner.readLineSync();
        print("Digite o telefone do contato:");
        var telefone = scanner.readLineSync();
        minhaAgenda.adicionarContato(nome!, telefone!);
        print("Contato adicionado com sucesso.");
        break;
      case 2:
        print("Digite o nome do contato a ser removido:");
        var nomeRemover = scanner.readLineSync();
        var removido = minhaAgenda.removerContato(nomeRemover!);
        if (removido) {
          print("Contato removido com sucesso.");
        } else {
          print("Contato não encontrado.");
        }
        break;
      case 3:
        print("Digite o nome do contato a ser recuperado:");
        var nomeRecuperar = scanner.readLineSync();
        var contatoRecuperado = minhaAgenda.recuperarContato(nomeRecuperar!);
        // ignore: unnecessary_null_comparison
        if (contatoRecuperado != null) {
          print("Contato recuperado: $contatoRecuperado");
        } else {
          print("Contato não encontrado.");
        }
        break;
      case 4:
        print("Contatos na agenda:");
        minhaAgenda.listarContatos();
        break;
      case 5:
        print("Digite o nome do contato a ser atualizado:");
        var nomeAtualizar = scanner.readLineSync();
        print("Digite o novo telefone:");
        var novoTelefone = scanner.readLineSync();
        minhaAgenda.atualizarContato(nomeAtualizar!, novoTelefone!);
        break;
      case 6:
        print("Saindo da agenda.");
        return;
    }
  }
}
