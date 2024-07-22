import { Router } from "express";

const authRoutes = Router();

authRoutes.get("/login", (req, res) => {
    return res.status(200).json({ message: "Login" });
});

export default authRoutes;
