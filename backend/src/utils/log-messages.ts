import chalk from "chalk";

export const logBlue = (message: string) => {
    return console.log(chalk.blueBright(message));
};

export const logGreen = (message: string) => {
    return console.log(chalk.greenBright(message));
};

export const logRed = (message: string) => {
    return console.log(chalk.redBright(message));
};

export const logWhite = (message: string) => {
    return console.log(chalk.whiteBright(message));
};
