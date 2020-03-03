class Device {
  String deviceId;
  String model;
  String encryptionKey;
  String owner;
  List<String> users;

  Device(
      {this.deviceId, this.model, this.encryptionKey, this.owner, this.users});

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      deviceId: json['deviceId'],
      model: json['model'],
      encryptionKey: json['encryptionKey'],
      owner: json['owner'],
      users: json['users'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deviceId'] = this.deviceId;
    data['model'] = this.model;
    data['encryptionKey'] = this.encryptionKey;
    data['owner'] = this.owner;
    data['users'] = this.users;
    return data;
  }
}
