const express = require("express");
const controller = require("../controller/controller");
const router = express.Router();
router.get("/users", controller.getUsers);
router.post("/addNewData", controller.addNewData);
router.put("/updateData", controller.updateData);
router.delete("/deleteData", controller.deleteData);
module.exports = router;
