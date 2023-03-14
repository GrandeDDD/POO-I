class Produto {
  double preco;
  String descricao;
  DateTime validade;

  Produto(this.preco, this.descricao, this.validade);

  static final cafe = Produto(5.0, 'Café', DateTime(2024, 12, 31));
  static final pao = Produto(3.0, 'Pão', DateTime(2024, 12, 31));
  static final leite = Produto(4.0, 'Leite', DateTime(2024, 12, 31));
}

class Item {
  int quantidade;
  //Iniciando o total com 0.0 para não usar "late", já que é estatico
  double total = 0.0;
  Produto produto;

  Item(this.quantidade, this.produto) {
    total = quantidade * produto.preco;
  }
}

class Venda {
  DateTime date;
  List<Item> items = [];
  //Mesmo motivo do total de item
  double total = 0.0;

  Venda(this.date, this.items) {
    total = items.map((item) => item.total).reduce((a, b) => a + b);
  }

  double get totalProdutos =>
      items.map((item) => item.produto.preco).reduce((a, b) => a + b);
}

void main() {
  // Create some example products
  var cafe = Produto(3.0, 'Café', DateTime(2023, 12, 31));
  var pao = Produto(2.0, 'Pão', DateTime(2023, 12, 31));
  var leite = Produto(4.0, 'Leite', DateTime(2023, 12, 31));

  var item1 = Item(2, cafe);
  var item2 = Item(3, pao);
  var item3 = Item(1, leite);

  var items = [item1, item2, item3];

  var venda = Venda(DateTime.now(), items);

  print('\nProdutos:');
  print(' ${cafe.descricao} - R\$ ${cafe.preco}');
  print(' ${pao.descricao} - R\$ ${pao.preco}');
  print(' ${leite.descricao} - R\$ ${leite.preco}');
  print(' Quantos itens diferentes: ${venda.items.length}');
  print(' Total dos produtos: R\$ ${venda.totalProdutos.toStringAsFixed(2)}');

  print('\nItens:');
  items.forEach((item) => print(
      ' ${item.quantidade}x ${item.produto.descricao}, total de R\$ ${item.total}'));

  print('\nVenda:');
  print(' Data: ${venda.date}');
  print(' Total da venda: R\$ ${venda.total.toStringAsFixed(2)}');
}