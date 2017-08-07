install.packages("httr")
install.packages("jsonlite")
install.packages("httpuv")
library(httr)
library(jsonlite)
library(httpuv)

# 1. Find OAuth settings for github:

#    http://developer.github.com/v3/oauth/

oauth_endpoints("github")



# 2. To make your own application, register at at

#    https://github.com/settings/applications. Use any URL for the homepage URL

#    (http://github.com is fine) and  http://localhost:1410 as the callback url

#

#    Replace your key and secret below.

myapp <- oauth_app(appname = "github",

  key = "85507793f3965543d0f7",

  secret = "24ec41a6788c83cd638b56f7d296fa48baed4e30")



# 3. Get OAuth credentials

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)



# 4. Use API

gtoken <- config(token = github_token)

req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

# take action on http error
stop_for_status(req)

#extract content from a request

json1 = content(req)

#convert to a data.frame

gitDF = jsonlite::fromJSON(jsonlite::toJSON(json1))


# Subset data.frame
gitDF[gitDF$full_name == "jtleek/datasharing", "created_at"]
