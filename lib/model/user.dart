///用户登录成功后返回的用户实体
class User {
  int uid; //用户id
  String token; //登录token
  String phone; //手机号
  String email; //邮箱
  String avtar; //头像
  int sex; //性别 0–保密 1–男 2–女
  String city; //城市 江西省-吉安市-万安县
  String sign; //个性签名
  int status; // 用户状态 0–正常 1–异常
  String logo; //用户标签

  User.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        token = json["token"],
        email = json["email"],
        avtar = json["avtar"],
        sex = json["sex"],
        city = json["city"],
        sign = json["sign"],
        status = json["status"],
        logo = json["logo"];
}
