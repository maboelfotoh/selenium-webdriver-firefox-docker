/*
 * Derived from https://www.selenium.dev/documentation/en/ [2020-07-18]
 * Usage: node sample
 */

const {Builder, By, Key, until} = require('selenium-webdriver');

var firefox = require('selenium-webdriver/firefox');

(async function example() {
    var options = new firefox.Options();
    options.addArguments("-headless");
    let driver = await new Builder().forBrowser('firefox').setFirefoxOptions(options).build();
    try {
        // Navigate to Url
        await driver.get('https://www.google.com');

        // Enter text "cheese" and perform keyboard action "Enter"
        await driver.findElement(By.name('q')).sendKeys('cheese', Key.ENTER);

        let firstResult = await driver.wait(until.elementLocated(By.css('h3')), 10000);

        console.log(await firstResult.getAttribute('textContent'));
    }
    finally{
        driver.quit();
    }
})();
