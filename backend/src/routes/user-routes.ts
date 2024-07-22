import { Router } from "express";

const userRoute = Router();

userRoute.get("/user", (req, res) => {
    return res.status(200).json({ message: "User" });
});

export default userRoute;
