import createApp from "./app";
import { logBlue, logGreen, logWhite } from "./utils/log-messages";

const app = createApp();
const port = process.env.SERVER_PORT || 3333;

app.listen(port, () => {
    logWhite("----------------------------------------------------");
    logBlue(`🔥 Server running in http://localhost:${port}/api`);
    logGreen(`📖 Swagger API-Docs http://localhost:${port}/api-docs/`);
    logWhite("----------------------------------------------------");
});
