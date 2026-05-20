# Data Modeling Rules

## Serialization
- Use `json_annotation` and `json_serializable`.
- Every model must have `fromJson` and `toJson` methods pointing to generated code.
- Example:
  ```dart
  @JsonSerializable()
  class MyModel {
    ...
    factory MyModel.fromJson(Map<String, dynamic> json) => _$MyModelFromJson(json);
    Map<String, dynamic> toJson() => _$MyModelToJson(this);
  }
  ```

## Code Generation
- After creating or modifying a model, run:
  `dart run build_runner build -d`
- Ensure the `part 'filename.g.dart';` directive is present.
