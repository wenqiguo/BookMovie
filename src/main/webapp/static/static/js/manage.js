function init_superAdmin() {
    var user_json = JSON.parse(localStorage.getItem("userJson"));
    var user_role = user_json.userRole;  //身份验证
    var nav = $(".nav").find("ul");
    var html;
    if(user_json.userRole == 1){

        html = "<a class=\"cardId\">订单管理</a>";
        nav-next.append(html);
    }
    function managePage(){
        localStorage.setItem("cardId",0);
    }

}
function initChanage() {
    init_superAdmin()

}