package routers

import (
	"dealls-prototype/controllers"
	"github.com/astaxie/beego"
)

func init() {
	ns :=
		beego.NewNamespace("/1.0",
			beego.NSNamespace("/users",
				beego.NSRouter("/register", &controllers.UserController{}, "post:Register"),
				beego.NSRouter("/login", &controllers.UserController{}, "post:Login"),
			),
		)

	beego.AddNamespace(ns)
}
