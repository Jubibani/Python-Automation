﻿# Import Selenium WebDriver module
Import-Module Selenium

# Set the path to ChromeDriver (change it if you have to)
# $chromeDriverPath = "C:\selenium-selenium-4.18.0"
# Start ChromeDriver process
Start-Process -FilePath "C:\selenium-selenium-4.18.0\chromedriver.exe" -WindowStyle Hidden
# Create ChromeOptions instance and set unhandledPromptBehavior to ignore
$chromeOptions = New-Object OpenQA.Selenium.Chrome.ChromeOptions
$chromeOptions.AddArgument("--unhandledPromptBehavior=ignore")
$chromeOptions.AddArgument("--incognito")  # Added incognito argument here

# Add user agent and disable automation flags to mimic a real user
$chromeOptions.AddArgument("--user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36")
$chromeOptions.AddArgument("--disable-blink-features=AutomationControlled")


# # Create a new ChromeDriver instance with ChromeOptions
# $driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($chromeDriverPath, $chromeOptions)

function delay {
    #im adding a delay. Displaying the count down with a for loop since powshell doesnt have a built-in countdown.
    Write-Host "implementing delay"
    $sleepDuration = 2
    for ($i = $sleepDuration; $i -ge 0; $i--) {
        Write-Host "Waiting... $($i)s remaining"
        Start-Sleep -Seconds 1
    }
    Write-Host "done delaying"
}
function switchWindow {
    # Switch to the newly opened window or frame, also this will act as the delay
$driver.SwitchTo().Window($driver.WindowHandles[-1])
}
function loginToUcCanvasUsingQuickie{
    $driver.Navigate().GoToUrl("https://uc-bcf.instructure.com/")
    
    #implement delay to wait for booting process
    delay
    Write-Host "delaying"
    #we enter the school email for our canvas
    Write-Host "Entering School Email"
    $emailSchool = $driver.FindElementById("i0116")
    $emailSchool.SendKeys("cao5224@students.uc-bcf.edu.ph")

    #click next button after entering my gmail
    Write-Host "Clicking Next Button"
    $enterNextButton = $driver.FindElementById("idSIButton9")
    $enterNextButton.Click()

    Write-Host "Switchin to another Window"
    switchWindow

    #enter password
    Write-Host "Entering School Password"
    $emailSchoolPass = $driver.FindElementById("i0118")
    $emailSchoolPass.SendKeys("Jubibi'sstrawbibi")

    #click next button to submit to login
    Write-Host "Clicking Next Button"
    $enterNextButton = $driver.FindElementById("idSIButton9")
    $enterNextButton.Click()

    #click yes button
    Write-Host "delay with 2 seconds"
    Start-Sleep -Seconds 1
    Write-Host "Clicking 'Yes' Button"
    $enterNextButton = $driver.FindElementById("idSIButton9")
    $enterNextButton.Click()

    Write-Host "you should be logged in to UC Canvas By Now!"

    Write-Host "delay with 2 seconds for upcoming boot site"
    Start-Sleep -Seconds 2
}
function loginToClaudeAi {
    Write-Host "delay with 2 seconds for upcoming boot site"
    Start-Sleep -Seconds 2
    # # Make new window for my boy claude
    $driver.ExecuteScript("window.open();")

    switchWindow

    $driver.Navigate().GoToUrl("https://claude.ai/login");

    delay

    #loginCredentials
    $emailClaudeField = $driver.FindElementById("email")
    $emailClaudeField.SendKeys("strawberryloli3@gmail.com")

    Write-Host "gmail for claude has been entered!"

    #click the continue with google button
    $signInClaudeButton = $driver.FindElementByXPath("//div[contains(text(),'Continue with Google')]")
    $signInClaudeButton.Click()



}
# function loginToGithubUsingQuickie {
#     # Open a new browser window
#     $driver.ExecuteScript("window.open();")

#     # Switch to the newly opened window
#     switchWindow

#     $driver.Navigate().GoToUrl("https://github.com/")
#     #implement delay to wait for booting process
#     delay
#     # Click the "Sign in" button
#     $signInButton = $driver.FindElementByClassName("d-inline-block")
#     $signInButton.Click()
#     Write-Host "Sign-in Button Clicked"
#     Write-Host "signinButton Clicked!"

#     # Wait for the login field to be available
#     Start-Sleep -Seconds 2

#     #username and password for my github
#     $loginField = $driver.FindElementById("login_field")
#     $loginField.SendKeys("Jubibani")

#     $passwordField = $driver.FindElementById("password")
#     $passwordField.SendKeys("Jubibi'sstrawbibi")

#     Write-Host "Username and password successfully entered!"

#     # Click the Sign-in button
#     $signInButton = $driver.FindElementByClassName("btn-primary")
#     $signInButton.Click()
#     Write-Host "Sign-in Button Clicked"

#     Write-Host "you should be logged in to your Github By Now!"

#     Write-Host "delay with 2 seconds for upcoming boot site"
#     Start-Sleep -Seconds 2
# }


# function loginToNotionUsingQuickie {
# # Create ChromeOptions instance for the new window
#     # $newChromeOptions = New-Object OpenQA.Selenium.Chrome.ChromeOptions
#     # $newChromeOptions.AddArgument("--incognito")

#     # # Create a new ChromeDriver instance with ChromeOptions for the new window
#     # $newDriver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($chromeDriverPath, $newChromeOptions)
#     $firefoxDriverPath = "C:\geckodriver-v0.34.0-win64\geckodriver.exe"

#     #test the file a bit
#     Test-Path $firefoxDriverPath
    
#     # Start GeckoDriver process
#     Start-Process -FilePath $firefoxDriverPath -WindowStyle Hidden

#     # Create FirefoxOptions instance for the new window
#     $firefoxOptions = New-Object OpenQA.Selenium.Firefox.FirefoxOptions
# #add incognito here
#     # Create a new FirefoxDriver instance with FirefoxOptions for the new window
#     $newDriver = New-Object OpenQA.Selenium.Firefox.FirefoxDriver($firefoxDriverPath, $firefoxOptions)
  
#     # Navigate to the website where you want to log in (in the new window)
#     $newDriver.Navigate().GoToUrl("https://www.notion.so/login")

#     # This command sets a breakpoint on the Server variable in the Sample.ps1 script.
#     exit
#     #im adding a delay. Displaying the count down with a for loop since powshell doesnt have a built-in countdown.
#     delay
#     #click for the gmail butto
#     $continueWithGmailButton = $newDriver.FindElementByXPath("//*[@id='notion-app']/div/div[1]/div/main/div[1]/section/div/div/div/div[2]/div[1]/div[1]/div[1]/div")
#     Write-Host "Continuing with Gmail Account"
#     $continueWithGmailButton.Click()

#     Write-Host "button Clicked"
#     delay
#     # Switch to the new window
#     $newdriver.SwitchTo().Window($newdriver.WindowHandles[-1])

#    # Find the email input field and enter the Gmail address
#     $emailInputField = $newDriver.FindElementByXPath("//input[@id='identifierId']")
#     Write-Host "Email Input has been Identified"
#     # Enter the Gmail
#     $emailInputField.SendKeys("strawberryloli3@gmail.com")
#     Write-Host "gmail successfully entered"
#     # Find the "Next" button by class name
#     delay

#     # # button element
#     # $nextButton = $newDriver.FindElementByClassName("VfPpkd-LgbsSe")
#     # $nextButton.Click()
#     # Write-Host "button element clicked!"
#     # #nextDivButton-1 element
#     # $nextDivButton1 = $newDriver.FindElementByClassName("VfPpkd-Jh9lGc")
#     # $nextDivButton1.Click()
#     # Write-Host "nextDivButton-1 clicked!"
#     # #nextDivButton-2 element
#     # $nextDivButton2 = $newDriver.FindElementByClassName("VfPpkd-J1Ukfc-LhBDec")
#     # $nextDivButton2.Click()
#     # Write-Host "nextDivButton-2 clicked!"
#     # #nextDivButton-3 element
#     # $nextDivButton3 = $newDriver.FindElementByClassName("VfPpkd-RLmnJb")
#     # $nextDivButton3.Click()
#     # Write-Host "nextDivButton-3 clicked!"
#     # $nextSpanButton = $newDriver.FindElementByClassName("VfPpkd-vQzf8d")
#     # $nextSpanButton.Click()
#     # Write-Host "Next button clicked!"

#     # Find the div wrapping the button by its id
#     $nextDiv = $newDriver.FindElementById("identifierNext")

#     # Click the div
#     $nextDiv.Click()

#     Write-Host "JsController clicked!"


#     Write-Host "you should be logged in to your Notion By Now!"

#     Write-Host "delay with 2 seconds for upcoming boot site"
#     Start-Sleep -Seconds 2
    
# }

function loginToNotionUsingQuickie {
    # Set the path to geckodriver
    $firefoxDriverPath = "C:\geckodriver-v0.34.0-win64\geckodriver.exe"

    # Check if geckodriver exists
    if (Test-Path $firefoxDriverPath) {
        Write-Host "Geckodriver found at $firefoxDriverPath"
        
        # Create FirefoxOptions
        $firefoxOptions = New-Object OpenQA.Selenium.Firefox.FirefoxOptions
        # Add any additional options here
        
        # Start GeckoDriver process
        Start-Process -FilePath $firefoxDriverPath -WindowStyle Hidden
        
        # Create FirefoxDriver instance
        $driver = New-Object OpenQA.Selenium.Firefox.FirefoxDriver($firefoxDriverPath, $firefoxOptions)
        
        # Navigate to Notion login page
        $driver.Navigate().GoToUrl("https://www.notion.so/login")
        
        # Delay for 2 seconds
        Start-Sleep -Seconds 2
        
        # You can add further actions here, such as interacting with elements on the page
        
        # Close the driver
        $driver.Quit()
    } else {
        Write-Host "Geckodriver not found at $firefoxDriverPath"
    }
}
# loginToUcCanvasUsingQuickie 
# loginToClaudeAi
# loginToGithubUsingQuickie
loginToNotionUsingQuickie  