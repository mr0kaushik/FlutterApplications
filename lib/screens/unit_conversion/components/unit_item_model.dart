enum UnitItemType {
  BMI,
  AGE,
  DISCOUNT,
  PERCENTAGE,
  DATE,
  LENGTH,
  TEMPERATURE,
  WEIGHT,
  SPEED
}

class Model {
  final String path;
  final String title;
  final UnitItemType type;

  Model(this.path, this.title, this.type);
}
