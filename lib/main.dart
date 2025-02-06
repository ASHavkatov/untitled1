class Phone {
  final String _brand, _model, _os;
  int _storageCapacity,
      _ramSize,
      _batteryCapacity,
      _warrantyYears,
      _manufacturingYear;
  double _price, _discountedPrice, _screenSize;
  bool _is5GEnabled;
  List<String> _features;

  Phone._raw({
    required String brand,
    required String model,
    required String os,
    required int storageCapacity,
    required int ramSize,
    required int batteryCapacity,
    required int warrantyYears,
    required int manufacturingYear,
    required double price,
    required double discountedPrice,
    required double screenSize,
    required bool is5GEnabled,
    required List<String> features,
  })  : _brand = brand,
        _model = model,
        _os = os,
        _storageCapacity = storageCapacity,
        _ramSize = ramSize,
        _batteryCapacity = batteryCapacity,
        _warrantyYears = warrantyYears,
        _manufacturingYear = manufacturingYear,
        _price = price,
        _discountedPrice = discountedPrice,
        _screenSize = screenSize,
        _is5GEnabled = is5GEnabled,
        _features = features;

  factory Phone({
    required String brand,
    required String model,
    required String os,
    required int storageCapacity,
    required int ramSize,
    required int batteryCapacity,
    required int warrantyYears,
    required int manufacturingYear,
    required double price,
    required double discountedPrice,
    required double screenSize,
    required bool is5GEnabled,
    required List<String> features,
  }) {
    _validatePrice(price);
    _validateBatteryCapacity(batteryCapacity);
    _validateDiscountedPrice(discountedPrice);
    _validateRamSize(ramSize);
    _validateYear(warrantyYears);
    _validateYear(manufacturingYear);
    _validateStorage(storageCapacity);
    return Phone._raw(
      brand: brand,
      model: model,
      os: os,
      storageCapacity: storageCapacity,
      ramSize: ramSize,
      batteryCapacity: batteryCapacity,
      warrantyYears: warrantyYears,
      manufacturingYear: manufacturingYear,
      price: price,
      discountedPrice: discountedPrice,
      screenSize: screenSize,
      is5GEnabled: is5GEnabled,
      features: features,
    );
  }

  factory Phone.fromMap(Map<String, dynamic> json) {
    return Phone._raw(
      brand: json["brand"],
      model: json["model"],
      os: json["os"],
      storageCapacity: json["storageCapacity"],
      ramSize: json["ramSize"],
      batteryCapacity: json["batteryCapacity"],
      warrantyYears: json["warrantyYears"],
      manufacturingYear: json["manufacturingYear"],
      price: json["price"],
      discountedPrice: json["discountedPrice"],
      screenSize: json["screenSize"],
      is5GEnabled: json["is5GEnabled"],
      features: List<String>.from(json["features"] ?? []),
    );
  }

  String get brand => _brand;
  String get model => _model;
  String get os => _os;
  int get storageCapacity => _storageCapacity;
  int get ramSize => _ramSize;
  int get batteryCapacity => _batteryCapacity;
  int get warrantyYears => _warrantyYears;
  int get manufacturingYear => _manufacturingYear;
  double get price => _price;
  double get discountedPrice => _discountedPrice;
  double get screenSize => _screenSize;
  bool get is5GEnabled => _is5GEnabled;
  List<String> get features => List.unmodifiable(_features); // Read-only list

  String getDetails() {
    return """
    Brand: $_brand
    Model: $_model
    OS: $_os
    Storage Capacity: $_storageCapacity GB
    RAM Size: $_ramSize GB
    Battery Capacity: $_batteryCapacity mAh
    Warranty Years: $_warrantyYears
    Manufacturing Year: $_manufacturingYear
    Price: \$_$_price
    Discounted Price: \$_$_discountedPrice
    Screen Size: $_screenSize 
    5G Enabled: $_is5GEnabled
    Features: ${_features.join(", ")}
    """;
  }

  void upgradeStorage(int newSize) {
    if (newSize > _storageCapacity) {
      _storageCapacity = newSize;
    } else {
      throw Exception("Yangi hotira hajmi oldingisidan katta bulishi shart");
    }
  }


  void applyDiscount(double discount){
    _discountedPrice=_discountedPrice*(1+discount/100);
  }
  void toggle5G(){
    _is5GEnabled=!_is5GEnabled;
  }

  String compareWith(Phone anotherPhone) {
    int thisScore = _ramSize + _storageCapacity;
    int otherScore = anotherPhone._ramSize + anotherPhone._storageCapacity;

    if (thisScore > otherScore) {
      return "$_brand $_model yaxshiroq.";
    } else if (thisScore < otherScore) {
      return "${anotherPhone._brand} ${anotherPhone._model} yaxshiroq.";
    } else {
      return "Ikkalasin ham kuchi teng";
    }
  }


  void  upgradeRam(int newRam){
    if(newRam<=_ramSize){
      throw Exception("Tezkor xotradan kata bulishi shart");
    }
    else{
      _ramSize=newRam;
    }
  }

  void addCustomFeature(String feature) {
    if (!_features.contains(feature)) {
      _features.add(feature);
    }
  }


  bool isLatestModel(){
    if(_manufacturingYear==2024) {return true;}
    return false;
  }


  static void _validatePrice(double price) {
    if (price <= 0) {
      throw Exception("Musbat son bulishi shart");
    }

  }

  static void _validateYear(int year) {
    if (year > 2026) {
      throw Exception("Boshlanmagan yilni kiritmang");
    }
  }

  static void _validateStorage(int storage) {
    if (storage < 16) {
      throw Exception("Xotira kamida 16 GB bulishi shart");
    }
  }

  static void _validateRamSize(int ramSize) {
    if (ramSize < 2) {
      throw Exception("Tezkor xotira kamida 2GB bulishi kerak");
    }
  }

  static void _validateDiscountedPrice(double discountedPrice) {
    if (discountedPrice <= 0) {
      throw Exception("Chegirma musbat bo‘lishi kerak");
    }
  }

  static void _validateBatteryCapacity(int batteryCapacity) {
    if (batteryCapacity < 1000) {
      throw Exception("Batareya hajmi kamida 1000mAh bo‘lishi kerak");
    }
  }
}

void main() {
  var features = ["Map","njnj","jjj","hn"];

  var phone = Phone(
    brand: "Iphone",
    model: "12 mini",
    os: "IOS",
    storageCapacity: 64,
    ramSize: 8,
    batteryCapacity: 3400,
    warrantyYears: 3,
    manufacturingYear: 2024,
    price: 250,
    discountedPrice: 180,
    screenSize: 5.3,
    is5GEnabled: true,
    features: features,
  );
  var phone2 = Phone(
    brand: "Iphone",
    model: "13 mini",
    os: "IOS",
    storageCapacity: 64,
    ramSize: 8,
    batteryCapacity: 4400,
    warrantyYears: 3,
    manufacturingYear: 2022,
    price: 200,
    discountedPrice: 180,
    screenSize: 5.3,
    is5GEnabled: true,
    features: features,
  );
  try {
    print(phone.compareWith(phone2));
  } catch (e) {
    print("nimadir $e");
  }

}