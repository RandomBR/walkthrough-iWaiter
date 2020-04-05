//slider data

class SliderModel{

  String imagePath;
  String title;
  String desc;

  SliderModel({this.imagePath, this.title, this.desc});

  void setImageAssetPath(String getImagePath){
    imagePath = getImagePath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc =  getDesc;
  }

  String getImageAssetPath(){
    return imagePath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }
}

List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();


  //1
  sliderModel.setImageAssetPath("assets/print1.png");
  sliderModel.setTitle("Bem-vindo(a)");
  sliderModel.setDesc("  Este é o iWaiter, o aplicativo que veio trazer praticidade, disponibilizando de forma digital a comanda do bar em que você está.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setImageAssetPath("assets/print2.png");
  sliderModel.setTitle("Login e cadastro");
  sliderModel.setDesc("  Para usufruir totalmente do aplicativo, recomendamos que faça login. Caso não tenha conta, pode criar uma nova em poucos passos!");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setImageAssetPath("assets/print3.png");
  sliderModel.setTitle("Escolha de itens");
  sliderModel.setDesc("  Você poderá escolher o seu item desejado pesquisando por ele, listando pelas categorias ou até mesmo pode aproveitar e escolher um item que está de promoção no bar, caso queira.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //4
  sliderModel.setImageAssetPath("assets/print4.png");
  sliderModel.setTitle("Informações do item");
  sliderModel.setDesc("  Ao selecionar um item, irá abrir uma tela contendo informações detalhadas sobre o item escolhido, como: valor, nome, avaliação dos usuários e a opção de adicionar ao pedido.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //5
  sliderModel.setImageAssetPath("assets/print5.png");
  sliderModel.setTitle("Pagamento");
  sliderModel.setDesc("  Quando quiser finalizar o pedido, poderá efetuar o pagamento pelo aplicativo, caso desejar.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //6
  sliderModel.setImageAssetPath("assets/print6.png");
  sliderModel.setTitle("Avaliação");
  sliderModel.setDesc("  No final do consumo, poderá avaliar tanto os itens que pediu do cardápio, quanto o próprio restaurante em que esteve.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
  
}