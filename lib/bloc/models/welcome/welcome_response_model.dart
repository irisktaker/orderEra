class WelcomeResponseModel {
  bool? status;
  Data? data;
  String? message;
  String? requestId;

  WelcomeResponseModel({this.status, this.data, this.message, this.requestId});

  WelcomeResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    requestId = json['request_id'];
  }
}

class Data {
  List<Countries>? countries;
  AppVersion? appVersion;
  String? appIcon;
  String? appIconSelected;
  String? apiKey;
  String? userId;
  String? defaultAddressId;
  int? defaultAddressType;
  int? notificationCount;
  int? cartCount;
  PromotionPopup? promotionPopup;
  bool? requiredData;
  int? isBlocked;
  int? isVerified;
  int? loyaltyPoints;

  Data(
      {this.countries,
      this.appVersion,
      this.appIcon,
      this.appIconSelected,
      this.apiKey,
      this.userId,
      this.defaultAddressId,
      this.defaultAddressType,
      this.notificationCount,
      this.cartCount,
      this.promotionPopup,
      this.requiredData,
      this.isBlocked,
      this.isVerified,
      this.loyaltyPoints});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(Countries.fromJson(v));
      });
    }
    appVersion = json['app_version'] != null
        ? AppVersion.fromJson(json['app_version'])
        : null;
    appIcon = json['app_icon'];
    appIconSelected = json['app_icon_selected'];
    apiKey = json['apiKey'];
    userId = json['user_id'];
    defaultAddressId = json['default_address_id'];
    defaultAddressType = json['default_address_type'];
    notificationCount = json['notification_count'];
    cartCount = json['cart_count'];
    promotionPopup = json['promotion_popup'] != null
        ? PromotionPopup.fromJson(json['promotion_popup'])
        : null;
    requiredData = json['required_data'];
    isBlocked = json['is_blocked'];
    isVerified = json['is_verified'];
    loyaltyPoints = json['loyalty_points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (countries != null) {
      data['countries'] = countries!.map((v) => v.toJson()).toList();
    }
    if (appVersion != null) {
      data['app_version'] = appVersion!.toJson();
    }
    data['app_icon'] = appIcon;
    data['app_icon_selected'] = appIconSelected;
    data['apiKey'] = apiKey;
    data['user_id'] = userId;
    data['default_address_id'] = defaultAddressId;
    data['default_address_type'] = defaultAddressType;
    data['notification_count'] = notificationCount;
    data['cart_count'] = cartCount;
    if (promotionPopup != null) {
      data['promotion_popup'] = promotionPopup!.toJson();
    }
    data['required_data'] = requiredData;
    data['is_blocked'] = isBlocked;
    data['is_verified'] = isVerified;
    data['loyalty_points'] = loyaltyPoints;
    return data;
  }
}

class Countries {
  int? id;
  String? name;
  String? flag;
  String? currency;
  String? code;

  Countries({this.id, this.name, this.flag, this.currency, this.code});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    flag = json['flag'];
    currency = json['currency'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['flag'] = flag;
    data['currency'] = currency;
    data['code'] = code;
    return data;
  }
}

class AppVersion {
  DeviceVersion? versionAndroid;
  DeviceVersion? versionIos;

  AppVersion({this.versionAndroid, this.versionIos});

  AppVersion.fromJson(Map<String, dynamic> json) {
    versionAndroid = json['version_android'] != null
        ? DeviceVersion.fromJson(json['version_android'])
        : null;
    versionIos = json['version_ios'] != null
        ? DeviceVersion.fromJson(json['version_ios'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (versionAndroid != null) {
      data['version_android'] = versionAndroid!.toJson();
    }
    if (versionIos != null) {
      data['version_ios'] = versionIos!.toJson();
    }
    return data;
  }
}

class DeviceVersion {
  String? version;
  int? isForced;

  DeviceVersion({this.version, this.isForced});

  DeviceVersion.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    isForced = json['is_forced'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['is_forced'] = isForced;
    return data;
  }
}

class PromotionPopup {
  int? id;
  String? image;
  int? showEveryTime;

  PromotionPopup({this.id, this.image, this.showEveryTime});

  PromotionPopup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    showEveryTime = json['show_every_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['show_every_time'] = showEveryTime;
    return data;
  }
}
