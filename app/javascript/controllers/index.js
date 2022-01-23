// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AlertController from "./alert_controller.js"
application.register("alert", AlertController)

import ApplicationController from "./application_controller.js"
application.register("application", ApplicationController)

import DragController from "./drag_controller.js"
application.register("drag", DragController)

import DropdownController from "./dropdown_controller.js"
application.register("dropdown", DropdownController)

import FormController from "./form_controller.js"
application.register("form", FormController)

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)

import NotificationsController from "./notifications_controller.js"
application.register("notifications", NotificationsController)

import SlideoverController from "./slideover_controller.js"
application.register("slideover", SlideoverController)
