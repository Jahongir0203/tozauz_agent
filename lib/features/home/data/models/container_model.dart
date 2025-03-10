class ContainerModel{
  final String title, price, currency, simModul, address, daromad;
  final int status;

  ContainerModel({required this.title, required this.price, required this.currency, required this.simModul, required this.address, required this.daromad, required this.status});
}

List<ContainerModel> containerList = [
  ContainerModel(
    title: "Smart Container A1",
    price: "1200",
    currency: "USD",
    simModul: "4G LTE",
    address: "Tashkent, Uzbekistan",
    daromad: "500 USD/month",
    status: 1,
  ),
  ContainerModel(
    title: "Cold Storage C2",
    price: "1500",
    currency: "USD",
    simModul: "5G",
    address: "Samarkand, Uzbekistan",
    daromad: "650 USD/month",
    status: 0,
  ),
  ContainerModel(
    title: "Standard Warehouse B4",
    price: "800",
    currency: "USD",
    simModul: "3G",
    address: "Namangan, Uzbekistan",
    daromad: "400 USD/month",
    status: 1,
  ),
  ContainerModel(
    title: "Premium Storage X5",
    price: "2000",
    currency: "USD",
    simModul: "5G",
    address: "Bukhara, Uzbekistan",
    daromad: "900 USD/month",
    status: 1,
  ),
  ContainerModel(
    title: "Eco Container E7",
    price: "1100",
    currency: "USD",
    simModul: "4G LTE",
    address: "Fergana, Uzbekistan",
    daromad: "450 USD/month",
    status: 0,
  ),
];
