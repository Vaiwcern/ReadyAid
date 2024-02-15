package routes

import (
	"server/controllers"

	"github.com/labstack/echo/v4"
)

func RegisterUserRoutes(e *echo.Echo) {
	e.POST("/user/get_user", controllers.GetUser)
	e.POST("/user/get_profile", controllers.GetProfile)
}
