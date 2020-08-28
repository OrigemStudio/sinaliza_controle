class ProductValidator {

  String validadeImages(List images){
    if(images.isEmpty) return "Adicione imagens do produto.";
    return null;
  }

  String validateTitle(String text){
    if(text.isEmpty) return "O campo do título está vazio!";
    return null;
  }

  String validateDescription(String text) {
    if(text.isEmpty) return "O campo da descrição do produto, está vazio!";
    return null;
  }

  String validatePrice(String text) {
    double price = double.tryParse(text);
    if(price != null){
      if(!text.contains(".") || text.split(".")[1].length !=2)
        return "Utilize duas casa decimais";
    } else {
      return "Preço inválido";
    }
    return null;
  }

}